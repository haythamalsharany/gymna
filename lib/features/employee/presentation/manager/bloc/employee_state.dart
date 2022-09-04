part of 'employee_bloc.dart';

abstract class EmployeeState extends Equatable {
  const EmployeeState();
  
  @override
  List<Object> get props => [];
}

class EmployeeInitial extends EmployeeState {}




class AddUpdateEmployee extends EmployeeState {}

class LoadingAddUpdateEmployeeState extends EmployeeState {}

class ErrorAddUpdateEmployeeState extends EmployeeState {
  final String message;

  const ErrorAddUpdateEmployeeState({required this.message});

  @override
  List<Object> get props => [message];
}

class MessageAddUpdateEmployeeState extends EmployeeState {
  final String message;

  const MessageAddUpdateEmployeeState({required this.message});

  @override
  List<Object> get props => [message];
}
class LoadingEmployeesState extends EmployeeState {}

class LoadedEmployeesState extends EmployeeState {
  final List< Employee>  employees;

  const LoadedEmployeesState({required this. employees});

  @override
  List<Object> get props => [employees];
}

class ErroremployeessState extends EmployeeState {
  final String message;

  const ErroremployeessState({required this.message});

  @override
  List<Object> get props => [message];
}


