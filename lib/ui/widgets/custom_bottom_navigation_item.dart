import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_apps/cubit/page_cubit.dart';
import 'package:travel_apps/shared/theme.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  const CustomBottomNavigationItem({
    Key? key,
    required this.index,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: BlocConsumer<PageCubit, int>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Image.asset(
                imageUrl,
                height: 24,
                color: state == index ? kPrimaryColor : kGreyColor,
              ),
              Container(
                height: 2,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: state == index ? kPrimaryColor : kTransparent,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
