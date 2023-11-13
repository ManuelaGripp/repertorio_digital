import 'package:flutter_test/flutter_test.dart';
import 'package:repertorio/app/controller/repertorio_controller.dart';
import 'package:repertorio/app/model/song.dart';

void main() {
  test('should have lenght equal to 0', () {
    RepertoireController repertorio = RepertoireController();
    expect(repertorio.list.length, 0);
  });

  test('should add a new song successfully', () {
    RepertoireController repertorio = RepertoireController();
    Song newSong = Song(
      name: 'Morena',
      gender: 'Sertanejo Universitário',
      duration: '3:13',
      artist: 'Luan Santana s2',
      album: 'Luan City',
    );

    repertorio.addNewSong(newSong);

    expect(repertorio.list.length, 1);
    expect(repertorio.list.first, newSong);
  });

  test('should update song details at a valid index in the repertoire', () {
    RepertoireController repertorio = RepertoireController();
    Song newSong = Song(
      name: 'Meio Termo',
      gender: 'Sertanejo Universitário',
      duration: '2:55',
      artist: 'Luan Santana <3',
      album: 'Luan City 2.0',
    );

    repertorio.addNewSong(newSong);

    repertorio.updateSong(index: 0, name: 'Ambiente Errado');

    expect(repertorio.list.length, 1);

    expect(repertorio.list.first.name, 'Ambiente Errado');
    expect(repertorio.list.first.gender, 'Sertanejo Universitário');
    expect(repertorio.list.first.duration, '2:55');
    expect(repertorio.list.first.artist, 'Luan Santana <3');
    expect(repertorio.list.first.album, 'Luan City 2.0');
  });

  test('should remove a song successfully', () {
    RepertoireController repertorio = RepertoireController();
    Song musicaExcluida = Song(
      name: 'Evidências',
      gender: 'Sertanejo',
      duration: '4:23',
      artist: 'Chitãozinho & Xororó',
      album: 'Raízes Sertanejas',
    );

    repertorio.addNewSong(musicaExcluida);
    repertorio.removeSong(index: 0);
    expect(repertorio.list.contains(musicaExcluida), isFalse);
  });

  test('should not add a song twice', () {
    RepertoireController repertorio = RepertoireController();

    Song music1 = Song(
      name: 'Seu Astral',
      gender: 'Sertanejo',
      duration: '3:15',
      artist: 'Jorge & Mateus',
      album: 'Aí Já Era',
    );

    Song music2 = Song(
      name: 'Seu Astral',
      gender: 'Sertanejo',
      duration: '3:15',
      artist: 'Jorge & Mateus',
      album: 'Aí Já Era',
    );

    repertorio.addNewSong(music1);
    repertorio.addNewSong(music2);
    expect(repertorio.list.length, 1);
  });
}
