// service locator
import 'package:get_it/get_it.dart';
import 'package:gymna/features/employee/data/local/data_sources/employee_data_source.dart';
import 'package:gymna/features/employee/data/repositories/employee_repositry_impl.dart';
import 'package:gymna/features/employee/domain/repositories/employee_repositry.dart';
import 'package:gymna/features/employee/domain/use_cases/add_employee_use_case.dart';
import 'package:gymna/features/employee/domain/use_cases/get_all_employee_use_case.dart';
import 'package:gymna/features/employee/domain/use_cases/update_employee_use_case.dart';
import 'package:gymna/features/employee/presentation/manager/bloc/employee_bloc.dart';
import 'package:gymna/features/employee/presentation/manager/getEmployees/get_all_employees_bloc.dart';
import 'package:gymna/features/manage_memberships/data/local/data_sources/membership_local_data_source.dart';
import 'package:gymna/features/manage_memberships/data/repositories/membership_repositry_impl.dart';
import 'package:gymna/features/manage_memberships/domain/repositories/membership_repositry.dart';
import 'package:gymna/features/manage_memberships/domain/use_cases/add_membeship_use_case.dart';
import 'package:gymna/features/manage_memberships/domain/use_cases/get_membeships_use_case.dart';
import 'package:gymna/features/manage_memberships/presentation/manager/bloc/membership_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - membership
  sl.registerFactory(() =>
      MembershipBloc(addMembershipUsecase: sl(), getMembershipsUsecase: sl()));
  //! Features - employee
  sl.registerFactory(() =>
      EmployeeBloc(addEmployeeUseCase: sl(), updateEmployeeUseCase: sl()));

  sl.registerFactory(() => GetAllEmployeesBloc(
        getAllEmployeesUseCase: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => GetMembershipsUsecase(sl()));
  sl.registerLazySingleton(() => AddMembershipUsecase(sl()));
  sl.registerLazySingleton(() => AddEmployeeUsecase(sl()));
  sl.registerLazySingleton(() => UpdateEmployeeUseCase(sl()));
  sl.registerLazySingleton(() => GetAllEmployeesUseCase(sl()));

  // Repository
  sl.registerLazySingleton<MembershipRepositry>(
      () => MembershipsRepositoryImpl(localDataSource: sl()));
  sl.registerLazySingleton<EmployeeRepositry>(
      () => EmployeeRepositoryImpl(localDataSource: sl()));
  // Local Data sources
  sl.registerLazySingleton<MembershipLocalDataSource>(
      () => MembershipLocalDataSourceImpl());
  sl.registerLazySingleton<EmployeeLocalDataSource>(
      () => EmployeeLocalDataSourceImpl());
// Remote Data sources

  //! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//   //! External

  //  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());

  // sl.registerLazySingleton(() => appDocumentDir);
}
