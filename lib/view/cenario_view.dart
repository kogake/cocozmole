import 'package:flutter/material.dart';

class cenario_builder extends StatelessWidget {
  const cenario_builder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      height: 700,
      color: Colors.green,
      child: ContainerMatrix(columns: 7, rows: 7),
    );
  }
}

class ContainerMatrix extends StatelessWidget {
  const ContainerMatrix({Key? key, this.columns, this.rows}) : super(key: key);
  final int? columns;
  final int? rows;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (int i = 0; i < 3; i++) Text("Hello" + i.toString())
      ],
    );
  }
}
