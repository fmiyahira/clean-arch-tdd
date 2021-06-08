import 'package:clean_arch_tdd/modules/search/domain/entities/result_search.dart';
import 'package:clean_arch_tdd/modules/search/domain/usecases/search_by_text.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

part 'search_controller.g.dart';

class SearchController = _SearchControllerBase with _$SearchController;

abstract class _SearchControllerBase with Store {
  final ISearchByText usecase;
  _SearchControllerBase(this.usecase);

  @observable
  String title = 'Github Search';

  @observable
  List<ResultSearch> list = [];

  @observable
  bool loading = false;

  @observable
  Exception error;

  @action
  void changeTitle() {
    title = 'Just a Test!';
  }

  @action
  Future search(String searchText) async {
    loading = true;
    final listResultSearch = await usecase(searchText);
    listResultSearch.fold((l) {
      loading = false;
      error = l;
    }, (r) {
      list = ObservableList.of(r);
      loading = false;
      error = null;
    });
  }
}
