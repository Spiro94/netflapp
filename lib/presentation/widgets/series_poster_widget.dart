import 'package:flutter/material.dart';

class SeriesPosterWidget extends StatelessWidget {
  const SeriesPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: 125,
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 180,
            color: Colors.amber,
          ),
          const Text(
            'Series Title looooong',
            overflow: TextOverflow.clip,
          ),
          const Text(
            'Calification',
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
