import 'dart:convert';
import 'dart:io';

void main() {
  final file = File('json_test/movie_examples.json');
  final jsonString = file.readAsStringSync();

  final movieData = MovieData.fromJson(jsonDecode(jsonString));

  print('\n총 영화 수: ${movieData.metadata.totalMovies}\n');

  for (var movie in movieData.movies) {
    print('<${movie.title}>');
    print('감독: ${movie.director}');
    print('출연진');
    for (var cast in movie.cast) {
      print('    - ${cast.name} (${cast.role} 역)');
    }
    print('\n--------------------\n');
  }
}

class MovieData {
  List<Movie> movies;
  Metadata metadata;

  MovieData({required this.movies, required this.metadata});

  factory MovieData.fromJson(Map<String, dynamic> json) {
    var movieList = (json['movies'] as List)
        .map((movieJson) => Movie.fromJson(movieJson))
        .toList();

    return MovieData(
      movies: movieList,
      metadata: Metadata.fromJson(json['metadata']),
    );
  }
}

class Movie {
  int id;
  String title;
  String director;
  int releaseYear;
  List<CastMember> cast;

  Movie({
    required this.id,
    required this.title,
    required this.director,
    required this.releaseYear,
    required this.cast,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    var castList = (json['cast'] as List)
        .map((castJson) => CastMember.fromJson(castJson))
        .toList();

    return Movie(
      id: json['id'],
      title: json['title'],
      director: json['director'],
      releaseYear: json['releaseYear'],
      cast: castList,
    );
  }
}

class Metadata {
  int totalMovies;
  String lastUpdated;
  String version;

  Metadata({
    required this.totalMovies,
    required this.lastUpdated,
    required this.version,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      totalMovies: json['totalMovies'],
      lastUpdated: json['lastUpdated'],
      version: json['version'],
    );
  }
}

class CastMember {
  String name;
  String role;

  CastMember({required this.name, required this.role});

  factory CastMember.fromJson(Map<String, dynamic> json) {
    return CastMember(name: json['name'], role: json['role']);
  }
}
