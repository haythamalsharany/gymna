part of 'employee_bloc.dart';

abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();

  @override
  List<Object> get props => [];
}

class AddEmployeeEvent extends EmployeeEvent {
  final Employee employee;

  const AddEmployeeEvent(this.employee);

  @override
  List<Object> get props => [employee];
}

class UpdateEmployeeEvent extends EmployeeEvent {
  final Employee employee;

  const UpdateEmployeeEvent(this.employee);

  @override
  List<Object> get props => [employee];
}

class GetAllEmployeesEvent extends EmployeeEvent {
  GetAllEmployeesEvent();
}

class GetEmployeeEvent extends EmployeeEvent {
  final int employeeId;

  GetEmployeeEvent({required this.employeeId});
}

class RefreshEmployeesEvent extends EmployeeEvent {}
