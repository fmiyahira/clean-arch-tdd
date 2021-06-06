import 'package:clean_arch_tdd/app_module.dart';
import 'package:clean_arch_tdd/modules/search/domain/entities/result_search.dart';
import 'package:clean_arch_tdd/modules/search/domain/usecases/search_by_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'modules/search/utils/github_response.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  initModule(AppModule(), changeBinds: [
    Bind<Dio>((i) => dio),
  ]);

  test('should get the usecase without error', () async {
    final usecase = Modular.get<ISearchByText>();
    expect(usecase, isA<SearchByText>());
  });

  test('should get a list of ResultSearch', () async {
    when(dio.get(any)).thenAnswer(
      (_) async => Response(
        statusCode: 200,
        data: githubResult,
      ),
    );

    final usecase = Modular.get<ISearchByText>();
    final result = await usecase('fmiyahira');

    expect(result | null, isA<List<ResultSearch>>());
  });
}
