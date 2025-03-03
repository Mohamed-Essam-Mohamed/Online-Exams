import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exams/core/api_helper/api_result/api_result.dart';
import 'package:online_exams/features/auth/data/api/api_auth.dart';
import 'package:online_exams/features/auth/data/data_sources/auth_data_source.dart';
import 'package:online_exams/features/auth/data/models/request/login_request.dart';
import 'package:online_exams/features/auth/data/models/request/register_request.dart';
import 'package:online_exams/features/auth/data/models/response/auth_response.dart';

import 'auth_data_source_test.mocks.dart';

@GenerateMocks([ApiAuth])
void main() {
  late AuthDataSource authDataSource;
  late MockApiAuth mockApiAuth;

  setUp(() {
    mockApiAuth = MockApiAuth();
    authDataSource = AuthDataSource(mockApiAuth);
  });
  group("Test auth data source", () {
    // testing register
    test(
      "Should return Success with a valid token when register is successful",
      () async {
        // Arrange
        provideDummy<ApiResult<AuthResponse>>(
          Success<AuthResponse>(AuthResponse(token: "test_token")),
        );
        when(mockApiAuth.register(any)).thenAnswer((_) async =>
            Success<AuthResponse>(AuthResponse(token: "test_token")));

        // act
        final result = await authDataSource.register(RegisterRequest());
        // Assert
        expect(result, isA<Success<AuthResponse>>());
        expect(
            (result as Success<AuthResponse>).data.token, equals("test_token"));
        verify(mockApiAuth.register(any)).called(1);
      },
    );

    test(
      "Should return Error when register is Error",
      () async {
        // Arrange
        provideDummy<ApiResult<AuthResponse>>(
          const Error<AuthResponse>("Error"),
        );
        when(mockApiAuth.register(any))
            .thenAnswer((_) async => const Error<AuthResponse>("Error"));
        // act
        final result = await authDataSource.register(RegisterRequest());
        // Assert
        expect(result, isA<Error<AuthResponse>>());
        expect((result as Error<AuthResponse>).message, equals("Error"));
        verify(mockApiAuth.register(any)).called(1);
      },
    );
    // testing login
    test(
      "Should return Success with a valid token when Login is successful",
      () async {
        // Arrange
        provideDummy<ApiResult<AuthResponse>>(
          Success<AuthResponse>(AuthResponse(token: "test_token")),
        );
        when(mockApiAuth.login(any)).thenAnswer((_) async =>
            Success<AuthResponse>(AuthResponse(token: "test_token")));

        // act
        final result = await authDataSource.login(LoginRequest());
        // Assert
        expect(result, isA<Success<AuthResponse>>());
        expect(
            (result as Success<AuthResponse>).data.token, equals("test_token"));
        verify(mockApiAuth.login(any)).called(1);
      },
    );

    test(
      "Should return Error when Login is Error",
      () async {
        // Arrange
        provideDummy<ApiResult<AuthResponse>>(
          const Error<AuthResponse>("Error"),
        );
        when(mockApiAuth.login(any))
            .thenAnswer((_) async => const Error<AuthResponse>("Error"));

        // act
        final result = await authDataSource.login(LoginRequest());
        // Assert

        expect(result, isA<Error<AuthResponse>>());
        expect((result as Error<AuthResponse>).message, equals("Error"));
        verify(mockApiAuth.login(any)).called(1);
      },
    );
    // testing forget password
  });
}
