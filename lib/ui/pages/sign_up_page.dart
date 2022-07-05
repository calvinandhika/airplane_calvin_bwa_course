import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_apps/cubit/auth_cubit.dart';
import 'package:travel_apps/shared/theme.dart';
import 'package:travel_apps/ui/widgets/custom_button.dart';
import 'package:travel_apps/ui/widgets/custom_text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController hobbyController = TextEditingController(text: '');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    hobbyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Text(
        'Join us and get\nyour next journey',
        style: blackTextStyle.copyWith(
          fontSize: 24,
          fontWeight: semiBold,
        ),
      );
    }

    Widget nameInput() {
      return CustomTextFormField(
        title: 'Full Name',
        hintText: 'Your Full Name',
        controller: nameController,
      );
    }

    Widget emailInput() {
      return CustomTextFormField(
        title: 'Email Name',
        hintText: 'Your Email Address',
        controller: emailController,
      );
    }

    Widget passwordInput() {
      return CustomTextFormField(
        title: 'Password',
        hintText: 'Your Password',
        controller: passwordController,
        obscureText: true,
      );
    }

    Widget hobbyInput() {
      return CustomTextFormField(
        title: 'Hobby',
        hintText: 'Your Hobby',
        controller: hobbyController,
      );
    }

    Widget submitButton() {
      return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/bonus', (route) => false);
        } else if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kRedColor,
              content: Text(state.error),
            ),
          );
        }
      }, builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return CustomButton(
            buttonText: 'Get Started',
            onPressedFunction: () {
              context.read<AuthCubit>().signUp(
                  email: emailController.text,
                  password: passwordController.text,
                  name: nameController.text,
                  hobby: hobbyController.text);
            });
      });
    }

    Widget signInButton() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 50),
        child: TextButton(
          child: Text(
            'Have an account? Sign In!',
            textAlign: TextAlign.center,
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/sign-in');
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          color: kBackgroundColor,
          margin: const EdgeInsets.only(
              left: defaultMargin, right: defaultMargin, top: 30),
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              title(),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 30),
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      nameInput(),
                      const SizedBox(height: 20),
                      emailInput(),
                      const SizedBox(height: 20),
                      passwordInput(),
                      const SizedBox(height: 20),
                      hobbyInput(),
                      const SizedBox(height: 30),
                      submitButton(),
                      signInButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
