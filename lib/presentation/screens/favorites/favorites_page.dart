import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflapp/core/dependency_injection/dependency_injection.dart';
import 'package:netflapp/presentation/screens/home/bloc/home_bloc.dart';
import 'package:netflapp/presentation/widgets/series_info_widget.dart';

class FavoritesPage extends StatelessWidget {
  static const title = 'Favorites';
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is TvShowsLoading) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Loading',
                ),
              ],
            ),
          );
        } else if (state is TvShowsLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: state.favorites.isNotEmpty
                ? ListView.builder(
                    itemCount: state.favorites.length,
                    itemBuilder: (context, index) {
                      return SeriesInfoWidget(
                        model: state.favorites[index],
                        onPressed: (delete) {
                          instance<HomeBloc>().add(AddFavoriteFromHome(
                              state.favorites[index], delete));
                        },
                      );
                    })
                : const Center(
                    child: Text(
                      'Oh no!\nThere\'s no favorite series added yet!',
                      textAlign: TextAlign.center,
                    ),
                  ),
          );
        } else {
          return const Center(
            child: Text('Error obtaining data'),
          );
        }
      },
    );
  }
}
