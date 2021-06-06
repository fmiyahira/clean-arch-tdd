import 'package:clean_arch_tdd/modules/search/infra/models/result_search_model.dart';

abstract class ISearchDatasource {
  Future<List<ResultSearchModel>> getSearch(String searchText);
}
