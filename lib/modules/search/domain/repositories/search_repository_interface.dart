import 'package:clean_arch_tdd/modules/search/domain/entities/result_search.dart';
import 'package:clean_arch_tdd/modules/search/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class ISearchRepository {
  Future<Either<FailureSearch, List<ResultSearch>>> search(String searchText);
}
