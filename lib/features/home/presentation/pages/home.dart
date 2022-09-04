import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:gymna/features/employee/domain/entities/employee.dart';
import 'package:gymna/features/employee/presentation/manager/bloc/employee_bloc.dart';
import 'package:gymna/features/employee/presentation/pages/employees_page.dart';
import 'package:gymna/features/manage_memberships/presentation/pages/memberships.dart';

import '../../../reports/presentation/pages/main_report.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _MyHomeState();
}

class _MyHomeState extends State<Home> {
  int _selectedIndex = 0;
  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
  }

  static const List<Widget> _pages = <Widget>[MembershipsPage(), MainReport()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.add,
          ),
          onPressed: () async {
            Employee employee = const Employee(
              dateOfGiveJob: '2-2-2022',
              employeeAddress: 'sana\'a',
              employeeAge: '25',
              employeeId: 3,
              employeeMaritalStatus: 'single',
              employeeMobile: '77777777',
              employeeName: 'haytham',
              employeeType: 'poss',
            );
            BlocProvider.of<EmployeeBloc>(context)
                .add(AddEmployeeEvent(employee));
            Get.to(const EmployeesPage());
          },
        ),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.card_membership),
            label: 'memberships',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'reports',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
