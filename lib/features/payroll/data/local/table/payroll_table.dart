import 'package:gymna/features/payroll/data/local/models/payroll_model.dart';
import 'package:gymna/features/payroll/domain/entities/payroll.dart';
import 'package:hive/hive.dart';
part 'payroll_table.g.dart';
@HiveType(typeId: 2)
class PayrollTable extends PayrollModel {
  @override
  @HiveField(0)
  // ignore: overridden_fields
  final int payrollId;
  @override
  @HiveField(1)
  // ignore: overridden_fields
  final int payrollOwnerId;
  @override
  @HiveField(2)
  // ignore: overridden_fields
  final int payrollAmount;
  @override
  @HiveField(3)
  // ignore: overridden_fields
  final String payrollOwnerName;
  @override
  @HiveField(4)
  // ignore: overridden_fields
  final DateTime payrollDate;

  PayrollTable(
      {required this.payrollId,
      required this .payrollAmount,
      required this.payrollOwnerId,
      required this .payrollOwnerName,
      required this .payrollDate}) : super(
    payrollAmount:payrollAmount ,
    payrollDate: payrollDate,
    payrollId: payrollId,
    payrollOwnerId:payrollOwnerId ,
    payrollOwnerName: payrollOwnerName
     );


  factory PayrollTable.fromMembership(Payroll payroll) {
    return PayrollTable(
      payrollId: payroll.payrollId,
      payrollAmount: payroll.payrollAmount,
      payrollOwnerId: payroll.payrollOwnerId,
      payrollOwnerName: payroll.payrollOwnerName,
      payrollDate: payroll.payrollDate,
    );
  }
}
