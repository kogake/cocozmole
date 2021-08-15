import 'package:calcula_pilha/logic/cubit/pilha_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Calculadora_Widget extends StatelessWidget {
  const Calculadora_Widget({
    Key? key,
    required List<String> listaBotoes,
  })  : _listaBotoes = listaBotoes,
        super(key: key);

  final List<String> _listaBotoes;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<PilhaCubit, PilhaState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.red,
                      height: 230,
                    ),
                    Image(
                      height: 40,
                      width: 40,
                      image: AssetImage('images/stack_logo.png'),
                    ),
                    Container(
                      color: Colors.red,
                      height: 100,
                    ),
                    Image(
                      height: 40,
                      width: 40,
                      image: AssetImage('images/one_logo.png'),
                    ),
                    Container(
                      color: Colors.red,
                      height: 100,
                    ),
                  ],
                ),
                Container(
                  width: 60,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      state.contador.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Container(
                      height: 100,
                    ),
                    Container(
                      // width: MediaQuery.of(context).size.width / 2,
                      child: Row(
                        children: _listaBotoes
                            .map(
                              (e) => Container(
                                width: 20,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.green)),
                                    onPressed: () => {
                                          context
                                              .read<PilhaCubit>()
                                              .increment(int.parse(e)),
                                        },
                                    child: Text(e)),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Container(
                      height: 100,
                    ),
                    Container(
                      // width: MediaQuery.of(context).size.width / 2,
                      child: Row(
                        children: _listaBotoes
                            .map(
                              (e) => Container(
                                width: 20,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.green)),
                                    onPressed: () => {
                                          context.read<PilhaCubit>().increment(
                                              returnPilha(int.parse(e))),
                                        },
                                    child: Text(e)),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () =>
                            {context.read<PilhaCubit>().append(state.contador)},
                        child: Text("Adicionar a lista"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () => {context.read<PilhaCubit>().drop()},
                        child: Text("Apagar Lista"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () =>
                            {context.read<PilhaCubit>().deleteAll()},
                        child: Text("Zerar"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () => {},
                        child: Text("Muda cor"),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: true ? Colors.white : Colors.white,
                  width: 40,
                  height: 300,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: state.ListaPilhas.map((e) => Container(
                      width: 100,
                      height: 40,
                      alignment: AlignmentDirectional.center,
                      child: Text(e.toString()))).toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

int returnPilha(int a) {
  if (a == 1) {
    return 1;
  } else {
    return returnPilha(a - 1) + a;
  }
}
