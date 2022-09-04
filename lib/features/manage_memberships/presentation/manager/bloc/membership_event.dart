part of 'membership_bloc.dart';

abstract class MembershipEvent extends Equatable {
  const MembershipEvent();

  @override
  List<Object> get props => [];
}

class AddMembershipEvent extends MembershipEvent {
  final Membership membership;

  const AddMembershipEvent(this.membership);
  
  @override
  List<Object> get props => [membership];
}

class GetMembershipsEvent extends MembershipEvent {

}

class RefreshMembershipsEvent extends MembershipEvent {}
