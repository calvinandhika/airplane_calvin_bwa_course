import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_apps/shared/theme.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(defaultRadius),
        child: Image.asset(
          imageUrl,
          height: 70,
          width: 70,
        ),
      ),
    );
  }
}
