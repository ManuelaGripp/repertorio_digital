import 'package:repertorio/app/model/song_response.dart';

import '../controller/repertorio_controller.dart';
import '../service/search_service.dart';

abstract interface class FetchSongInterface{
  Future<SongResponseEntity> fetchSong({required String songName});
}