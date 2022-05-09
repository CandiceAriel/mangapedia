import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mangapedia/api/manga_api.dart';
import 'package:mangapedia/model/mangadetail.dart';
import 'package:mangapedia/widget/mangaCard.dart';

void toDetailsScreen(BuildContext context, int malID) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => mangaDetailScreen(mangaID: malID),
      ));
}

class mangaDetailScreen extends StatefulWidget {
  final int mangaID;

  const mangaDetailScreen({Key? key, required this.mangaID}) : super(key: key);

  @override
  _mangaDetailScreenState createState() => _mangaDetailScreenState();
}

class _mangaDetailScreenState extends State<mangaDetailScreen> {
  late Future<mangadetail> futureDetail;

  @override
  void initState() {
    super.initState();
    futureDetail = getMangaDetail(widget.mangaID);
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      child: FutureBuilder<mangadetail>(
        future: futureDetail,
        builder: (context,snapshot) {
          if(snapshot.hasData){
            return Scaffold(
              appBar: AppBar(
                title: Text('${snapshot.data!.mangaTitle}') ,
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
                                    '${snapshot.data!.mangaTitle}',
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
                                SizedBox(
                                  height: 10,
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
                                      margin:EdgeInsets.only(bottom: 10),
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
                                      child: Column(
                                        children: [
                                          //Volume and CHAPTERS
                                          Row(
                                              children: [
                                                Text('Authors : ',
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 14,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                ),
                                                Padding(
                                                      padding: EdgeInsets.only(right: 5),
                                                      child: Text('${snapshot.data!.chapter}'),
                                                ),
                                              ]
                                            ),
                                          //GENRES ROW//
                                          Row(
                                            children: [
                                              Text('Genres : ',
                                                style: GoogleFonts.montserrat(
                                                   fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                              ),
                                              Flexible(
                                                child: Container(
                                                  padding: EdgeInsets.only(left: 20),
                                                  height: 50.0,
                                                  child:  ListView.builder(
                                                    scrollDirection: Axis.horizontal,
                                                    shrinkWrap: true,
                                                    itemCount: snapshot.data!.genres.length,
                                                    itemBuilder: (context, index){
                                                    return Padding(
                                                      padding: EdgeInsets.only(right: 5),
                                                      child: TextButton(
                                                        child: Text(
                                                          '${snapshot.data?.genres[index].name}',
                                                          style: GoogleFonts.montserrat(
                                                            fontSize: 14,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        onPressed: (){
                                                            print('${snapshot.data?.genres[index].malId}');
                                                        },
                                                      )
                                                    );
                                                  },
                                                ),
                                              )
                                            )
                                          ],
                                        ),
                                        //AUTHORS
                                        Row(
                                            children: [
                                              Text('Authors : ',
                                                style: GoogleFonts.montserrat(
                                                   fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                              ),
                                              Flexible(
                                                child: Container(
                                                  padding: EdgeInsets.only(left: 10),
                                                  height: 50.0,
                                                  child:  ListView.builder(
                                                    scrollDirection: Axis.horizontal,
                                                    shrinkWrap: true,
                                                    itemCount: snapshot.data!.authors.length,
                                                    itemBuilder: (context, index){
                                                    return Padding(
                                                      padding: EdgeInsets.only(right: 5),
                                                      child: TextButton(
                                                        child: Text(
                                                          '${snapshot.data?.authors[index].author_name}',
                                                          style: GoogleFonts.montserrat(
                                                            fontSize: 14,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        onPressed: (){
                                                            print('${snapshot.data?.genres[index].malId}');
                                                        },
                                                      )
                                                    );
                                                  },
                                                ),
                                              )
                                            )
                                          ],
                                        )
                                      ],
                                    )
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