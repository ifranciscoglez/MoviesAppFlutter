import 'package:app_movies/src/provider/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_movies/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
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

    final movieProvider = new MovieProvider();

    movieProvider.getNowPlaying();

    return CardSwiper(
      movies: [1, 2, 3, 4, 5],
    );
  }
}