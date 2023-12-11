import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:repertorio/app/controller/repertorio_controller.dart';
import 'package:repertorio/app/interfaces/fetchSonginterface.dart';
import 'package:repertorio/app/model/song.dart';
import 'package:repertorio/app/model/song_response.dart';
import 'package:repertorio/app/service/search_service.dart';
import 'package:repertorio/invalidIndexException.dart';

class MockSearchService extends Mock implements FetchSongInterface {}
void main() {
  test('should have lenght equal to 0', () {
    RepertoireController repertorio = RepertoireController();
    expect(repertorio.list.length, 0);
  });

  test('should update only the copyWith params', () {
    Song song = Song(
        name: 'Descobir que te amo demais',
        album: 'Deixa Clarear',
        artist: 'Zeca ',
        duration: '1:20',
        gender: 'Samba');

    song = song.copyWith(name: 'Verdade', artist: 'Zeca Pagodinho');
    expect(song.name, 'Verdade');
    expect(song.artist, 'Zeca Pagodinho');
    expect(song.album, 'Deixa Clarear');
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

  test(
      'should throw an Exception when a index less equal than zero is passed as a param',
      () {
    RepertoireController repertorio = RepertoireController();
    Song song = Song(
        name: 'Dosed',
        album: 'By the Way',
        artist: 'Red Hot Chili Peppers',
        duration: '4:29',
        gender: 'Rock');

    repertorio.addNewSong(song);
    expect(() => repertorio.updateSong(index: -1, name: 'Cant Stop'),
        throwsA(InvalidIndexException));
  });

  test('A song was not removed', () {
    RepertoireController repertorio = RepertoireController();
    Song musicaExcluida = Song(
      name: 'Brain damage',
      gender: 'Rock Progressivo',
      duration: '3:47',
      artist: 'Pink Floyd',
      album: 'The Dark Side of the moon',
    );

    repertorio.addNewSong(musicaExcluida);
    expect(
        () => repertorio.removeSong(index: -1), throwsA(InvalidIndexException));
  });

  // test('Adding a song using a Search API', () async {
  //   RepertoireController repertorio = RepertoireController();
  //   final MockSearchService repertoireMock = MockSearchService();

  //   final SongResponseEntity songResponse = SongResponseEntity(docs: [
  //     SongResponseDataEntity(
  //       title: 'Verdade', 
  //       band: 'Zeca Pagodinho', 
  //       id: '1')
  //   ]);

  //   when(repertoireMock.fetchSong(songName: 'Verdade')).thenAnswer((_) async => songResponse);
  //   SongResponseEntity response = await repertoireMock.fetchSong(songName: 'Verdade');
  //   expect(repertorio.list.length, 1);
  //   expect(response, 'Verdade');
  //   expect(response, 'Zeca Pagodinho');
  // });

  test('should mock the getSongs function', () async {
      // Configurar o mock do SearchService
      final MockSearchService mockSearchService = MockSearchService();
      final repertorio = RepertoireController();

      // Configurar o comportamento do mock quando fetchSong é chamado
      when(mockSearchService.fetchSong(songName: 'Verdade'))
          .thenAnswer((_) async => SongResponseEntity(docs: [
                SongResponseDataEntity(
                  title: 'Verdade',
                  band: 'Zeca Pagodinho',
                  id: '1',
                ),
              ]));

      // Chamar o método que você deseja testar (getSongs)
      final SongResponseEntity result = await repertorio.getSongs(mockSearchService as SearchService, 'Verdade', repertorio);

      // Verificar se a função getSongs foi chamada corretamente
      verify(repertorio.getSongs(mockSearchService as SearchService, 'Verdade', repertorio)).called(1);

      // Verificar se o resultado é o esperado (pode variar dependendo da lógica específica da sua aplicação)
      expect(result, isA<SongResponseEntity>());
      expect(result.docs.length, 1);
      expect(result.docs[0].title, 'Verdade');
      expect(result.docs[0].band, 'Zeca Pagodinho');
      expect(result.docs[0].id, '1');
    });
  
}
