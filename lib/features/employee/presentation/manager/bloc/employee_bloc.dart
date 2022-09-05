import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/strings/failures.dart';
import '../../../../../core/strings/messages.dart';
import '../../../domain/entities/employee.dart';
import '../../../domain/use_cases/add_employee_use_case.dart';
import '../../../domain/use_cases/get_all_employee_use_case.dart';
import '../../../domain/use_cases/update_employee_use_case.dart';

part 'employee_event.dart';

part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {

  final AddEmployeeUsecase addEmployeeUseCase;
  
  final UpdateEmployeeUseCase updateEmployeeUseCase;

  EmployeeBloc(
      {required this.addEmployeeUseCase,
        
       required this.updateEmployeeUseCase,})
      : super(EmployeeInitial()) {
    on<EmployeeEvent>((event, emit) async {
       if(event is AddEmployeeEvent){
        emit(LoadingAddUpdateEmployeeState());
        final failureOrDoneMessage =
        await addEmployeeUseCase(event.employee);

        emit(_eitherDoneMessageOrErrorState(
            failureOrDoneMessage, ADD_SUCCESS_MESSAGE));
      }else if(event is UpdateEmployeeEvent){
        emit(LoadingAddUpdateEmployeeState());
        final failureOrDoneMessage =
        await updateEmployeeUseCase(event.employee);

        emit(_eitherDoneMessageOrErrorState(
            failureOrDoneMessage, ADD_SUCCESS_MESSAGE));
      }

    });
  }

 

  EmployeeState _eitherDoneMessageOrErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
          (failure) => ErrorAddUpdateEmployeeState(
        message: _mapFailureToMessage(failure),
      ),
          (_) => MessageAddUpdateEmployeeState(message: message),
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
