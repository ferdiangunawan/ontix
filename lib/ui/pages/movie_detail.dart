part of 'pages.dart';

//extends movie sbg turunan dari Movie untuk ambil data
class MovieDetail extends Movie {
  final List<String> genres;
  final String language;

  MovieDetail(Movie movie, {this.genres, this.language})
      : super(
            id: movie.id,
            title: movie.title,
            voteAverage: movie.voteAverage,
            overview: movie.overview,
            posterPath: movie.posterPath,
            backdropPath: movie.backdropPath);

  //getter setter untuk genres dan language
  String get genreAndLanguage {
    String s = "";
    for (var genre in genres) {
      s += genre + ((genre != genres.last) ? ', ' : '');
    }
    return "$s - ${language ?? 'English (Default)'}"; //kalo null english unknown
  }

// dari equatablenya movie
  @override
  List<Object> get props => super.props + [genres, language];
}

//contoh model turunan