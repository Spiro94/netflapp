import 'package:flutter/material.dart';

class BackgroundLoginWidget extends StatelessWidget {
  final Widget content;
  const BackgroundLoginWidget({required this.content, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.none,
              image: AssetImage('assets/images/poster_login.jpeg'),
            ),
          ),
        ),
        Positioned(
          top: 100,
          child: Text(
            'Welcome!',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        content,
      ],
    );
  }
}
