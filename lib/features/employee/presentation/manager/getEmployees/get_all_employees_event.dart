part of 'get_all_employees_bloc.dart';

abstract class GetAllEmployeesEvent extends Equatable {
  const GetAllEmployeesEvent();

  @override
  List<Object> get props => [];
}

class RefreshEmployeesEvent extends GetAllEmployeesEvent {}

class GetEmployeesEvent extends GetAllEmployeesEvent {
  const GetEmployeesEvent();
}

class SearchEmployeesEvent extends GetAllEmployeesEvent {
  final String searchText;
  const SearchEmployeesEvent({required this.searchText});
}
