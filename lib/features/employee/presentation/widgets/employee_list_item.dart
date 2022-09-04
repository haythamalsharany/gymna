import 'package:flutter/material.dart';
import 'package:gymna/features/employee/domain/entities/employee.dart';

class EmployeeItemList extends StatelessWidget {
  final Employee employee;

  const EmployeeItemList({
    Key? key,
    required this.employee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffFFFFFF),
      padding: const EdgeInsets.only(bottom: 8.0, right: 0.0, left: 0.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        title: Text(employee.employeeName),
        leading: CircleAvatar(
          child: Text(employee.employeeAge),
        ),
        subtitle: Text(employee.employeeMobile),
        trailing: Column(
          children: [
            Text(employee.employeeType),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
