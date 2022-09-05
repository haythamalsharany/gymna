

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/strings/failures.dart';
import '../../../../../core/strings/messages.dart';
import '../../../domain/use_cases/add_payroll_use_case.dart';
import '../../../domain/use_cases/update_payroll_use_case.dart';
import 'add_update_payroll_event.dart';
import 'add_update_payroll_state.dart';

class AddUpdatePayrollBloc extends Bloc<AddUpdatePayrollEvent, AddUpdatePayrollState> {

  final AddPaylorUsecase addPaylorUsecase;
  final UpdatePaylorUsecase updatePaylorUsecase;
  AddUpdatePayrollBloc({required this.updatePaylorUsecase, required this.addPaylorUsecase}) : super(AddUpdatePayrollInitial()) {
    on<AddUpdatePayrollEvent>((event, emit) async {
      if(event is AddPayrollEvent){
        emit(LoadingAddUpdatePayrollState());
        final failureOrDoneMessage =
            await addPaylorUsecase(event.payroll);
        emit(_eitherDoneMessageOrErrorState(failureOrDoneMessage, ADD_SUCCESS_MESSAGE));
      }else if(
      event is UpdatePayrollEvent){
        emit(LoadingAddUpdatePayrollState());
        final failureOrDoneMessage =
        await updatePaylorUsecase(event.payroll);
        emit(_eitherDoneMessageOrErrorState(failureOrDoneMessage, ADD_SUCCESS_MESSAGE));
      }

    });
  }


  AddUpdatePayrollState _eitherDoneMessageOrErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
          (failure) => ErrorAddUpdatePayrollState(
        message: _mapFailureToMessage(failure),
      ),
          (_) => MessageAddUpdatePayrollState(message: message),
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
