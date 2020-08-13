import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:themoviedb/movies/movies.dart';
import 'package:themoviedb/movies/movies_detail_page.dart';
import 'package:themoviedb/widgets/bottom_loader.dart';
import 'package:themoviedb/widgets/error_message_widget.dart';
import 'package:themoviedb/widgets/loading_indicator.dart';
import 'package:themoviedb/widgets/movie_list_item.dart';

import '../commons/constants.dart';

class MoviesBlocWidget extends StatefulWidget {
  const MoviesBlocWidget({Key key, this.bloc, this.event});

  final MoviesBloc bloc;
  final MoviesEvent event;

  @override
  _MoviesBlocWidgetState createState() => _MoviesBlocWidgetState();
}

class _MoviesBlocWidgetState extends State<MoviesBlocWidget> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  MoviesBloc _moviesBloc;
  MoviesEvent _event;

  @override
  void initState() {
    _moviesBloc = widget.bloc;
    _event = widget.event ?? Fetch();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      bloc: _moviesBloc..add(_event),
      builder: (context, state) {
        if (state is MoviesFetched) {
          //Text("Recommended for you", style: TextStyle(color: Colors.white),),
          return Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[700],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 25),
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 100, bottom: 10),
                          child: Text(
                            "RECOMMENDED FOR YOU",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            "See all",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                          width: 400,
                          height: 499,
                          padding: EdgeInsets.only(left: 16),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[700],
                          ),
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.3,
                              mainAxisSpacing: 0.0,
                              crossAxisSpacing: 30.0,
                            ),
                            scrollDirection: Axis.horizontal,
                            key: PageStorageKey('movies_list'),
                            itemBuilder: (context, index) {
                              final movie = state.movies[index];
                              return index >= state.movies.length
                                  ? BottomLoader()
                                  : MovieListItem(
                                      movie: movie,
                                      onTapFunction: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MoviesDetailPage(
                                              movie: movie,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                            },
                            itemCount: state.movies.length,
                            controller: _scrollController,
                          )))
                ],
              ));
        }
        if (state is MoviesEmpty) {
          return ErrorMessageWidget(
            message: 'No hay peliculas disponibles',
            textKey: emptyStateKey,
          );
        }
        if (state is MoviesError) {
          return ErrorMessageWidget(
            message: 'No hay peliculas disponibles',
            textKey: errorStateKey,
          );
        }
        return LoadingIndicator();
      },
    );
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _moviesBloc.add(_event);
    }
  }
}
