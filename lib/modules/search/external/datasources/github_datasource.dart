import 'package:clean_arch_tdd/modules/search/domain/errors/errors.dart';
import 'package:clean_arch_tdd/modules/search/infra/datasources/search_datasource_interface.dart';
import 'package:clean_arch_tdd/modules/search/infra/models/result_search_model.dart';
import 'package:dio/dio.dart';

// extension on String {
//   normalize() {
//     return this.replaceAll(" ", "+");
//   }
// }

class GithubDataSource implements ISearchDatasource {
  final Dio dio;

  GithubDataSource(this.dio);

  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) async {
    final response = await dio.get(
        "https://api.github.com/search/users?q=${normalizeText(searchText)}");

    if (response.statusCode == 200) {
      final list = (response.data['items'] as List)
          .map((e) => ResultSearchModel.fromJson(e))
          .toList();

      return list;
    }

    throw DatasourceError();
  }

  String normalizeText(String searchText) {
    return searchText.replaceAll(" ", "+");
  }
}
