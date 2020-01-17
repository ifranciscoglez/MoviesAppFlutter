import 'package:app_movies/src/provider/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_movies/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {

  final movieProvider = new MovieProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Peliculas en cines"),
        centerTitle: false,
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _swiperCards()
          ],
        ),
      )
    );
  }
  
  Widget _swiperCards(){

    return FutureBuilder(
      future: movieProvider.getNowPlaying(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        
        if(snapshot.hasData){
          return CardSwiper( movies: snapshot.data);
        }else{
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
            )
          );
        }
      },
    );
  }
}