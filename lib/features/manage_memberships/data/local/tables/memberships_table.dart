import 'package:gymna/features/manage_memberships/data/local/models/membership_model.dart';
import 'package:hive/hive.dart';

import '../../../domain/entities/membership_entity.dart';

part 'memberships_table.g.dart';

@HiveType(typeId: 0)
class MembershipsTable extends MembershipModel {
  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String title;
  @override
  @HiveField(2)
  final String ownerName;
  @override
  @HiveField(3)
  final String ownerMobile;
  @override
  @HiveField(4)
  final String dateToExpair;

  const MembershipsTable(
      {required this.title,
      required this.ownerName,
      required this.ownerMobile,
      required this.dateToExpair,
      required this.id})
      : super(
          dateToExpair: '',
          ownerMobile: '',
          ownerName: '',
          title: '',
          id: 0,
        );

  factory MembershipsTable.fromMembership(Membership membership) {
    return MembershipsTable(
      id: membership.id,
      title: membership.title,
      ownerName: membership.ownerName,
      ownerMobile: membership.ownerMobile,
      dateToExpair: membership.dateToExpair,
    );
  }
}
