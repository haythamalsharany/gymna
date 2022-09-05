


import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:gymna/features/payroll/domain/entities/payroll.dart';
import 'package:hive/hive.dart';

import '../models/payroll_model.dart';

abstract class PayrollLocalDataSource {
  Future<List<PayrollModel>> getAllPayrolls();
  Future<Unit> addPayroll(PayrollModel payrollModel);
  Future<Unit> updatePayroll(PayrollModel payrollModel);
  Future<PayrollModel> getPayroll(int  payrollId);
}

class PayrollHiveDataSource extends PayrollLocalDataSource{
  @override
  Future<Unit> addPayroll(PayrollModel payrollModel) async {
  Box box= await Hive.openBox('payrollsBox');
  box.put(payrollModel.payrollId, payrollModel);
  return unit;
  }

  @override
  Future<List<PayrollModel>> getAllPayrolls() async {
    Box box= await Hive.openBox('payrollsBox');
    Iterable payrollsIds=box.keys;
    List<PayrollModel>  payrolls=[];
    for (var payrollsId in payrollsIds) {
      PayrollModel payroll =box.get(payrollsId);
      payrolls.add(payroll);

    }

    return payrolls;
  }

  @override
  Future<PayrollModel> getPayroll(int payrollId) async {
    Box box= await Hive.openBox('payrollsBox');
    PayrollModel payroll =box.get(payrollId);
    return payroll;
  }

  @override
  Future<Unit> updatePayroll(PayrollModel payrollModel) async {
    Box box= await Hive.openBox('payrollsBox');
    box.put(payrollModel.payrollId, payrollModel);
    return unit;
  }

}