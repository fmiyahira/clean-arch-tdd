import 'package:clean_arch_tdd/app_module.dart';
import 'package:clean_arch_tdd/modules/search/domain/entities/result_search.dart';
import 'package:clean_arch_tdd/modules/search/domain/errors/errors.dart';
import 'package:clean_arch_tdd/modules/search/domain/usecases/search_by_text.dart';
import 'package:clean_arch_tdd/modules/search/presenter/search/search_page.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchByTextMock extends Mock implements ISearchByText {}

void main() {
  final searchByText = SearchByTextMock();

  initModule(AppModule(), changeBinds: [
    Bind<ISearchByText>((i) => searchByText),
  ]);

  testWidgets('should verify widget tree of SearchPage after search success',
      (tester) async {
    when(searchByText(any)).thenAnswer(
      (_) async => dartz.Right([ResultSearch(title: 'fmiyahira')]),
    );

    await tester.pumpWidget(MaterialApp(home: SearchPage()));

    expect(find.byType(ListView), findsOneWidget);
    expect(find.text('Github Search'), findsOneWidget);

    final floatActionButton = find.byType(FloatingActionButton);
    await tester.tap(floatActionButton);
    await tester.pump();
    expect(find.text('Just a Test!'), findsOneWidget);

    final textField = find.byType(TextField);
    await tester.enterText(textField, "fmiyahira");
    await tester.pump(Duration(seconds: 1));
    expect(find.byType(ListTile), findsOneWidget);
    verify(searchByText.call(any)).called(1);
  });

  testWidgets('should verify widget tree of SearchPage after search error',
      (tester) async {
    when(searchByText(any)).thenAnswer(
      (_) async => dartz.Left(InvalidTextError()),
    );

    await tester.pumpWidget(MaterialApp(home: SearchPage()));

    final textField = find.byType(TextField);
    await tester.enterText(textField, "");
    await tester.pump(Duration(seconds: 1));
    expect(find.byType(ListTile), findsNothing);
    expect(find.text('Pesquisa inválida!'), findsNothing);
  });
}
