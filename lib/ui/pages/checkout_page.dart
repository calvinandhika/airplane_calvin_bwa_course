import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travel_apps/cubit/auth_cubit.dart';
import 'package:travel_apps/cubit/transaction_cubit.dart';
import 'package:travel_apps/models/transaction_model.dart';
import 'package:travel_apps/shared/theme.dart';
import 'package:travel_apps/ui/widgets/booking_details_item.dart';
import 'package:travel_apps/ui/widgets/custom_button.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel transaction;
  const CheckoutPage({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        children: [
          Container(
            height: 65,
            width: double.infinity,
            margin: const EdgeInsets.only(
              top: 50,
              left: defaultMargin,
              right: defaultMargin,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image_checkout.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'CGK',
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'TLC',
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
              bottom: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tangerang',
                  style: greyTextStyle.copyWith(
                    fontWeight: light,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Ciliwung',
                  style: greyTextStyle.copyWith(
                    fontWeight: light,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget bookingDetails() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
        padding: const EdgeInsets.only(
          top: 30,
          bottom: 14,
          left: 20,
          right: 20,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.network(
                    transaction.destination.imageUrl,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.destination.name,
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        transaction.destination.city,
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
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
                        transaction.destination.rating.toString(),
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Booking Details',
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            BookingDetailsItem(
              title: 'Traveler',
              details: '${transaction.amountOfTraveler} person',
            ),
            BookingDetailsItem(
              title: 'Seat',
              details: transaction.selectedSeats,
            ),
            BookingDetailsItem(
              title: 'Insurance',
              details: transaction.insurance ? 'Yes' : 'No',
              color: transaction.insurance ? kGreenColor : kRedColor,
            ),
            BookingDetailsItem(
              title: 'Refundable',
              details: transaction.refundable ? 'Yes' : 'No',
              color: transaction.refundable ? kGreenColor : kRedColor,
            ),
            BookingDetailsItem(
              title: 'VAT',
              details: ('${(transaction.vat * 100).toStringAsFixed(0)}%'),
            ),
            BookingDetailsItem(
              title: 'Price',
              details: NumberFormat.currency(
                locale: 'id',
                symbol: 'IDR ',
                decimalDigits: 0,
              ).format((transaction.price)),
            ),
            BookingDetailsItem(
              title: 'Grand Total',
              details: NumberFormat.currency(
                locale: 'id',
                symbol: 'IDR ',
                decimalDigits: 0,
              ).format((transaction.grandTotal)),
              color: kPrimaryColor,
            ),
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              height: 170,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Details',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/image_card.png'),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icon_plane.png',
                              width: 24,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Pay',
                              style: whiteTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              NumberFormat.currency(
                                locale: 'id',
                                symbol: 'IDR ',
                                decimalDigits: 0,
                              ).format((state.user.balance)),
                              style: blackTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 18,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'Current Balance',
                              style: greyTextStyle.copyWith(fontWeight: light),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            bookingDetails(),
            const SizedBox(height: 30),
            paymentDetails(),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: BlocConsumer<TransactionCubit, TransactionState>(
                listener: (context, state) {
                  if (state is TransactionSuccess) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/success-checkout', (route) => false);
                  }
                  if (state is TransactionFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                      state.error,
                      style: redTextStyle,
                    )));
                  }
                },
                builder: (context, state) {
                  if (state is TransactionLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return CustomButton(
                    buttonText: 'Pay Now',
                    onPressedFunction: () {
                      context
                          .read<TransactionCubit>()
                          .createTransaction(transaction);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 50),
              child: TextButton(
                child: Text(
                  'Terms and Conditions',
                  textAlign: TextAlign.center,
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: light,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
