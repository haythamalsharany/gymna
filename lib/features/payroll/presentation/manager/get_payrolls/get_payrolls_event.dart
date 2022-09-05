part of 'get_payrolls_bloc.dart';

abstract class GetPayrollsEvent extends Equatable {
  const GetPayrollsEvent();
  @override
  List<Object> get props => [];
}

class RefreshPayrollsEvent extends GetPayrollsEvent {}

class GetAllPayrollsEvent extends GetPayrollsEvent {
  const GetAllPayrollsEvent();
}

class GetPayrollEvent extends GetPayrollsEvent {
  final int payrollId;
  const GetPayrollEvent(this.payrollId);
  @override
  List<Object> get props => [payrollId];
}
