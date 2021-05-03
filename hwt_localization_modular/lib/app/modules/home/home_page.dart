import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'home_store.dart';
import 'package:localization/localization.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: ScopedBuilder<HomeStore, Exception, int>(
        store: controller,
        onState: (_, counter) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text('$counter'),
                Text(
                  'birthday'.i18n([
                    'Bwolf',
                    '16'
                  ]),
                )
              ],
            ),
          );
        },
        onError: (context, error) => Center(
          child: Text(
            'birthday'.i18n([
              'Bwolf',
              '16'
            ]),
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}