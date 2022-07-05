import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_apps/cubit/auth_cubit.dart';
import 'package:travel_apps/shared/theme.dart';
import 'package:travel_apps/ui/widgets/custom_button.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bonusCard() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Center(
              child: Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: kPrimaryColor.withOpacity(0.5),
                      blurRadius: 50,
                      offset: const Offset(0, 10),
                    )
                  ],
                  image: const DecorationImage(
                    image: AssetImage('assets/image_card.png'),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 24,
                      left: 24,
                      child: Text('Name', style: whiteTextStyle),
                    ),
                    Positioned(
                      top: 45,
                      left: 24,
                      child: SizedBox(
                        width: 170,
                        child: Text(
                          state.user.name,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: whiteTextStyle.copyWith(
                            fontWeight: medium,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 37,
                      right: 24,
                      child: Row(
                        children: [
                          Image.asset('assets/icon_plane.png', width: 24),
                          const SizedBox(width: 6.0),
                          Text(
                            'Pay',
                            style: whiteTextStyle.copyWith(
                                fontWeight: medium, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 63,
                      left: 24,
                      child: Text(
                        'Balance',
                        style: whiteTextStyle.copyWith(fontWeight: light),
                      ),
                    ),
                    Positioned(
                      bottom: 24,
                      left: 24,
                      child: Text(
                        'IDR 280.000.000',
                        style: whiteTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 150),
            bonusCard(),
            const SizedBox(height: 91),
            Text(
              'Big Bonus 🎉',
              style: blackTextStyle.copyWith(
                fontSize: 32,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'We give you early credit so that\nyou can buy a flight ticket',
              style: greyTextStyle.copyWith(
                fontWeight: light,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            CustomButton(
              buttonText: 'Start Fly Now',
              onPressedFunction: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/main', (route) => false);
              },
              width: 220,
            ),
          ],
        ),
      ),
    );
  }
}
