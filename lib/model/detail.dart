class animeDetail {
  final String animeTitle;
  final String jpTitle;
  final String imgURL;
  final String synopsis;
  final List<Producers> producers;
  final List<Genre> genres;
  final int malID;
  final int ranking;
  final int popularity;
  final int episodes;
  final List<Studios> studios;


  animeDetail({
    required this.animeTitle,
    required this.jpTitle,
    required this.malID,
    required this.imgURL,
    required this.synopsis,
    required this.genres,
    required this.ranking,
    required this.popularity,
    required this.studios,
    required this.episodes,
    required this.producers,
  });

  factory animeDetail.fromJson(Map<String, dynamic> json) => animeDetail (
      animeTitle: json['title']?? '',
      jpTitle: json['title_japanese']?? '',
      malID: json['mal_id']?? 0,
      imgURL: json['images']['jpg']['image_url']?? '',
      genres: new List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
      ranking: json['rank']?? 0,
      popularity: json['popularity']?? 0,
      synopsis: json['synopsis']?? '',
      studios: new List<Studios>.from(json["studios"].map((x) => Studios.fromJson(x))),
      episodes: json['episodes']?? 0,
      producers: new List<Producers>.from(json["producers"].map((x) => Producers.fromJson(x))),
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

class Studios {
    int studio_malId;
    String studio_type;
    String studio_name;
    String  studio_url;

    Studios({
      required  this. studio_malId,
      required  this. studio_type,
      required  this. studio_name,
      required  this. studio_url,
    });

    factory Studios.fromJson(Map<String, dynamic> json) => new Studios(
         studio_malId: json["mal_id"],
         studio_type: json["type"],
         studio_name: json["name"],
         studio_url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "mal_id":  studio_malId,
        "type":  studio_type,
        "name":  studio_name,
        "url":  studio_url,
    };
}

class Producers {
    int prod_malId;
    String prod_type;
    String prod_name;
    String  prod_url;

    Producers({
      required  this.prod_malId,
      required  this.prod_type,
      required  this.prod_name,
      required  this.prod_url,
    });

    factory Producers.fromJson(Map<String, dynamic> json) => new Producers(
        prod_malId: json["mal_id"],
        prod_type: json["type"],
        prod_name: json["name"],
        prod_url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "mal_id":  prod_malId,
        "type":  prod_type,
        "name":  prod_name,
        "url":  prod_url,
    };
}