import 'dart:async';

import 'package:clean_arch_tdd/modules/search/domain/errors/errors.dart';
import 'package:clean_arch_tdd/modules/search/presenter/search/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ModularState<SearchPage, SearchController> {
  Timer _debounce;

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      controller.search(query);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return Text(controller.title);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: controller.changeTitle,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
            child: TextField(
              onChanged: (value) => _onSearchChanged(value),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Search...",
              ),
            ),
          ),
          Expanded(
            child: Observer(builder: (_) {
              if (controller.error != null) {
                if (controller.error is InvalidTextError) {
                  return Text('Pesquisa inválida!');
                }
              }

              if (controller.loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.builder(
                  itemCount: controller.list.length,
                  itemBuilder: (_, id) {
                    var item = controller.list[id];
                    return ListTile(
                      leading: item.image == null
                          ? Icon(Icons.add)
                          : CircleAvatar(
                              backgroundImage: NetworkImage(item.image),
                            ),
                      title: Text(item.title ?? ""),
                      subtitle: Text(item.content ?? ""),
                    );
                  });
            }),
          ),
        ],
      ),
    );
  }
}
