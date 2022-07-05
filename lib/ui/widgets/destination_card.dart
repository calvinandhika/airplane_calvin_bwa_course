import 'package:flutter/material.dart';
import 'package:travel_apps/models/destination_model.dart';
import 'package:travel_apps/shared/theme.dart';

class DestinationCard extends StatelessWidget {
  const DestinationCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.price,
    this.rating = '4.8',
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final String location;
  final String rating;
  final int price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-page',
            arguments: DestinationModel(
              id: title,
              price: price,
              city: location,
              name: title,
              imageUrl: imageUrl,
              rating: double.parse(rating),
            ));
      },
      child: Container(
        width: 200,
        height: 323,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kWhiteColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(imageUrl),
              ),
              Positioned(
                top: 0,
                right: 0,
                width: 54.5,
                height: 30,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                    ),
                    color: kWhiteColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icon_star.png',
                          width: 18,
                        ),
                        const SizedBox(width: 2),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            rating,
                            style: blackTextStyle.copyWith(fontWeight: medium),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      location,
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
