import 'dart:async';

abstract class BaseUseCaseParam<Param, Type> {
  Future<Type> call(Param param);
}

abstract class BaseUseCase<Type> {
  Future<Type> call();
}

