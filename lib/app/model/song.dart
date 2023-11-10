class Song {
  String name;
  String gender;
  String duration;
  String artist;
  String album;
  Song({
    required this.name,
    required this.gender,
    required this.duration,
    required this.artist,
    required this.album,
  });

  Song copyWith({
    String? name,
    String? gender,
    String? duration,
    String? artist,
    String? album,
  }) {
    return Song(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      duration: duration ?? this.duration,
      artist: artist ?? this.artist,
      album: album ?? this.album,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'gender': gender,
      'duration': duration,
      'artist': artist,
      'lancamento': album,
    };
  }
}
