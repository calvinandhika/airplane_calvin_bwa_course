import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travel_apps/cubit/seat_cubit.dart';
import 'package:travel_apps/models/destination_model.dart';
import 'package:travel_apps/models/transaction_model.dart';
import 'package:travel_apps/shared/theme.dart';
import 'package:travel_apps/ui/pages/checkout_page.dart';
import 'package:travel_apps/ui/widgets/custom_button.dart';
import 'package:travel_apps/ui/widgets/seat_item.dart';

enum SeatStatus { unavailable, available, selected }

class ChooseSeatPage extends StatelessWidget {
  const ChooseSeatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DestinationModel destination =
        ModalRoute.of(context)!.settings.arguments as DestinationModel;

    Widget iconIndex() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/icon_available.png',
            width: 24,
          ),
          Text(
            'Available',
            style: blackTextStyle.copyWith(
              fontWeight: regular,
            ),
          ),
          Image.asset(
            'assets/icon_selected.png',
            width: 24,
          ),
          Text(
            'Selected',
            style: blackTextStyle.copyWith(
              fontWeight: regular,
            ),
          ),
          Image.asset(
            'assets/icon_unavailable.png',
            width: 24,
          ),
          Text(
            'Unavailable',
            style: blackTextStyle.copyWith(
              fontWeight: regular,
            ),
          ),
        ],
      );
    }

    Widget barisSatu() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 48,
            height: 48,
            child: Text(
              'A',
              style: greyTextStyle.copyWith(
                fontWeight: regular,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 48,
            height: 48,
            child: Text(
              'B',
              style: greyTextStyle.copyWith(
                fontWeight: regular,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 48,
            height: 48,
            child: Text(
              '',
              style: greyTextStyle.copyWith(
                fontWeight: regular,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 48,
            height: 48,
            child: Text(
              'C',
              style: greyTextStyle.copyWith(
                fontWeight: regular,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 48,
            height: 48,
            child: Text(
              'D',
              style: greyTextStyle.copyWith(
                fontWeight: regular,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }

    Widget chooseSeat() {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          color: kWhiteColor,
        ),
        child: BlocBuilder<SeatCubit, List<String>>(
          builder: (context, state) {
            return Column(
              children: [
                //baris 1
                barisSatu(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A1',
                      ),
                      SeatItem(
                        id: 'B1',
                      ),
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '1',
                            style: greyTextStyle.copyWith(
                              fontWeight: regular,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C1',
                      ),
                      SeatItem(
                        id: 'D1',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A2',
                      ),
                      SeatItem(
                        id: 'B2',
                      ),
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '2',
                            style: greyTextStyle.copyWith(
                              fontWeight: regular,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C2',
                      ),
                      SeatItem(
                        id: 'D2',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A3',
                      ),
                      SeatItem(
                        id: 'B3',
                      ),
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '3',
                            style: greyTextStyle.copyWith(
                              fontWeight: regular,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C3',
                      ),
                      SeatItem(
                        id: 'D3',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A4',
                      ),
                      SeatItem(
                        id: 'B4',
                      ),
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '4',
                            style: greyTextStyle.copyWith(
                              fontWeight: regular,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C4',
                      ),
                      SeatItem(
                        id: 'D4',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        isAvailable: false,
                        id: 'A5',
                      ),
                      SeatItem(
                        id: 'B5',
                      ),
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '5',
                            style: greyTextStyle.copyWith(
                              fontWeight: regular,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C5',
                      ),
                      SeatItem(
                        id: 'D5',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Seat',
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            state.join(', '),
                            style: blackTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 17),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'IDR ',
                          decimalDigits: 0,
                        ).format((state.length * destination.price)),
                        style: purpleTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        margin: const EdgeInsets.only(
            top: 50, left: defaultMargin, right: defaultMargin),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Your\nFavorite Seat',
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 30),
              iconIndex(),
              const SizedBox(height: 30),
              chooseSeat(),
              const SizedBox(height: 30),
              BlocBuilder<SeatCubit, List<String>>(
                builder: (context, state) {
                  return CustomButton(
                    buttonText: 'Continue to Checkout',
                    onPressedFunction: () {
                      int price = state.length * destination.price;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckoutPage(
                            transaction: TransactionModel(
                              destination: destination,
                              amountOfTraveler: state.length,
                              selectedSeats: state.join(', '),
                              insurance: true,
                              refundable: false,
                              vat: 0.45,
                              price: state.length * destination.price,
                              grandTotal: (price * 1.45).toInt(),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
