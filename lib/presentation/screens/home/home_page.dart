import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflapp/presentation/screens/home/bloc/home_bloc.dart';
import '../../widgets/series_info_widget.dart';
import '../../widgets/series_poster_widget.dart';

class HomePage extends StatefulWidget {
  static const title = 'Home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
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
          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            children: [
              Text(
                'Popular',
                style: _theme.textTheme.headline3,
              ),
              SizedBox(
                  height: 250,
                  child: ListView.builder(
                    itemCount: state.popular.length,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SeriesPosterWidget(model: state.popular[index]);
                    },
                  )),
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'See all',
                      textAlign: TextAlign.right,
                      style: _theme.textTheme.headline6
                          ?.apply(color: _theme.colorScheme.primary),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: _theme.colorScheme.primary,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  thickness: 2,
                ),
              ),
              Text(
                'Recommendations',
                style: _theme.textTheme.headline3,
              ),
              const SizedBox(
                height: 20,
              ),
              ...state.recommended.map((e) => SeriesInfoWidget(model: e))
            ],
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
