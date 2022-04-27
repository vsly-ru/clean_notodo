import 'package:dartz/dartz.dart';

extension EitherX<L, R> on Either<L, R> {
  /// usage: either.asRight().data
  R asRight() => (this as Right).value;
  L asLeft() => (this as Left).value;
}
