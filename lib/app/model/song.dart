class Song {
  String name;
  String? gender;
  String? duration;
  String artist;
  String? album;
  Song({
    required this.name,
    this.gender,
    this.duration,
    required this.artist,
    this.album,
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
}
