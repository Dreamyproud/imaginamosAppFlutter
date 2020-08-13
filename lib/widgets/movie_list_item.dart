import 'package:flutter/material.dart';
import 'package:themoviedb/model/movie.dart';
import 'package:themoviedb/widgets/movie_image.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({
    Key key,
    @required this.movie,
    @required this.onTapFunction,
  }) : super(key: key);

  final Movie movie;
  final Function onTapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: Key('${movie.id}'),
      onTap: onTapFunction,
      child: Stack(fit: StackFit.loose, children: <Widget>[
        Container(height: 198, width: 155, child: MovieImage(movie)),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 150),
                    child: Column(
                      children: [
                        Text(
                          movie.title,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ]),
    );
  }
}
