import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStarsWidget extends StatelessWidget {
  final double calification;
  const RatingStarsWidget({required this.calification, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      ignoreGestures: true,
      itemSize: 10,
      initialRating: calification / 2,
      direction: Axis.horizontal,
      allowHalfRating: true,
      ratingWidget: RatingWidget(
        full: Icon(
          Icons.star,
          color: Theme.of(context).colorScheme.secondary,
        ),
        half: Icon(
          Icons.star_half,
          color: Theme.of(context).colorScheme.secondary,
        ),
        empty: Icon(
          Icons.star_border_outlined,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
