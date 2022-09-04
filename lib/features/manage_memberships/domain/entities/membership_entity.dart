import 'package:equatable/equatable.dart';

class Membership extends Equatable {
  final int id;
  final String title;
  final String ownerName;
  final String ownerMobile;
  final String dateToExpair;

  const Membership(
      {this.id = 0,
      required this.title,
      required this.ownerName,
      required this.ownerMobile,
      required this.dateToExpair});

  @override
  List<Object?> get props => [];
}
