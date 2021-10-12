import 'package:flutter/material.dart';
import '../screens/details/details_page.dart';

import '../../core/utils/constants.dart';
import '../../data/models/tv_show_model.dart';
import 'rating_stars_widget.dart';

class SeriesPosterWidget extends StatelessWidget {
  final TvShowModel model;
  const SeriesPosterWidget({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.pushNamed(context, DetailsPage.routeName, arguments: model);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        width: 125,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 150,
              child: Hero(
                tag: model.id.toString(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                    image: NetworkImage(
                      imageUrl + (model.posterPath),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              model.name,
              overflow: TextOverflow.clip,
              style: Theme.of(context).textTheme.caption,
            ),
            RatingStarsWidget(calification: model.voteAverage),
          ],
        ),
      ),
    );
  }
}
