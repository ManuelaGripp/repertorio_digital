import 'package:flutter/material.dart';
import 'package:repertorio/app/model/song.dart';

class RepertoireController extends ChangeNotifier {
  List<Song> list = [];

  void addNewSong(Song newSong) {
    if (!list.contains(newSong)) {
      list.add(newSong);
      notifyListeners();
    } else {
      print('Música já existe na lista');
    }
  }

  void updateSong(
      {required int index,
      String? name,
      String? gender,
      String? duration,
      String? artist,
      String? album}) {
    if (index != -1) {
      list[index] = list[index].copyWith(
          name: name,
          gender: gender,
          duration: duration,
          artist: artist,
          album: album);
      notifyListeners();
    }
  }

  void removeSong({required int index}) {
    if (index != -1) list.removeAt(index);
    notifyListeners();
  }

  List<Map<String, dynamic>> getSong() {
    List<Map<String, dynamic>> songMap = [];

    for (var element in list) {
      songMap.add(element.toMap());
    }

    notifyListeners();
    return songMap;
  }
}
