import 'package:flutter/material.dart';
import 'package:travel_apps/shared/theme.dart';

import 'interest_item.dart';

class BookingDetailsItem extends StatelessWidget {
  BookingDetailsItem({
    Key? key,
    required this.title,
    required this.details,
    this.color,
  }) : super(key: key);

  String title;
  String details;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InterestItem(
            item: title,
          ),
          Text(
            details,
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
