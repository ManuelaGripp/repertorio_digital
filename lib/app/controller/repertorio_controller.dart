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
      {required int index,
      String? nome,
      String? genero,
      String? duracao,
      String? artista,
      String? album}) {
    if (index != -1) {
      list[index] = list[index].copyWith(
          nome: nome,
          genero: genero,
          duracao: duracao,
          artista: artista,
          album: album);
      notifyListeners();
    }
  }

  void removerMusica({required int index}) {
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
