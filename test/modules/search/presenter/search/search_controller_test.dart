import 'package:clean_arch_tdd/modules/search/domain/entities/result_search.dart';
import 'package:clean_arch_tdd/modules/search/domain/errors/errors.dart';
import 'package:clean_arch_tdd/modules/search/domain/usecases/search_by_text.dart';
import 'package:clean_arch_tdd/modules/search/presenter/search/search_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchByTextMock extends Mock implements ISearchByText {}

void main() {
  final usecase = SearchByTextMock();
  final controller = SearchController(usecase);

  test('should start the variables correctly', () async {
    when(usecase(any))
        .thenAnswer((_) async => Right(<ResultSearch>[ResultSearch()]));

    expect(controller.loading, false);
    expect(controller.list, []);
    expect(controller.error, null);

    await controller.search("fmiyahira");

    expect(controller.loading, false);
    expect(controller.list.length, 1);
    expect(controller.error, null);
  });

  test('should return a error', () async {
    when(usecase(any)).thenAnswer((_) async => Left(InvalidTextError()));

    await controller.search("fmiyahira");

    expect(controller.error, isA<Exception>());
  });
}
