import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/membership_entity.dart';
import '../repositories/membership_repositry.dart';

class GetMembershipsUsecase {
  final MembershipRepositry repository;

  GetMembershipsUsecase(this.repository);

  Future<Either<Failure, List<Membership>>> call() async {
    return await repository.getMemberships();
  }
}
