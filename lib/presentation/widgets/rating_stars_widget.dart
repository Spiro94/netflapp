import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStarsWidget extends StatelessWidget {
  final double calification;
  final double size;
  const RatingStarsWidget(
      {required this.calification, this.size = 10, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      ignoreGestures: true,
      itemSize: size,
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
