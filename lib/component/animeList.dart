import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import components
import '../model/anime.dart';
import '../model/topAnime.dart';
import '../api/anime_api.dart';
import '../widget/animeCard.dart';
import '../widget/animeRecCard.dart';

//Anime schedule
class animeList extends StatefulWidget {
  animeList({Key? key}) : super(key: key);

  @override
  _animeListState createState() => _animeListState();
}

class _animeListState extends State<animeList> {
  late Future<List<Anime>> manga;

  @override
  void initState() {
    super.initState();
    animelistApi.getAnime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 400,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              height: 30,
              child: Text(
                'Episodes',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                ),
              ),
            ),
          ),
          FutureBuilder<List<Anime>>(
          future: animelistApi.getAnime(),
          builder: (context, snapshot) {
            
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: Text("Loading...")
                );
              default:
                if(snapshot.hasError || !snapshot.hasData){
                  return Center(
                    child: Text("404 Not Found")
                    
                  ); 
                } else 
                  return Column(
                    children: [
                      Container(
                        height: 330,
                        child:  ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return animeCard(
                              mal_ID: int.parse('${snapshot.data?[index].anime_malID}'),
                              title: '${snapshot.data?[index].anime_title}',
                              imgURL: '${snapshot.data?[index].anime_imgURL}',
                              popularity: int.parse('${snapshot.data?[index].anime_popularity}'),
                            );
                          }
                        ),
                      )
                    ],
                  );  
            }
          }
        ),
        ],
      ) 
    );
  }
}

class topanimeList extends StatefulWidget {
  topanimeList({Key? key}) : super(key: key);

  @override
  _topanimeListState createState() => _topanimeListState();
}

class _topanimeListState extends State<topanimeList> {

  @override
  void initState() {
    super.initState();
    topanimelistApi.getTopAnime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 400,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              height: 30,
              child: Text(
                'Top Anime',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                ),
              ),
            ),
          ),
          FutureBuilder<List<topAnime>>(
          future: topanimelistApi.getTopAnime(),
          builder: (context, snapshot) {
            
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: Text("Loading...")
                );
              default:
                if(snapshot.hasError || !snapshot.hasData){
                  return Center(
                    child: Text("404 Not Found")
                    
                  ); 
                } else 
                  return Column(
                    children: [
                      
                      Container(
                        height: 350,
                        child:  ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return animeCard(
                              mal_ID: int.parse('${snapshot.data?[index].ani_malId}'),
                              title: '${snapshot.data?[index].ani_title}',
                              imgURL: '${snapshot.data?[index].ani_img_URL}',
                              popularity: int.parse('${snapshot.data?[index].ani_popularity}'),
                            );
                          }
                        ),
                      )
                    ],
                  );  
            }
          }
        ),
        ]
      )
    );
  }
}

class animerecList extends StatefulWidget {
  animerecList({Key? key}) : super(key: key);

  @override
  _animerecListState createState() => _animerecListState();
}

class _animerecListState extends State<animerecList> {

  @override
  void initState() {
    super.initState();
    animeRecApi.getAnimeRec(38450);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 400,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              height: 30,
              child: Text(
                'Anime Recommendations',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                ),
              ),
            ),
          ),
          FutureBuilder<List<AnimeRecommendation>>(
          future: animeRecApi.getAnimeRec(38450),
          builder: (context, snapshot) {
            
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: Text("Loading...")
                );
              default:
                if(snapshot.hasError || !snapshot.hasData){
                  return Center(
                    child: Text("404 Not Found")
                    
                  ); 
                } else 
                  return Column(
                    children: [
                      
                      Container(
                        height: 350,
                        child:  ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return animeRecCard(
                              mal_ID: int.parse('${snapshot.data?[index].malID}'),
                              title: '${snapshot.data?[index].title}',
                              imgURL: '${snapshot.data?[index].imgURL}',
                            );
                          }
                        ),
                      )
                    ],
                  );  
            }
          }
        ),
        ]
      )
    );
  }
}

class recentanimerecList extends StatefulWidget {
  recentanimerecList({Key? key}) : super(key: key);

  @override
  _recentanimerecListState createState() => _recentanimerecListState();
}

class _recentanimerecListState extends State<recentanimerecList> {

  @override
  void initState() {
    super.initState();
    RecentAnimeRecommendationApi.getRecentMangaRec();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 400,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              height: 30,
              child: Text(
                'Anime Recommendations',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                ),
              ),
            ),
          ),
          FutureBuilder<List<RecentAnimeRec>>(
          future: RecentAnimeRecommendationApi.getRecentMangaRec(),
          builder: (context, snapshot) {
            
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: Text("Loading...")
                );
              default:
                if(snapshot.hasError || !snapshot.hasData){
                  print('${snapshot.error}');
                  return Center(
                    child: Text("404 Not Found")
                    
                  ); 
                } else 
                  return Column(
                    children: [
                      
                      Container(
                        height: 350,
                        child:  ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return animeRecCard(
                              mal_ID: int.parse('${snapshot.data?[index].anirec_malID}'),
                              title: '${snapshot.data?[index].anirec_title}'.toString(),
                              imgURL: '${snapshot.data?[index].anirec_imgURL}'.toString(),
                            );
                          }
                        ),
                      )
                    ],
                  );  
            }
          }
        ),
        ]
      )
    );
  }
}
