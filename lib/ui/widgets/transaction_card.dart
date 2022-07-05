import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_apps/models/transaction_model.dart';
import 'package:travel_apps/shared/theme.dart';
import 'package:travel_apps/ui/widgets/booking_details_item.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCard(
    this.transaction, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: defaultMargin),
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
}
