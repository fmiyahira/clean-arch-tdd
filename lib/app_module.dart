import 'package:clean_arch_tdd/app_widget.dart';
import 'package:clean_arch_tdd/modules/search/domain/repositories/search_repository_interface.dart';
import 'package:clean_arch_tdd/modules/search/domain/usecases/search_by_text.dart';
import 'package:clean_arch_tdd/modules/search/external/datasources/github_datasource.dart';
import 'package:clean_arch_tdd/modules/search/infra/datasources/search_datasource_interface.dart';
import 'package:clean_arch_tdd/modules/search/infra/repositories/search_repository.dart';
import 'package:clean_arch_tdd/modules/search/presenter/search/search_controller.dart';
import 'package:clean_arch_tdd/modules/search/presenter/search/search_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind<ISearchDatasource>((i) => GithubDataSource(i())),
        Bind<ISearchRepository>((i) => SearchRepository(i())),
        Bind<ISearchByText>((i) => SearchByText(i())),
        Bind<SearchController>((i) => SearchController(i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => SearchPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
