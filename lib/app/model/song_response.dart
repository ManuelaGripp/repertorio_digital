class SongResponseEntity {
  List<SongResponseDataEntity> docs;

  SongResponseEntity({
    required this.docs,
  });

  factory SongResponseEntity.fromJson(Map<String, dynamic> json) =>
      SongResponseEntity(
        docs: List<SongResponseDataEntity>.from(
            json['docs'].map((x) => SongResponseDataEntity.fromJson(x))),
      );
}

class SongResponseDataEntity {
  String id;
  String? title;
  String band;

  SongResponseDataEntity({
    required this.id,
    required this.title,
    required this.band,
  });

  factory SongResponseDataEntity.fromJson(Map<String, dynamic> json) =>
      SongResponseDataEntity(
        id: json['id'],
        title: json['title'],
        band: json['band'],
      );
}
