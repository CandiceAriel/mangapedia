class Manga {
  final String title;
  final String imgURL;
  final int malID;

  const Manga({
    required this.title,
    required this.malID,
    required this.imgURL,
  });

  factory Manga.fromJson(Map<String, dynamic> json) => Manga(
    title: json['entry']['title']??"",
    malID: json['entry']['mal_id']??'',
    imgURL: json['entry']['images']['jpg']['image_url']??"",
  );
}