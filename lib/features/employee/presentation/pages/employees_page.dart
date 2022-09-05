import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../../../manage_memberships/presentation/widgets/message_display_widget.dart';
import '../manager/getEmployees/get_all_employees_bloc.dart';
import '../widgets/employee_list_item.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({Key? key}) : super(key: key);

  @override
  State<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('my Stuff'),
        ),
        body: BlocBuilder<GetAllEmployeesBloc, GetAllEmployeesState>(
          builder: (context, state) {
            if (state is LoadedEmployeesState) {
              return RefreshIndicator(
                onRefresh: () => _onRefresh(context),
                child: ListView.builder(
                  itemCount: state.employees.length,
                  itemBuilder: ((context, index) => EmployeeItemList(
                        employee: state.employees[index],
                      )),
                ),
              );
            }
            if (state is LoadedEmployeesState) {
              return const LoadingWidget();
            } else if (state is ErroremployeessState) {
              return MessageDisplayWidget(message: state.message);
            } else {
              return const Center(
                child: Text('unknown error'),
              );
            }
          },
        ));
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<GetAllEmployeesBloc>(context).add(RefreshEmployeesEvent());
  }
}
