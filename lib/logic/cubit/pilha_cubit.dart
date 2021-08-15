import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'pilha_state.dart';

class PilhaCubit extends Cubit<PilhaState> {
  PilhaCubit() : super(PilhaState(cont: 0));

  void increment(int incremento) {
    return emit(state.CopyWith(count: state.contador + incremento));
  }

  void zero() => emit(state.CopyWith(count: 0));

  void append(int a) => {
        state.ListaPilhas.add(a),
        emit(state.CopyWith(pilha: state.ListaPilhas, count: 0))
      };

  void drop() => {
        if (state.ListaPilhas.length == 0)
          {
            emit(state),
          }
        else
          {
            state.ListaPilhas.removeLast(),
            emit(state.CopyWith(pilha: state.ListaPilhas, count: 0))
          },
      };
  void deleteAll() => {
        if (state.ListaPilhas.length == 0)
          {
            emit(state),
          }
        else
          {
            state.ListaPilhas.clear(),
            emit(state.CopyWith(pilha: state.ListaPilhas, count: 0))
          },
      };
  void selectedPilha(int a) {
    print("a");
    emit(state.CopyWith(selected_Pilha: a));
  }
}
