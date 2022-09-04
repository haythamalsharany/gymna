import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymna/features/manage_memberships/presentation/pages/memberships.dart';

import '../../../manage_memberships/presentation/pages/add_membership.dart';
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
            Get.to(const Addmembership());
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
