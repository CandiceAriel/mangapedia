class mangadetail {
  final String mangaTitle;
  final String jpTitle;
  final String imgURL;
  final String synopsis;
  final List<Genre> genres;
  final List<Authors> authors;
  final int malID;
  final int ranking;
  final int popularity;
  final int chapter;
  final int volume;

  const mangadetail({
    required this.mangaTitle,
    required this.jpTitle,
    required this.malID,
    required this.imgURL,
    required this.synopsis,
    required this.genres,
    required this.ranking,
    required this.popularity,
    required this.authors,
    required this.volume,
    required this.chapter,
  });

  factory mangadetail.fromJson(Map<String, dynamic> json) => mangadetail (
      mangaTitle: json['title']?? '',
      jpTitle: json['title_japanese']?? '',
      malID: json['mal_id']?? 0,
      imgURL: json['images']['jpg']['image_url']?? '',
      genres: new List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
      ranking: json['rank']?? 0,
      popularity: json['popularity']?? 0,
      synopsis: json['synopsis']?? '',
      authors: new List<Authors>.from(json["authors"].map((x) => Authors.fromJson(x))),
      volume: json['volumnes']?? 0,
      chapter: json['chapters']?? 0
  );
}

class Authors {
    int author_malId;
    String author_type;
    String author_name;
    String  author_url;

    Authors({
      required  this.author_malId,
      required  this.author_type,
      required  this.author_name,
      required  this.author_url,
    });

    factory Authors.fromJson(Map<String, dynamic> json) => new Authors(
         author_malId: json["mal_id"],
         author_type: json["type"],
         author_name: json["name"],
         author_url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "mal_id": author_malId,
        "type": author_type,
        "name": author_name,
        "url": author_url,
    };
}

class Genre {
    int malId;
    String type;
    String name;
    String url;

    Genre({
      required  this.malId,
      required  this.type,
      required  this.name,
      required  this.url,
    });

    factory Genre.fromJson(Map<String, dynamic> json) => new Genre(
        malId: json["mal_id"],
        type: json["type"],
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "type": type,
        "name": name,
        "url": url,
    };
}