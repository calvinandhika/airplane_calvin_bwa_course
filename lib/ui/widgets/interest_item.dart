import 'package:flutter/material.dart';
import 'package:travel_apps/shared/theme.dart';

class InterestItem extends StatelessWidget {
  const InterestItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final String item;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icon_check.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            item,
            style: blackTextStyle,
          ),
        ],
      ),
    );
  }
}
