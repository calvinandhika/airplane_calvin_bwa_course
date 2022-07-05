import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_apps/cubit/seat_cubit.dart';
import 'package:travel_apps/shared/theme.dart';

// ignore: must_be_immutable
class SeatItem extends StatelessWidget {
  SeatItem({
    Key? key,
    required this.id,
    this.isAvailable = true,
  }) : super(key: key);

  final String id;
  bool isAvailable;

  @override
  Widget build(BuildContext context) {
    Color boxColor;
    Color borderColor;
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    return BlocBuilder<SeatCubit, List<String>>(
      builder: (context, state) {
        if (isAvailable) {
          boxColor = kAvailableColor;
          borderColor = kPrimaryColor;
        } else {
          boxColor = kUnavailableColor;
          borderColor = kUnavailableColor;
        }
        if (isSelected) {
          boxColor = kPrimaryColor;
          borderColor = kPrimaryColor;
        }

        return GestureDetector(
          onTap: () {
            if (isAvailable) {
              context.read<SeatCubit>().selectSeat(id);
            }
          },
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: boxColor,
              border: Border.all(
                color: borderColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            child: (isSelected)
                ? Center(
                    child: Text(
                      'YOU',
                      style: whiteTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                  )
                : null,
          ),
        );
      },
    );
  }
}
