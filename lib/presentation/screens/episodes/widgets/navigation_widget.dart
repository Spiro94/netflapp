import 'package:flutter/material.dart';

import '../../../../data/models/tv_show_episode_model.dart';
import '../bloc/episodes_bloc.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({
    Key? key,
    required this.theme,
    required this.episode,
    required this.index,
    required this.state,
    required this.onPrevPressed,
    required this.onNextPressed,
  }) : super(key: key);

  final ThemeData theme;
  final TvShowEpisodeModel episode;
  final int index;
  final EpisodesLoaded state;
  final VoidCallback onPrevPressed;
  final VoidCallback onNextPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (index > 0)
          TextButton(
            onPressed: onPrevPressed,
            child: Row(
              children: [
                const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 20,
                ),
                Text(
                  'Prev',
                  style: theme.textTheme.subtitle2
                      ?.apply(color: theme.colorScheme.primary),
                ),
              ],
            ),
          ),
        Expanded(
            child: Text(
          'Episode ${episode.episodeNumber}',
          textAlign: index > 0
              ? index < state.model.episodes.length - 1
                  ? TextAlign.center
                  : index == (state.model.episodes.length - 1)
                      ? TextAlign.end
                      : TextAlign.center
              : TextAlign.start,
        )),
        (index == state.model.episodes.length - 1)
            ? const SizedBox.shrink()
            : TextButton(
                onPressed: onNextPressed,
                child: Row(
                  children: [
                    Text(
                      'Next',
                      style: theme.textTheme.subtitle2
                          ?.apply(color: theme.colorScheme.primary),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                    ),
                  ],
                ),
              )
      ],
    );
  }
}
