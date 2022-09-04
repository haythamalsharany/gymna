import 'package:gymna/features/manage_memberships/data/local/tables/memberships_table.dart';
import 'package:gymna/features/manage_memberships/domain/entities/membership_entity.dart';
import 'package:gymna/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:gymna/features/manage_memberships/domain/repositories/membership_repositry.dart';

import '../local/data_sources/membership_local_data_source.dart';

class MembershipsRepositoryImpl extends MembershipRepositry {
  MembershipsRepositoryImpl({required this.localDataSource});

  //final MembershipsRemoteDataSource remoteDataSource;
  final MembershipLocalDataSource localDataSource;

  @override
  Future<Either<Failure, Unit>> addMembership(Membership membership) async {
    try {
      final table = MembershipsTable.fromMembership(membership);
      print(table);
      final response = await localDataSource
          .cacheMembership(MembershipsTable.fromMembership(membership));
      return const Right(unit);
    } on Exception {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteMembership(int membershipId) {
    // TODO: implement deleteMembership
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Membership>>> getMemberships() async {
    try {
      final response = await localDataSource.getCachedMembership();
      return Right(response);
    } on Exception {
      return Left(CacheFailure());
    }
  }
}
