import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themoviedb/widgets/movies_bloc_widget.dart';

import 'movies.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({
    Key key,
  }) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
            height: 200,
            width: 400,
            color: Colors.blueAccent[100],
            child: Container(
                padding: EdgeInsets.only(top: 65, left: 50, right: 50),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Text("Hello, what do you want to watch ?",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                    SizedBox(height: 10),
                    Container(
                        height: 35,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(color: Colors.white),
                          ],
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Icon(Icons.search, color: Colors.grey),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text("Search",
                                  style: TextStyle(color: Colors.grey)),
                            )
                          ],
                        )),
                  ],
                ))),
        Container(
          height: 550,
          width: 400,
          child: MoviesBlocWidget(
            bloc: BlocProvider.of<MoviesBloc>(context),
          ),
        )
      ],
    ));
  }
}
