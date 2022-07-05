import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_apps/cubit/auth_cubit.dart';
import 'package:travel_apps/cubit/destination_cubit.dart';
import 'package:travel_apps/cubit/page_cubit.dart';
import 'package:travel_apps/cubit/seat_cubit.dart';
import 'package:travel_apps/cubit/transaction_cubit.dart';
import 'package:travel_apps/firebase_options.dart';
import 'package:travel_apps/ui/pages/bonus_page.dart';
import 'package:travel_apps/ui/pages/choose_seat_page.dart';
import 'package:travel_apps/ui/pages/detail_page.dart';
import 'package:travel_apps/ui/pages/get_started_page.dart';
import 'package:travel_apps/ui/pages/main_page.dart';
import 'package:travel_apps/ui/pages/sign_in_page.dart';
import 'package:travel_apps/ui/pages/sign_up_page.dart';
import 'package:travel_apps/ui/pages/splash_page.dart';
import 'package:travel_apps/ui/pages/success_checkout_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TravelApps());
}

class TravelApps extends StatelessWidget {
  const TravelApps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/get-started': (context) => const GetStartedPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/sign-in': (context) => const SignInPage(),
          '/bonus': (context) => const BonusPage(),
          '/main': (context) => const MainPage(),
          '/detail-page': (context) => const DetailPage(),
          '/choose-seat': (context) => const ChooseSeatPage(),
          '/success-checkout': (context) => const SuccessCheckoutPage(),
        },
      ),
    );
  }
}
