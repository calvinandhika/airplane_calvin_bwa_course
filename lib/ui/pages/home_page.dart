import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_apps/cubit/auth_cubit.dart';
import 'package:travel_apps/cubit/destination_cubit.dart';
import 'package:travel_apps/models/destination_model.dart';
import 'package:travel_apps/shared/theme.dart';
import 'package:travel_apps/ui/widgets/destination_card.dart';
import 'package:travel_apps/ui/widgets/destination_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationCubit>().fetchDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Howdy,\n${state.user.name}',
                        style: blackTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Where to fly today?',
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/image_profile.png',
                      width: 60,
                      height: 60,
                    ),
                  ),
                )
              ],
            );
          } else {
            return const SizedBox(
              child: Text('error ini'),
            );
          }
        },
      );
    }

    return BlocConsumer<DestinationCubit, DestinationState>(
      listener: (context, state) {
        if (state is DestinationFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kRedColor,
              content: Text(state.error),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is DestinationSuccess) {
          return ListView(
            padding: const EdgeInsets.only(bottom: 140),
            children: [
              const SizedBox(height: 30),
              header(),
              const SizedBox(height: 30),
              SizedBox(
                height: 323,
                child: ListView.builder(
                  itemCount: state.destination.length,
                  itemBuilder: (context, index) {
                    return DestinationCard(
                      price: state.destination[index].price,
                      imageUrl: state.destination[index].imageUrl,
                      title: state.destination[index].name,
                      location: state.destination[index].city,
                      rating: state.destination[index].rating.toString(),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'New This Year',
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Column(
                children: state.destination.map((DestinationModel destination) {
                  return DestinationTile(
                    destination: destination,
                  );
                }).toList(),
              ),
            ],
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
