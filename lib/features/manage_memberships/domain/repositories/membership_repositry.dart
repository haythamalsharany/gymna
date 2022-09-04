import 'package:dartz/dartz.dart';
import 'package:gymna/core/error/failures.dart';
import 'package:gymna/features/manage_memberships/domain/entities/membership_entity.dart';

abstract class MembershipRepositry {
  Future<Either<Failure, Unit>> addMembership(Membership membership);
  Future<Either<Failure, List<Membership>>> getMemberships();
  Future<Either<Failure, Unit>> deleteMembership(int membershipId);
}
