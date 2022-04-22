import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notodo/features/auth/domain/entities/user.dart';
import 'package:notodo/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notodo/features/auth/domain/usecases/login_with_email.dart';

import '../setup.dart';
import 'login_with_email_test.mocks.dart';

@GenerateMocks([IAuthRepository])
void main() {
  testSetUp();
  const tEmail = 'testUser@example.com';
  const tPassword = '123456';
  const tUser = User(
      uid: 'TEST00',
      email: 'testUser@example.com',
      token: 'DEADBEAF',
      locale: 'en_US',
      platform: 'test');

  test(
    '[LoginWithEmail] Sign in with email and password.',
    () async {
      // arrange
      final mockRepository = MockIAuthRepository();
      when(mockRepository.loginWithEmail(any, any))
          .thenAnswer((_) async => const Right(tUser));
      final usecase = LoginWithEmailUC(mockRepository);
      // act
      final result = await usecase.execute(
          const LoginWithEmailUCArgs(email: tEmail, password: tPassword));
      // assert
      expect(result, const Right(tUser));
    },
  );
}
