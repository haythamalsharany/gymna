

import 'package:equatable/equatable.dart';

import '../../../domain/entities/payroll.dart';

abstract class AddUpdatePayrollEvent extends Equatable {
  const AddUpdatePayrollEvent();
  List<Object> get props => [ ];
}


class AddPayrollEvent extends AddUpdatePayrollEvent {
  final Payroll payroll;

  const AddPayrollEvent(this.payroll);

  @override
  List<Object> get props => [payroll];
}

class UpdatePayrollEvent extends AddUpdatePayrollEvent {
  final Payroll payroll;

  const UpdatePayrollEvent(this.payroll);

  @override
  List<Object> get props => [payroll];
}

