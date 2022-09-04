part of 'membership_bloc.dart';

abstract class MembershipState extends Equatable {
  const MembershipState();
  
  @override
  List<Object> get props => [];
}

class MembershipInitial extends MembershipState {}
class AddDeleteUpdateMembership extends MembershipState {}
class LoadingAddDeleteUpdateMembershipState extends MembershipState {}

class ErrorAddDeleteUpdateMembershipState extends MembershipState {
  final String message;

  const ErrorAddDeleteUpdateMembershipState({required this.message});

  @override
  List<Object> get props => [message];
}

class MessageAddDeleteUpdateMembershipState extends MembershipState {
  final String message;

  const MessageAddDeleteUpdateMembershipState({required this.message});

  @override
  List<Object> get props => [message];
}
class LoadingMembershipsState extends MembershipState {}

class LoadedMembershipsState extends MembershipState {
  final List< Membership>  memberships;

  const LoadedMembershipsState({required this. memberships});

  @override
  List<Object> get props => [memberships];
}

class ErrorMembershipsState extends MembershipState {
  final String message;

  const ErrorMembershipsState({required this.message});

  @override
  List<Object> get props => [message];
}
