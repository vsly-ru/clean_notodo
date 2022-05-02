import 'package:dartz/dartz.dart';
import 'package:notodo/core/errors/failure.dart';

extension EitherX<L, R> on Either<L, R> {
  /// usage: either.asRight().data
  R asRight() => (this as Right).value;
  L asLeft() => (this as Left).value;
}

extension TaskX<T extends Either<Object, U>, U> on Task<T> {
  /// casting Left Object to a Failure
  Task<Either<Failure, U>> mapLeftToFailure() {
    return this.map(
      (either) => either.leftMap((obj) {
        try {
          return obj as Failure;
        } catch (e) {
          throw obj;
        }
      }),
    );
  }
}
