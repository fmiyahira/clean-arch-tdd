import 'package:clean_arch_tdd/app_widget.dart';
import 'package:clean_arch_tdd/modules/search/domain/usecases/search_by_text.dart';
import 'package:clean_arch_tdd/modules/search/external/datasources/github_datasource.dart';
import 'package:clean_arch_tdd/modules/search/infra/repositories/search_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => GithubDataSource(i())),
        Bind((i) => SearchRepository(i())),
        Bind((i) => SearchByText(i())),
      ];

  @override
  List<ModularRouter> get routers => throw UnimplementedError();

  @override
  Widget get bootstrap => AppWidget();
}
