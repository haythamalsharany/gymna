import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  @override
  List<Object> get props => [];
}

class CacheFailure extends Failure {
  @override
  List<Object> get props => [];
}

class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}



class EmptyCacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}
