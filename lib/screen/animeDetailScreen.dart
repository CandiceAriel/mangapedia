import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mangapedia/api/anime_api.dart';
import 'package:mangapedia/model/detail.dart';
import 'package:mangapedia/widget/animeCard.dart';

void toDetailsScreen(BuildContext context, int malID) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => animeDetailScreen(animeID: malID),
      ));
}

class animeDetailScreen extends StatefulWidget {
  final animeID;

  const animeDetailScreen({Key? key, required this.animeID}) : super(key: key);

  @override
  _animeDetailScreenState createState() => _animeDetailScreenState();
}

class _animeDetailScreenState extends State<animeDetailScreen> {
  late Future<animeDetail> futureDetail;

  @override
  void initState() {
    super.initState();
    futureDetail = getAnimeDetail(widget.animeID);
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      child: FutureBuilder<animeDetail>(
        future: futureDetail,
        builder: (context,snapshot) {
          if(snapshot.hasData){
            return Scaffold(
              appBar: AppBar(
                title: Text('${snapshot.data!.animeTitle}') ,
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: screenWidth/2,
                              child: Image.network('${snapshot.data!.imgURL}'),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: 20.0
                              ),
                              width: 100,
                              child: Column (
                                children: [
                                  Container(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      'Rank',
                                      style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                      )
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      '${snapshot.data!.ranking}',
                                      style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                      )
                                    ),
                                  ),
                                   Container(
                                     margin: EdgeInsets.only(top: 20.0),
                                     alignment: Alignment.topRight,
                                    child: Text(
                                      'Popularity',
                                      style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                      )
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topRight,
                                    child:  Text(
                                      '${snapshot.data!.popularity}',
                                      style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                      )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20.0),
                            child: Column (
                              children: [
                                Container(
                                  child: Text(
                                    '${snapshot.data!.animeTitle}',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    '${snapshot.data!.jpTitle}',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Container(
                                  height:100,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.genres.length,
                                    itemBuilder: (context, index){
                                      return Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: TextButton(
                                          child: Text('${snapshot.data?.genres[index].name}'),
                                          onPressed: (){
                                            print('${snapshot.data?.genres[index].malId}');
                                          },
                                      ));
                                    },
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Column (
                                    children: [
                                      Text(
                                        'Synopsis',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        '${snapshot.data!.synopsis}',
                                        style: GoogleFonts.montserrat(
                                          height:  2,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  )
                                )
                              ],
                            )
                        ),
                      ],
                    ),
                  )
                )
              ),
            );
            //Text('${snapshot.data!.malID}');
          } else if (snapshot.hasError) {
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: Text('${snapshot.error}'),
                      )
                    ],
                  ),
                ),
              ),
            );
          }

          // By default, show a loading spinner.
          return Center(
            child: Container(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(),
            ),
          );
        }
      ),
    );
  }
}