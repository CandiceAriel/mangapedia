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
    malID: json['entry']['mal_id']?? 0,
    imgURL: json['entry']['images']['jpg']['image_url']??"",
  );
}

class MangaRecommendation {
  final String mangarec_title;
  final String mangarec_imgURL;
  final int mangarec_malID;
  // int recentanimeID;
  // final List<RecEntry> entries;

  MangaRecommendation({
    required this.mangarec_title,
      required this.mangarec_malID,
      required this.mangarec_imgURL,
    // required this.recentanimeID,
    // required this.entries,
  });

  factory MangaRecommendation.fromJson(Map<String, dynamic> json) => MangaRecommendation(
    // recentanimeID: json['mal_id'] ?? 0,
    mangarec_title: json['title'] ?? '',
        mangarec_malID: json['mal_id'] ?? 0,
        mangarec_imgURL: json['images']['jpg']['image_url']?? '',
    // entries: new List<RecEntry>.from(json["entry"].map((x) => RecEntry.fromJson(x))),
  );
}

class RecentMangaRecommendation {
  // final String recent_manga_title;
  // final String recent_manga_imgURL;
  // final int recent_manga_malID;
  final List<RecEntry> entries;
  

  const RecentMangaRecommendation({
    // required this.recent_manga_title,
    // required this.recent_manga_malID,
    // required this.recent_manga_imgURL,
    required this.entries,
  });

  factory RecentMangaRecommendation.fromJson(Map<String, dynamic> json) => RecentMangaRecommendation(
    // recent_manga_title: json["entry"]['title']?? '',
    // recent_manga_malID: json["entry"]['mal_id']?? 0,
    // recent_manga_imgURL: json["entry"]['images']['jpg']['image_url']?? '',
    entries: new List<RecEntry>.from(json["entry"].map((x) => RecEntry.fromJson(x))),
  );
}

class RecEntry {
    String mangarec_title;
    String mangarec_imgURL;
    int mangarec_malID;

    RecEntry({
      required this.mangarec_title,
      required this.mangarec_malID,
      required this.mangarec_imgURL,
    });

    factory RecEntry.fromJson(Map<String, dynamic> json) => new RecEntry(
       mangarec_title: json['title'],
        mangarec_malID: json['mal_id'],
        mangarec_imgURL: json['images']['jpg']['image_url'],
    );

    Map<String, dynamic> toJson() => {
        "mal_id": mangarec_malID,
        "title": mangarec_title,
        "url": mangarec_imgURL,
    };
}

