import 'package:flutter/material.dart';

import '../../core/utils/constants.dart';
import '../../data/models/tv_show_model.dart';
import 'button_widget.dart';
import 'rating_stars_widget.dart';

class SeriesInfoWidget extends StatefulWidget {
  final TvShowModel model;
  final ValueChanged<bool> onPressed;
  const SeriesInfoWidget(
      {required this.model, required this.onPressed, Key? key})
      : super(key: key);

  @override
  State<SeriesInfoWidget> createState() => _SeriesInfoWidgetState();
}

class _SeriesInfoWidgetState extends State<SeriesInfoWidget> {
  @override
  Widget build(BuildContext context) {
    ThemeData? _theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            child: Hero(
              tag: widget.model.id.toString(),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                      image: NetworkImage(
                          imageUrl + (widget.model.posterPath ?? '')))),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          SizedBox(
            width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.model.name ?? '',
                  overflow: TextOverflow.clip,
                  style: Theme.of(context).textTheme.caption,
                ),
                RatingStarsWidget(calification: widget.model.voteAverage ?? 1),
                Text(
                  'IMDb: ${widget.model.voteAverage}',
                  style: Theme.of(context).textTheme.overline?.apply(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 125,
                      child: ButtonWidget(
                        onPressed: () {},
                        child: Text(
                          'Watch Now',
                          style: _theme.textTheme.headline5
                              ?.apply(color: Colors.black, fontWeightDelta: 5),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          widget.onPressed(widget.model.isFavorite);
                        },
                        icon: Icon(
                          widget.model.isFavorite
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: widget.model.isFavorite
                              ? _theme.colorScheme.primary
                              : _theme.colorScheme.onPrimary,
                        )),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
