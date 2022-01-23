class Anime {
  final String anime_title;
  final String anime_imgURL;
  final int anime_malID;
  final int anime_popularity;

  const Anime({
    required this.anime_title,
    required this.anime_malID,
    required this.anime_imgURL,
    required this.anime_popularity,
  });

  factory Anime.fromJson(Map<String, dynamic> json) => Anime(
    anime_title: json['entry']['title']??"",
    anime_malID: json['entry']['mal_id']??0,
    anime_imgURL: json['entry']['images']['jpg']['image_url']??"",
    anime_popularity: json['popularity']??0,
  );
}