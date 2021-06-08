import 'package:clean_arch_tdd/modules/search/domain/entities/result_search.dart';
import 'package:clean_arch_tdd/modules/search/domain/errors/errors.dart';
import 'package:clean_arch_tdd/modules/search/infra/datasources/search_datasource_interface.dart';
import 'package:clean_arch_tdd/modules/search/infra/models/result_search_model.dart';
import 'package:clean_arch_tdd/modules/search/infra/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchDatasourceMock extends Mock implements ISearchDatasource {}

main() {
  final datasource = SearchDatasourceMock();
  final repository = SearchRepository(datasource);

  test('should return a list of ResultSearch', () async {
    when(datasource.getSearch(any))
        .thenAnswer((_) async => <ResultSearchModel>[]);

    final result = await repository.search("fmiyahira");

    expect(result | null, isA<List<ResultSearch>>());
  });

  test('shoud return an error if datasource failed', () async {
    when(datasource.getSearch(any)).thenThrow(Exception);

    final result = await repository.search("fmiyahira");

    expect(result.fold(id, id), isA<Exception>());
  });

  test('shoud return an DatasourceError if datasource failed', () async {
    when(datasource.getSearch(any)).thenThrow(DatasourceError);

    final result = await repository.search("fmiyahira");

    expect(result.isLeft(), true);
  });
}
