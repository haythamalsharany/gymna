import 'package:dartz/dartz.dart';
import 'package:gymna/features/manage_memberships/data/local/models/membership_model.dart';
import 'package:hive/hive.dart';

abstract class MembershipLocalDataSource {
  Future<List<MembershipModel>> getCachedMembership();
  Future<Unit> cacheMembership(MembershipModel membershipModel);
}

class MembershipLocalDataSourceImpl extends MembershipLocalDataSource {
  @override
  Future<List<MembershipModel>> getCachedMembership() async {
    final membershipBox = await Hive.openBox('membershipBox');

    print("membershipBox.length");
    print(membershipBox.length);
    final membershipIds = membershipBox.keys;
    List<MembershipModel> memberships = [];
    for (var membershipId in membershipIds) {
      final membership = membershipBox.get(membershipId);
      if (membership != null) {
        memberships.add(membership);
      }
    }
    return memberships;
  }

  @override
  Future<Unit> cacheMembership(MembershipModel membershipModel) async {
    final membershipBox = await Hive.openBox('membershipBox');
    await membershipBox.put(membershipModel.id, membershipModel);
    print(membershipModel);
    return unit;
  }
}
