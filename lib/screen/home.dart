import 'package:flutter/material.dart';

import 'package:mangapedia/widget/mangaCard.dart';
import '../component/mangaList.dart';
import '../component/animeList.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home')
      ),
      body: SafeArea(
        child:SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                //mangaList(),
                topmangaList(),
                //animeList(),
                //topanimeList(),
              ],
            ),
          ),
        )
      )
    );
  }
}