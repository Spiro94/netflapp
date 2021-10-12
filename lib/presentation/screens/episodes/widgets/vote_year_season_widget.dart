import 'package:flutter/material.dart';
import 'package:netflapp/data/models/tv_show_episode_model.dart';

class VoteYearSeasonWidget extends StatelessWidget {
  const VoteYearSeasonWidget({
    Key? key,
    required this.episode,
    required this.theme,
  }) : super(key: key);

  final TvShowEpisodeModel episode;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'IMDb ${episode.voteAverage}',
          style: theme.textTheme.bodyText1
              ?.apply(color: theme.colorScheme.secondary),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '|',
          style: theme.textTheme.bodyText1
              ?.apply(color: theme.colorScheme.secondary),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          episode.airDate.substring(0, 4),
          style: theme.textTheme.bodyText1
              ?.apply(color: theme.colorScheme.secondary),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '|',
          style: theme.textTheme.bodyText1
              ?.apply(color: theme.colorScheme.secondary),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          'Season ${episode.seasonNumber}',
          style: theme.textTheme.bodyText1
              ?.apply(color: theme.colorScheme.secondary),
        ),
      ],
    );
  }
}
