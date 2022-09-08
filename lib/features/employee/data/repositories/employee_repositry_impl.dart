import 'package:gymna/features/employee/data/local/data_sources/employee_data_source.dart';
import 'package:gymna/features/employee/data/local/table/employee_table.dart';
import 'package:gymna/features/employee/domain/entities/employee.dart';
import 'package:gymna/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:gymna/features/employee/domain/repositories/employee_repositry.dart';

class EmployeeRepositoryImpl extends EmployeeRepositry {
  final EmployeeLocalDataSource localDataSource;

  EmployeeRepositoryImpl({required this.localDataSource});
  @override
  Future<Either<Failure, Unit>> addEmployee(Employee employee) async {
    try {
      final response = await localDataSource
          .addEmployee(EmployeeTeble.fromEmployee(employee));

      return const Right(unit);
    } on Exception {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<Employee>>> getAllEmployees() async {
    try {
      final response = await localDataSource.getAllLocalEmployees();
      return Right(response);
    } on Exception {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Employee>> getEmployee(int employeeId) async {
    try {
      final response = await localDataSource.getEmployee(employeeId);
      return Right(response);
    } on Exception {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateMembership(Employee employee) async {
    try {
      final response = await localDataSource
          .updateEmployee(EmployeeTeble.fromEmployee(employee));
      return const Right(unit);
    } on Exception {
      return Left(CacheFailure());
    }
  }
  
  @override
  Future<Either<Failure, List<Employee>>> SearchEmployees(String searchText) async {
    try {
      final response = await localDataSource.searchLocalEmployees(searchText);
      return Right(response);
    } on Exception {
      return Left(CacheFailure());
    }
  }
}
