import 'package:dartz/dartz.dart';
import 'package:gymna/features/manage_memberships/domain/entities/membership_entity.dart';
import 'package:gymna/features/manage_memberships/domain/repositories/membership_repositry.dart';

import '../../../../core/error/failures.dart';

class AddMembershipUsecase {
  final MembershipRepositry repository;

  AddMembershipUsecase(this.repository);

  Future<Either<Failure, Unit>> call(Membership membership) async {
    return await repository.addMembership(membership);
  }
}
