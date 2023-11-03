import 'package:flutter/material.dart';
import 'package:repertorio/app/model/repertorio.dart';

class RepertorioController extends ChangeNotifier {
  List<Repertorio> list = [
    Repertorio(
        nome: 'Queria tanto lhe ver',
        genero: 'Samba',
        duracao: '1:40',
        artista: 'Sensação',
        album: 'Samba é no fundo de quintal')
  ];

  void addNovaMusica(Repertorio novoRepertorio) {
    list.add(novoRepertorio);
    print(novoRepertorio);
    notifyListeners();
  }

  void atualizarMusica(
      {required String nome,
      String? novoNome,
      String? genero,
      String? duracao,
      String? artista,
      String? album}) {
    int index = list.indexWhere((element) => element.nome == nome);
    list[index] = list[index].copyWith(
        nome: novoNome,
        genero: genero,
        duracao: duracao,
        artista: artista,
        album: album);
    notifyListeners();
  }

  void removerMusica({required String nome}) {
    int index = list.indexWhere((element) => element.nome == nome);

    if (index != -1) list.removeAt(index);
    notifyListeners();
  }

  List<Map<String, dynamic>> getRepertorio() {
    List<Map<String, dynamic>> repertorioMap = [];

    for (var element in list) {
      repertorioMap.add(element.toMap());
    }

    notifyListeners();
    return repertorioMap;
  }
}
