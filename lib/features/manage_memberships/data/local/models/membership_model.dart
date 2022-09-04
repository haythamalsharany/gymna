import 'package:gymna/features/manage_memberships/domain/entities/membership_entity.dart';

class MembershipModel extends Membership {
  const MembershipModel({
    int? id,
    required String title,
    required String ownerName,
    required String ownerMobile,
    required String dateToExpair,
  }) : super(
            dateToExpair: dateToExpair,
            title: title,
            ownerMobile: ownerMobile,
            ownerName: ownerName);

  factory MembershipModel.fromJson(Map<String, dynamic> json) {
    return MembershipModel(
        id: json['id'],
        title: json['title'],
        ownerName: json['ownerName'],
        ownerMobile: json['ownerMobile'],
        dateToExpair: json['dateToExpair']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'ownerName': ownerName,
      ownerMobile: 'ownerMobile',
      dateToExpair: 'dateToExpair'
    };
  }
}
