part of 'get_payrolls_bloc.dart';

abstract class GetPayrollsState extends Equatable {
  const GetPayrollsState();
  @override
  List<Object> get props => [];
}

class GetPayrollsInitial extends GetPayrollsState {
 
}

class LoadingPayrollsState extends GetPayrollsState {}

class LoadedPayrollsState extends GetPayrollsState {
  final List< Payroll>  payrolls;

  const LoadedPayrollsState({required this. payrolls});

  @override
  List<Object> get props => [payrolls];
}
class LoadedPayrollState extends GetPayrollsState {
  final Payroll  payroll;

  const LoadedPayrollState({required this. payroll});

  @override
  List<Object> get props => [payroll];
}
class ErrorPayrollsState extends GetPayrollsState {
  final String message;

  const ErrorPayrollsState({required this.message});

  @override
  List<Object> get props => [message];
}
