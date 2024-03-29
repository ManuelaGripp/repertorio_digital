import 'package:http/http.dart' as http;
import 'package:repertorio/app/interfaces/fetchSonginterface.dart';
import 'dart:convert';

import '../model/song_response.dart';

class SearchService implements FetchSongInterface{
  @override
  Future<SongResponseEntity> fetchSong({required String songName}) async {
    var url = 'https://api.vagalume.com.br/search.artmus?q=$songName';

    final response = await http.get(Uri.parse(url));
    dynamic jsonData = json.decode(response.body);

    SongResponseEntity song = SongResponseEntity.fromJson(jsonData['response']);
    return song;
  }
}
