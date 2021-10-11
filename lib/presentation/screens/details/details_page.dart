import 'package:flutter/material.dart';
import 'package:netflapp/core/utils/constants.dart';
import 'package:netflapp/data/models/tv_show_model.dart';
import 'package:netflapp/presentation/widgets/button_widget.dart';
import 'package:netflapp/presentation/widgets/rating_stars_widget.dart';

class DetailsPage extends StatelessWidget {
  static const String routeName = '/details_page';
  final TvShowModel model;
  const DetailsPage({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image(
                  height: MediaQuery.of(context).size.height / 2,
                  image: NetworkImage(imageUrl + (model.posterPath ?? ''))),
            ),
            Text(
              model.name ?? '',
              overflow: TextOverflow.clip,
              style: Theme.of(context).textTheme.headline3,
            ),
            RatingStarsWidget(
              calification: model.voteAverage ?? 1,
              size: 20,
            ),
            Text(
              'IMDb: ${model.voteAverage}',
              style: Theme.of(context).textTheme.headline5?.apply(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            ButtonWidget(
              onPressed: () {},
              child: Text(
                'Watch Now',
                style: _theme.textTheme.headline5?.apply(
                  color: Colors.black,
                  fontWeightDelta: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
