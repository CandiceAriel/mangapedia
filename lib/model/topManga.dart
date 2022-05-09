class topManga {
  final String title;
  final int malId;
  final String img_URL;

  const topManga({
    required this.title,
    required this.malId,
    required this.img_URL,
  });

  factory topManga.fromJson(Map<String, dynamic> json) => topManga(
    title: json['title']??"",
    malId: json['mal_id'],
    img_URL: json['images']['jpg']['image_url']??"",

  );
    
}