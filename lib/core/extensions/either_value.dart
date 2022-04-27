import 'package:dartz/dartz.dart';

// usage: either.asRight().data
extension EitherX<L, R> on Either<L, R> {
  R asRight() => (this as Right).value;
  L asLeft() => (this as Left).value;
}
