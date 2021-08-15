import 'package:calcula_pilha/logic/cubit/pilha_cubit.dart';
import 'package:calcula_pilha/view/Calculadora_view.dart';
import 'package:calcula_pilha/view/Cenario_View.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/keyboard/keyboard_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PilhaCubit>(
      create: (context) => PilhaCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: KeyboardDemo(),
        home: MyHomePage(title: 'Simple calculator'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, this.alt}) : super(key: key);

  final String title;
  final bool? alt;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _iconHeight = 40;
  List<String> _listaBotoes = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // body: Calculadora_Widget(listaBotoes: _listaBotoes),
      body: Cenario_Builder(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          context.read<PilhaCubit>().zero(),
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
