



import 'package:dartz/dartz.dart';
import 'package:gymna/core/error/failures.dart';
import 'package:gymna/features/payroll/data/local/models/payroll_model.dart';
import 'package:gymna/features/payroll/data/local/table/payroll_table.dart';
import 'package:gymna/features/payroll/domain/entities/payroll.dart';
import 'package:gymna/features/payroll/domain/repositories/payroll_repositry.dart';

import '../local/data_sources/payroll_local_data_source.dart';

class PayrollRepositryImpl extends PayrollRepositry{
  final PayrollLocalDataSource localDataSource;

  PayrollRepositryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, Unit>> addPayroll(Payroll payroll)  async {
     try{
       var respons= await localDataSource.addPayroll(PayrollTable.fromMembership(payroll));
       return const Right(unit);
     }on Exception {
       return left(CacheFailure());
     }
  }

  @override
  Future<Either<Failure, Payroll>> getPayroll(int payrollId) async {
    try{
      PayrollModel respons= await localDataSource.getPayroll(payrollId);
      return  Right(respons);
    }on Exception {
      return left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<Payroll>>> getPayrolls() async {
    try{
      List<PayrollModel> respons= await localDataSource.getAllPayrolls();
      return  Right(respons);
    }on Exception {
      return left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePayroll(Payroll payroll) async {
    try{
       await localDataSource.updatePayroll(PayrollTable.fromMembership(payroll));
      return  const Right(unit);
    }on Exception {
      return left(CacheFailure());
    }
  }

}