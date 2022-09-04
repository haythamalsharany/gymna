import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/membership_repositry.dart';

class DeleltMembershipUsecase {
  final MembershipRepositry repository;

  DeleltMembershipUsecase(this.repository);

  Future<Either<Failure, Unit>> call(int membershipId) async {
    return await repository.deleteMembership(membershipId);
  }
}
