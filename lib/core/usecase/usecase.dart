import 'dart:async';

import 'package:common/core/error/failures.dart';
import 'package:common/core/result/result.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Param, Type> {
  Future<Either<Failure, Type>> call(Param param);
}

abstract class BaseUseCaseParam<Param, Type> {
  FutureResult<Type, Failure> call(Param param);
}

abstract class BaseUseCase<Type> {
  FutureResult<Type, Failure> call();
}

abstract class BaseStreamUseCase<Type> {
  final StreamController<Result<Type, Failure>> _resultController = StreamController.broadcast();

  StreamResult<Type, Failure> get result => _resultController.stream;

  call() {
    _resultController.addStream(execute());
  }

  StreamResult<Type, Failure> execute();
}

abstract class BaseStreamUseCaseParam<Param, Type> {
  final StreamController<Result<Type, Failure>> _resultController = StreamController.broadcast();

  StreamResult<Type, Failure> get result => _resultController.stream;

  call(Param param) {
    _resultController.addStream(execute(param));
  }

  StreamResult<Type, Failure> execute(Param param);
}
