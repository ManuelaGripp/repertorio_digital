class Repertorio {
  String nome;
  String genero;
  String duracao;
  String artista;
  String album;
  Repertorio({
    required this.nome,
    required this.genero,
    required this.duracao,
    required this.artista,
    required this.album,
  });

  Repertorio copyWith({
    String? nome,
    String? genero,
    String? duracao,
    String? artista,
    String? album,
  }) {
    return Repertorio(
      nome: nome ?? this.nome,
      genero: genero ?? this.genero,
      duracao: duracao ?? this.duracao,
      artista: artista ?? this.artista,
      album: album ?? this.album,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'genero': genero,
      'duracao': duracao,
      'artista': artista,
      'lancamento': album,
    };
  }
}
