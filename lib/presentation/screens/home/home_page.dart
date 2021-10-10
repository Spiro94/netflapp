import 'package:flutter/material.dart';
import '../../widgets/series_info_widget.dart';
import '../../widgets/series_poster_widget.dart';

class HomePage extends StatefulWidget {
  static const title = 'Home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ThemeData? _theme;

  @override
  Widget build(BuildContext context) {
    _theme ??= Theme.of(context);
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      children: [
        Text(
          'Popular',
          style: _theme?.textTheme.headline3,
        ),
        SizedBox(
          height: 300,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            scrollDirection: Axis.horizontal,
            children: const [
              SeriesPosterWidget(),
              SeriesPosterWidget(),
              SeriesPosterWidget(),
              SeriesPosterWidget(),
            ],
          ),
        ),
        GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'See all',
                textAlign: TextAlign.right,
                style: _theme?.textTheme.headline6
                    ?.apply(color: _theme?.colorScheme.primary),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: _theme?.colorScheme.primary,
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
          style: _theme?.textTheme.headline3,
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            SeriesInfoWidget(),
            SeriesInfoWidget(),
            SeriesInfoWidget(),
          ],
        ),
      ],
    );
  }
}
