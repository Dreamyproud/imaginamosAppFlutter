import 'package:flutter/material.dart';
import 'package:themoviedb/commons/constants.dart';
import 'package:themoviedb/commons/date_utils.dart';
import 'package:themoviedb/model/movie.dart';
import 'package:themoviedb/widgets/movie_image.dart';

class MoviesDetailPage extends StatelessWidget {
  const MoviesDetailPage({
    Key key,
    @required this.movie,
  }) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              MovieImage(movie),
              Container(
                width: 400,
                color: Colors.blueGrey[700],
              child: Padding(
                  padding: const EdgeInsets.only(left:16,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                          width: 400,
                          color: Colors.blueGrey[700],
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(movie.title, style: titleStyle),
                              ),
                             Padding(
                               padding: const EdgeInsets.only(top: 10),
                               child: Row(
                                 children: [
                                   Wrap(
                                     children: <Widget>[
                                       Chip(
                                         label: Text("Watch now"),
                                       ),
                                       SizedBox(width: 140),
                                       Icon(Icons.star,color: Colors.yellow,),
                                       Icon(Icons.star,color: Colors.yellow,),
                                       Icon(Icons.star,color: Colors.yellow,),
                                       Icon(Icons.star,color: Colors.yellow[200]),
                                     ],
                                   ),
                                 ],
                               ),
                             ),
                              Padding(
                                padding: EdgeInsets.only(top: 20,right: 16),
                                child: Text(
                                  movie.overview,
                                  textAlign: TextAlign.justify,
                                  style:
                                  TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.white),
                                ),
                              ),
                              Wrap(
                                children: <Widget>[
                                  for (var genre in genresBy(movie.genreIds))
                                    Chip(
                                      label: Text(genre.name),
                                    )
                                ],
                              ),
                              Text(
                                'Creado en ' +
                                    DateUtils.formatDate(
                                        movie.releaseDate, 'dd MMMM yyyy'),
                                textAlign: TextAlign.left,
                                style:
                                TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 40,
                              )
                            ],
                          )
                      )
                    ],
                  ),
                )
              )
            ],
          ),
        ));
  }
}
