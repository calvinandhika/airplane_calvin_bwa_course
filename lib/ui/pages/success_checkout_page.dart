import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_apps/cubit/page_cubit.dart';
import 'package:travel_apps/shared/theme.dart';
import 'package:travel_apps/ui/widgets/custom_button.dart';

class SuccessCheckoutPage extends StatelessWidget {
  const SuccessCheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image_success.png',
              width: 300,
              height: 150,
            ),
            const SizedBox(
              height: 80,
            ),
            Text(
              'Well Booked 😍',
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Are you ready to explore the new\nworld of experiences?',
              textAlign: TextAlign.center,
              style: greyTextStyle.copyWith(
                fontWeight: light,
                fontSize: 16,
                height: 28 / 16,
              ),
            ),
            const SizedBox(height: 50),
            CustomButton(
              buttonText: 'My Bookings',
              onPressedFunction: () {
                context.read<PageCubit>().setPage(1);
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/main', (route) => false);
              },
              width: 220,
            )
          ],
        ),
      ),
    );
  }
}
