import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import components
import '../model/manga.dart';
import '../api/manga_api.dart';
import '../model/topManga.dart';
import '../widget/mangaCard.dart';

//Manga schedule
class mangaList extends StatefulWidget {
  mangaList({Key? key}) : super(key: key);

  @override
  _mangaListState createState() => _mangaListState();
}

class _mangaListState extends State<mangaList> {
  late Future<List<Manga>> manga;

  @override
  void initState() {
    super.initState();
    mangalistApi.getManga();
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
                'Recommendation',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                ),
              ),
            ),
          ),
          FutureBuilder<List<Manga>>(
            future: mangalistApi.getManga(),
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
                              return mangaCard(
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
        ],
      ) 
    );
  }
}

//top rated Manga List
class topmangaList extends StatefulWidget {
  topmangaList({Key? key}) : super(key: key);

  @override
  _topmangaListState createState() => _topmangaListState();
}

class _topmangaListState extends State<topmangaList> {
  late Future<List<topManga>> topmanga;

  @override
  void initState() {
    super.initState();
    topmangalistApi.getTopManga();
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
                'Top Manga',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                ),
              ),
            ),
          ),
          FutureBuilder<List<topManga>>(
            future: topmangalistApi.getTopManga(),
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
                              return mangaCard(
                                mal_ID: int.parse('${snapshot.data?[index].malId}'),
                                title: '${snapshot.data?[index].title}',
                                imgURL: '${snapshot.data?[index].img_URL}',
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