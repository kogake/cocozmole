part of 'pilha_cubit.dart';

class PilhaState {
  late int contador;
  late List<int> ListaPilhas;
  late int selectedPilha;

  PilhaState({int? cont, List<int>? pilha, int? selected_pilha}) {
    this.contador = cont ?? 0;
    this.ListaPilhas = pilha ?? [];
    this.selectedPilha = 0;
  }

  PilhaInitial() {
    return PilhaState(cont: 0, pilha: []);
  }

  PilhaState CopyWith({
    int? count,
    List<int>? pilha,
    int? selected_Pilha,
  }) {
    return PilhaState(
      cont: count ?? this.contador,
      pilha: pilha ?? this.ListaPilhas,
      selected_pilha: selected_Pilha ?? this.selectedPilha,
    );
  }
}
