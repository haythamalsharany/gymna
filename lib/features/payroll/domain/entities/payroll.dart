import 'package:equatable/equatable.dart';

class Payroll extends Equatable {
  final int payrollId;
  final int payrollAmount;
  final int payrollOwnerId;
  final String payrollOwnerName;
  final DateTime payrollDate;

  Payroll({
    required this.payrollId,
    required this.payrollAmount,
    required this.payrollOwnerId,
    required this.payrollOwnerName,
    required this.payrollDate,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
