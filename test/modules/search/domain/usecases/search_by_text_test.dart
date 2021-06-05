import 'package:clean_arch_tdd/modules/search/domain/entities/result_search.dart';
import 'package:clean_arch_tdd/modules/search/domain/errors/errors.dart';
import 'package:clean_arch_tdd/modules/search/domain/repositories/search_repository_interface.dart';
import 'package:clean_arch_tdd/modules/search/domain/usecases/search_by_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements ISearchRepository {}

void main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchByText(repository);
  test('should return a list of ResultSearch', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));

    final result = await usecase("searchText");
    expect(result | null, isA<List<ResultSearch>>());
  });

  test('should return an exception if searchText is invalid', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));

    var result = await usecase(null);
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidTextError>());

    result = await usecase("");
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
