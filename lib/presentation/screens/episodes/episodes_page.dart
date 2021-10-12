import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/loading_widget.dart';

import '../../../core/dependency_injection/dependency_injection.dart';
import '../../../core/utils/constants.dart';
import '../../../data/models/tv_show_episode_model.dart';
import '../../../data/models/tv_show_model.dart';
import 'bloc/episodes_bloc.dart';
import 'widgets/vote_year_season_widget.dart';
import 'widgets/navigation_widget.dart';

class EpisodesPage extends StatefulWidget {
  static const String routeName = 'episodes_page';
  final TvShowModel model;
  const EpisodesPage({required this.model, Key? key}) : super(key: key);

  @override
  State<EpisodesPage> createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    instance<EpisodesBloc>().add(LoadEpisodes(widget.model.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocBuilder<EpisodesBloc, EpisodesState>(
      builder: (context, state) {
        Widget body = Container(
          color: Colors.black87,
          child: const LoadingWidget(),
        );
        if (state is EpisodesLoaded) {
          body = PageView.builder(
            controller: _pageController,
            itemCount: state.model.episodes.length,
            itemBuilder: (context, index) {
              TvShowEpisodeModel episode = state.model.episodes[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overscroll) {
                    overscroll.disallowGlow();
                    return true;
                  },
                  child: ListView(
                    children: [
                      NavigationWidget(
                        theme: theme,
                        episode: episode,
                        index: index,
                        state: state,
                        onPrevPressed: () {
                          _pageController.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        onNextPressed: () {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image(
                            image:
                                NetworkImage(imageUrl + (episode.stillPath))),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Text(
                        episode.name,
                        style: theme.textTheme.headline2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      VoteYearSeasonWidget(episode: episode, theme: theme),
                      const Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 10),
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                      Text(
                        episode.overview,
                        overflow: TextOverflow.fade,
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
        if (state is EpisodesLoadedFailed) {
          body = const Center(
            child: Text('An error ocurred obtaining data'),
          );
        }
        return Scaffold(
            appBar: AppBar(
              title: Text(widget.model.name),
            ),
            body: body);
      },
    );
  }
}
