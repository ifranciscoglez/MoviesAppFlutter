import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app_movies/src/models/movie_model.dart';

class MovieProvider {

  String _apikey    = '7c5c5d92d674fd08835fa3c780c896bf';
  String _url       = 'api.themoviedb.org';
  String _language  = 'es-ES';

  Future<List<Movie>> _processResponse(Uri url) async {
    
    final resp = await http.get(url);

    final decodeData = json.decode(resp.body);

    final movies = new Movies.fromJsonList(decodeData['results']);

    return movies.items;
  }

  Future<List<Movie>> getNowPlaying() async {

    final url = Uri.https(_url, '/3/movie/now_playing', {
      'api_key' : _apikey, 
      'language' : _language
    });

    return await _processResponse(url);
  }

  Future<List<Movie>> getPopularMovies() async{
    
    final url = Uri.https(_url, '/3/movie/popular', {
      'api_key' : _apikey, 
      'language' : _language
    });

    return await _processResponse(url);
  }

}