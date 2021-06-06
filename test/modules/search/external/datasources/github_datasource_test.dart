import 'dart:convert';

import 'package:clean_arch_tdd/modules/search/domain/errors/errors.dart';
import 'package:clean_arch_tdd/modules/search/external/datasources/github_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/github_response.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final githubDatasource = GithubDataSource(dio);

  test('should return a list of ResultSearchModel', () async {
    when(dio.get(any)).thenAnswer(
      (_) async => Response(
        data: jsonDecode(githubResult),
        statusCode: 200,
      ),
    );

    final future = githubDatasource.getSearch("fmiyahira");
    expect(future, completes);
  });

  test('should return a DatasourceError if the statusCode different of 200',
      () async {
    when(dio.get(any)).thenAnswer(
      (_) async => Response(
        data: null,
        statusCode: 401,
      ),
    );

    final future = githubDatasource.getSearch("fmiyahira");
    expect(future, throwsA(isA<DatasourceError>()));
  });

  test('should return an Exception if there an error in the Dio', () async {
    when(dio.get(any)).thenThrow(Exception());

    final future = githubDatasource.getSearch("fmiyahira");
    expect(future, throwsA(isA<Exception>()));
  });
}
