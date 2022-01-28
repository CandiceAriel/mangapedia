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
  bool _expanded = false;
  List<String> infoCategory = ['Synopsis', "Information"];

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
                                      'Popularityyyy',
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
                                 ExpansionTile(
                                  tilePadding: EdgeInsets.all(0),
                                  title: Text(
                                    'Synopsis',
                                    style: TextStyle(
                                      fontSize: 16.0, 
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black
                                    ),
                                  ),
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child:
                                          Text(
                                            '${snapshot.data!.synopsis}',
                                            style: GoogleFonts.montserrat(
                                              height:  2,
                                              fontSize: 14,
                                            ),
                                          ),
                                    )
                                  ],
                                ),
                                ExpansionTile(
                                  tilePadding: EdgeInsets.all(0),
                                  collapsedTextColor: Colors.black,
                                  title: Text(
                                    'Information',
                                    style: TextStyle(
                                      fontSize: 16.0, 
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black
                                    ),
                                  ),
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: snapshot.data!.studios.length,
                                        itemBuilder: (context, index){
                                          return Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      right: 5
                                                    ),
                                                    child: Text('Studio(s) : ',
                                                    style: GoogleFonts.montserrat(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      right: 10
                                                    ),
                                                    child: Text('${snapshot.data?.studios[index].studio_name}',
                                                    style: GoogleFonts.montserrat(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text('Genre(s) : ',
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Container(
                                                      height: 50.0,
                                                      child:  ListView.builder(
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
                                                    )
                                                  )
                                                ],
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
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