import 'package:flutter/material.dart';

import 'button_widget.dart';

class SeriesInfoWidget extends StatefulWidget {
  const SeriesInfoWidget({Key? key}) : super(key: key);

  @override
  State<SeriesInfoWidget> createState() => _SeriesInfoWidgetState();
}

class _SeriesInfoWidgetState extends State<SeriesInfoWidget> {
  IconData _iconFavorite = Icons.favorite_border_rounded;
  Color? _color;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    ThemeData? _theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 150,
      child: Row(
        children: [
          Container(
            width: 100,
            color: Colors.green,
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Series Title'),
              const Text('Stars'),
              const Text('Calification'),
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
                        _isPressed = !_isPressed;
                        if (_isPressed) {
                          _iconFavorite = Icons.favorite_rounded;
                          _color = _theme.colorScheme.primary;
                        } else {
                          _iconFavorite = Icons.favorite_border_rounded;
                          _color = _theme.colorScheme.onPrimary;
                        }
                        setState(() {});
                      },
                      icon: Icon(
                        _iconFavorite,
                        color: _color,
                      ))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
