import 'package:flutter/material.dart';
import 'package:repertorio/app/interfaces/fetchSonginterface.dart';
import 'package:repertorio/app/model/song.dart';
import 'package:repertorio/app/service/search_service.dart';
import 'package:repertorio/invalidIndexException.dart';
import '../model/song_response.dart';

class RepertoireController extends ChangeNotifier{
  List<Song> list = [];

  void addNewSong(Song newSong) {
    bool songExists = list.any((song) =>
        song.name == newSong.name &&
        song.gender == newSong.gender &&
        song.duration == newSong.duration &&
        song.artist == newSong.artist &&
        song.album == newSong.album);

    if (!songExists) {
      list.add(newSong);
      notifyListeners();
    }
  }

  void updateSong(
      {required int index,
      String? name,
      String? gender,
      String? duration,
      String? artist,
      String? album}) {
    if (index >= 0) {
      list[index] = list[index].copyWith(
          name: name,
          gender: gender,
          duration: duration,
          artist: artist,
          album: album);
      notifyListeners();
    } else
      throw InvalidIndexException;
  }

  void removeSong({required int index}) {
    if (index >= 0) {
      list.removeAt(index);
      notifyListeners();
    } else
      throw InvalidIndexException;
  }

  Future<SongResponseEntity> getSongs(SearchService service, String songName, RepertoireController repertoire) async {
    SongResponseEntity  newSong =  await service.fetchSong(songName: songName);
    return newSong;
  }
}
