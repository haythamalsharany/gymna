import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gymna/features/employee/domain/use_cases/get_all_employee_use_case.dart';
import 'package:gymna/features/payroll/domain/entities/payroll.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/strings/failures.dart';
import '../../../domain/use_cases/get_all_payrolls_use_case.dart';
import '../../../domain/use_cases/get_payroll_use_case.dart';

part 'get_payrolls_event.dart';
part 'get_payrolls_state.dart';

class GetPayrollsBloc extends Bloc<GetPayrollsEvent, GetPayrollsState> {
  final GetAllPayrollsUsecase getAllPayrollsUsecase;
  final GetPayrollUsecase getPayrollUsecase;


  GetPayrollsBloc({required this.getAllPayrollsUsecase, required this.getPayrollUsecase,})
      : super(GetPayrollsInitial()) {
    on<GetPayrollsEvent>((event, emit) async {
      if (event is GetAllPayrollsEvent) {
        emit(LoadingPayrollsState());

        final failureOrEmployees = await getAllPayrollsUsecase();
        emit(_mapFailureOrEmployeesToState(failureOrEmployees));

      }else if(event is RefreshPayrollsEvent){
        emit(LoadingPayrollsState());

        final failureOrPayrolls = await getAllPayrollsUsecase();
        emit(_mapFailureOrEmployeesToState(failureOrPayrolls));
      }else if(event is GetPayrollEvent){
        emit(LoadingPayrollsState());
        final failureOrPayroll = await getPayrollUsecase(event.payrollId);
        _mapFailureOrEmployeeToState(failureOrPayroll);
      }
    });
  }
  GetPayrollsState _mapFailureOrEmployeeToState(
      Either<Failure, Payroll> either) {
    return either.fold(
            (failure) =>
            ErrorPayrollsState(message: _mapFailureToMessage(failure)),
            (payroll) => LoadedPayrollState(payroll: payroll));
  }
   GetPayrollsState _mapFailureOrEmployeesToState(
      Either<Failure, List<Payroll>> either) {
    return either.fold(
        (failure) =>
            ErrorPayrollsState(message: _mapFailureToMessage(failure)),
        (payrolls) => LoadedPayrollsState(payrolls: payrolls));
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
