import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_apps/models/destination_model.dart';
import 'package:travel_apps/shared/theme.dart';
import 'package:travel_apps/ui/widgets/custom_button.dart';
import 'package:travel_apps/ui/widgets/interest_item.dart';
import 'package:travel_apps/ui/widgets/photo_item.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DestinationModel destination =
        ModalRoute.of(context)!.settings.arguments as DestinationModel;

    Widget header() {
      return Container(
        margin: const EdgeInsets.only(
            top: 225, left: defaultMargin, right: defaultMargin),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.name,
                    style: whiteTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    destination.city,
                    style: whiteTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon_star.png',
                  width: 18,
                ),
                const SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    destination.rating.toString(),
                    style: whiteTextStyle.copyWith(fontWeight: medium),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget mainContainer() {
      return Container(
        height: 446,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        margin: const EdgeInsets.all(defaultMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          color: kWhiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style:
                  blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
            ),
            Text(
              'Berada di jalur jalan provinsi yang\nmenghubungkan Denpasar\nSingaraja serta letaknya yang dekat\ndengan Kebun Raya Eka Karya \nmenjadikan tempat Bali.',
              style: blackTextStyle.copyWith(
                fontWeight: regular,
                fontSize: 14,
                height: 1.85,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Photos',
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: const [
                PhotoItem(imageUrl: 'assets/image_photo1.png'),
                PhotoItem(imageUrl: 'assets/image_photo2.png'),
                PhotoItem(imageUrl: 'assets/image_photo3.png'),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Interest',
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                InterestItem(item: 'Kids Park'),
                InterestItem(item: 'Honor Bridge'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                InterestItem(item: 'City Museum'),
                InterestItem(item: 'Central Mall'),
              ],
            ),
          ],
        ),
      );
    }

    Widget bookNow() {
      return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  NumberFormat.currency(
                    locale: 'id',
                    symbol: 'IDR ',
                    decimalDigits: 0,
                  ).format(destination.price),
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'per orang',
                  style: greyTextStyle.copyWith(fontWeight: light),
                ),
              ],
            ),
            CustomButton(
              buttonText: 'Book Now',
              onPressedFunction: () {
                Navigator.pushNamed(
                  context,
                  '/choose-seat',
                  arguments: destination,
                );
              },
              width: 170,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(destination.imageUrl),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 186),
              width: double.infinity,
              height: 214,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.05),
                    Colors.black.withOpacity(0.95),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 30),
                  child: Image.asset(
                    'assets/icon_emblem.png',
                    height: 24,
                    width: 108,
                  ),
                ),
                header(),
                mainContainer(),
                bookNow(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
