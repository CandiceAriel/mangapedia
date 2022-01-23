class topAnime {
  final String ani_title;
  final int ani_malId;
  final int ani_popularity;
  final String ani_img_URL;

  const topAnime({
    required this.ani_title,
    required this.ani_malId,
    required this.ani_popularity,
    required this.ani_img_URL,
  });

  factory topAnime.fromJson(Map<String, dynamic> json) => topAnime(
    ani_title: json['title']??"",
    ani_malId: json['mal_id']??0,
    ani_popularity: json['popularity']??0,
    ani_img_URL: json['images']['jpg']['image_url']??"",
  );
    
}