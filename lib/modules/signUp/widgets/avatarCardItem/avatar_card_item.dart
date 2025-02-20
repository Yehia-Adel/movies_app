import 'package:flutter/material.dart';

class AvatarCardItem extends StatelessWidget {
  final int index;

  AvatarCardItem({super.key, required this.index});

  List<String> charactersList = [
    "assets/images/character/gamer (1).png",
    "assets/images/character/gamer (1) (1).png",
    "assets/images/character/gamer (1) (2).png",
    "assets/images/character/gamer (1) (3).png",
    "assets/images/character/gamer (1) (4).png",
    "assets/images/character/gamer (1) (5).png",
    "assets/images/character/gamer (1) (6).png",
    "assets/images/character/gamer (1) (7).png",
    "assets/images/character/gamer (1) (8).png"
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Image(image: AssetImage(charactersList[index])),
    );
  }
}
