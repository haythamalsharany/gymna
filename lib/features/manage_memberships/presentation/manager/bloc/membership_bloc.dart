import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gymna/features/manage_memberships/domain/entities/membership_entity.dart';
import 'package:gymna/features/manage_memberships/domain/use_cases/add_membeship_use_case.dart';
import 'package:gymna/features/manage_memberships/domain/use_cases/get_membeships_use_case.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/strings/failures.dart';
import '../../../../../core/strings/messages.dart';

part 'membership_event.dart';
part 'membership_state.dart';

class MembershipBloc extends Bloc<MembershipEvent, MembershipState> {
  final AddMembershipUsecase addMembershipUsecase;
  final GetMembershipsUsecase getMembershipsUsecase;

  MembershipBloc(
      {required this.addMembershipUsecase, required this.getMembershipsUsecase})
      : super(MembershipInitial()) {
    on<MembershipEvent>((event, emit) async {
      if (event is GetMembershipsEvent) {
        emit(LoadingMembershipsState());

        final failureOrMemberships = await getMembershipsUsecase();
        emit(_mapFailureOrMembershipsToState(failureOrMemberships));
      } else if (event is RefreshMembershipsEvent) {
        emit(LoadingMembershipsState());

        final failureOrMemberships = await getMembershipsUsecase();
        emit(_mapFailureOrMembershipsToState(failureOrMemberships));
      } else if (event is AddMembershipEvent) {
        emit(LoadingAddDeleteUpdateMembershipState());

        final failureOrDoneMessage =
            await addMembershipUsecase(event.membership);

        emit(_eitherDoneMessageOrErrorState(
            failureOrDoneMessage, ADD_SUCCESS_MESSAGE));
      }
    });
  }
  MembershipState _mapFailureOrMembershipsToState(
      Either<Failure, List<Membership>> either) {
    return either.fold(
      (failure) =>
          ErrorMembershipsState(message: _mapFailureToMessage(failure)),
      (memberships) => LoadedMembershipsState(
        memberships: memberships,
      ),
    );
  }

  MembershipState _eitherDoneMessageOrErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
      (failure) => ErrorAddDeleteUpdateMembershipState(
        message: _mapFailureToMessage(failure),
      ),
      (_) => MessageAddDeleteUpdateMembershipState(message: message),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
