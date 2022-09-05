import 'package:gymna/features/payroll/domain/entities/payroll.dart';

class PayrollModel extends Payroll {
  PayrollModel({
    required int payrollId,
    required int payrollAmount,
    required int payrollOwnerId,
    required String payrollOwnerName,
    required DateTime payrollDate,
  }) : super(
          payrollId: payrollId,
          payrollAmount: payrollAmount,
          payrollOwnerId: payrollOwnerId,
          payrollOwnerName: payrollOwnerName,
          payrollDate: payrollDate,
        );


  factory PayrollModel.fromJson(Map<String, dynamic> json) {
    return PayrollModel(
      payrollId: json['payrollId'],
      payrollAmount: json['payrollAmount'],
      payrollOwnerId: json['payrollOwnerId'],
      payrollOwnerName: json['payrollOwnerName'],
      payrollDate: json['payrollDate'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'payrollId': payrollId,
      'payrollAmount': payrollAmount,
      'payrollOwnerId': payrollOwnerId,
      'payrollOwnerName': payrollOwnerName,
      'payrollDate': payrollDate,

    };
  }
}
