class mangadetail {
  final String mangaTitle;
  final String jpTitle;
  final String imgURL;
  final String synopsis;
  final List<Genre> genres;
  final int malID;
  final int ranking;
  final int popularity;

  const mangadetail({
    required this.mangaTitle,
    required this.jpTitle,
    required this.malID,
    required this.imgURL,
    required this.synopsis,
    required this.genres,
    required this.ranking,
    required this.popularity,
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
  );
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