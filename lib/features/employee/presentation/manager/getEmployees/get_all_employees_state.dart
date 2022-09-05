part of 'get_all_employees_bloc.dart';

abstract class GetAllEmployeesState extends Equatable {
  const GetAllEmployeesState();
  
  @override
  List<Object> get props => [];
}

class GetAllEmployeesInitial extends GetAllEmployeesState {}
class LoadingEmployeesState extends GetAllEmployeesState {}

class LoadedEmployeesState extends GetAllEmployeesState {
  final List< Employee>  employees;

  const LoadedEmployeesState({required this. employees});

  @override
  List<Object> get props => [employees];
}

class ErroremployeessState extends GetAllEmployeesState {
  final String message;

  const ErroremployeessState({required this.message});

  @override
  List<Object> get props => [message];
}