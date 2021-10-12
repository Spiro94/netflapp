import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/dependency_injection/dependency_injection.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/series_info_widget.dart';
import '../../widgets/series_poster_widget.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  static const title = 'Home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    instance<HomeBloc>().add(LoadTvShows());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is TvShowsLoading) {
          return const Center(
            child: LoadingWidget(),
          );
        } else if (state is TvShowsLoaded) {
          return NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
              return true;
            },
            child: ListView(
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
                ...state.recommended.map((e) => SeriesInfoWidget(
                      model: e,
                      onPressed: (delete) {
                        instance<HomeBloc>()
                            .add(AddFavoriteFromHome(e, delete));
                      },
                    ))
              ],
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
