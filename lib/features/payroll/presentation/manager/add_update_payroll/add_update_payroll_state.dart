

import 'package:equatable/equatable.dart';

abstract class AddUpdatePayrollState extends Equatable {
  const AddUpdatePayrollState();
  @override
  List<Object> get props => [];
}

class AddUpdatePayrollInitial extends AddUpdatePayrollState {
  @override
  List<Object> get props => [];
}

class AddPayrollState extends AddUpdatePayrollState {}
class UpdatePayroll extends AddUpdatePayrollState {}

class LoadingAddUpdatePayrollState extends AddUpdatePayrollState {}

class ErrorAddUpdatePayrollState extends AddUpdatePayrollState {
  final String message;

  const ErrorAddUpdatePayrollState({required this.message});

  @override
  List<Object> get props => [message];
}

class MessageAddUpdatePayrollState extends AddUpdatePayrollState {
  final String message;

  const MessageAddUpdatePayrollState({required this.message});

  @override
  List<Object> get props => [message];
}
