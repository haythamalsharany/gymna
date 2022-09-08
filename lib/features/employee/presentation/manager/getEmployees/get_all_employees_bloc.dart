import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gymna/features/employee/domain/use_cases/search_use_case.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/strings/failures.dart';
import '../../../domain/entities/employee.dart';
import '../../../domain/use_cases/get_all_employee_use_case.dart';

part 'get_all_employees_event.dart';
part 'get_all_employees_state.dart';

class GetAllEmployeesBloc
    extends Bloc<GetAllEmployeesEvent, GetAllEmployeesState> {
  final GetAllEmployeesUseCase getAllEmployeesUseCase;
  
  GetAllEmployeesBloc(
      {
      required this.getAllEmployeesUseCase})
      : super(GetAllEmployeesInitial()) {
    on<GetAllEmployeesEvent>((event, emit) async {
      if (event is GetEmployeesEvent) {
        emit(LoadingEmployeesState());
        final failureOrEmployees = await getAllEmployeesUseCase();
        emit(_mapFailureOrEmployeesToState(failureOrEmployees));
      } else if (event is RefreshEmployeesEvent) {
        emit(LoadingEmployeesState());
        final failureOrEmployees = await getAllEmployeesUseCase();
        emit(_mapFailureOrEmployeesToState(failureOrEmployees));
      }
    });
  }
  GetAllEmployeesState _mapFailureOrEmployeesToState(
      Either<Failure, List<Employee>> either) {
    return either.fold(
        (failure) =>
            ErroremployeessState(message: _mapFailureToMessage(failure)),
        (employees) => LoadedEmployeesState(employees: employees));
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
