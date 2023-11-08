import 'package:flutter_test/flutter_test.dart';
import 'package:repertorio/app/controller/repertorio_controller.dart';
import 'package:repertorio/app/model/repertorio.dart';

void main() {
  test('should have lenght equal to 0', () {
    RepertorioController repertorio = RepertorioController();
    expect(repertorio.list.length, 0);
  });

  test('should add a new song successfully', () {
    RepertorioController repertorio = RepertorioController();
    Repertorio novaMusica = Repertorio(
      nome: 'Morena',
      genero: 'Sertanejo Universitário',
      duracao: '3:13',
      artista: 'Luan Santana s2',
      album: 'Luan City',
    );

    repertorio.addNovaMusica(novaMusica);

    expect(repertorio.list.length, 1);
    expect(repertorio.list.first, novaMusica);
  });

}
