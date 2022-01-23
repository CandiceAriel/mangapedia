import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../api/manga_api.dart';
import '../screen/mangaDetailScreen.dart';

class mangaCard extends StatelessWidget {
  final String title;
  final int mal_ID;
  final String imgURL;

  const mangaCard({Key? key, required this.title, required this.mal_ID, required this.imgURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.0,
      child: Card(
        child: InkWell(
          onTap: () async{
            //Navigator.pushNamed(context, '/' + mal_ID);
            print(mal_ID);
            getMangaDetail(mal_ID);
            toDetailsScreen(context, mal_ID);
            // toDetailsScreen(context,mal_ID);
          },
          child: Column(
            children: [
              Container(
                height: 200,
                child: Image.network(imgURL),
              ),
              Container(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          height: 90,
                          child: Text(
                            title,
                            style: GoogleFonts.montserrat(
                                  fontSize: 14,
                            ),
                          ),
                        ),
                        // Container(
                        //   child:  Text(
                        //     popularity,
                        //     style: GoogleFonts.montserrat(
                        //           fontSize: 14,
                        //     ),
                        //   ),
                        // )
                      ],
                    )
                  )
                )
              ),
            ],
          )
        )
      )
    );
  }
}