



  import 'package:dartz/dartz.dart';
import 'package:gymna/features/payroll/domain/entities/payroll.dart';
import 'package:gymna/features/payroll/domain/repositories/payroll_repositry.dart';

import '../../../../core/error/failures.dart';

class AddPaylorUsecase {
  final PayrollRepositry repositry;

  AddPaylorUsecase({required this.repositry});

  Future<Either<Failure, Unit>> call(Payroll payroll) async {
    return await repositry.addPayroll(payroll);
  }
  }