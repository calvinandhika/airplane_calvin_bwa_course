import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_apps/cubit/auth_cubit.dart';
import 'package:travel_apps/shared/theme.dart';
import 'package:travel_apps/ui/widgets/custom_button.dart';
import 'package:travel_apps/ui/widgets/custom_text_form_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Text(
        'Sign In With Your\nExisting Account',
        style: blackTextStyle.copyWith(
          fontSize: 24,
          fontWeight: semiBold,
        ),
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

    Widget submitButton() {
      return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/main', (route) => false);
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
            buttonText: 'Sign In',
            onPressedFunction: () {
              context.read<AuthCubit>().signIn(
                    email: emailController.text,
                    password: passwordController.text,
                  );
            });
      });
    }

    Widget backToRegisterButton() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 50),
        child: TextButton(
          child: Text(
            'Don\' have an account? Sign Up!',
            textAlign: TextAlign.center,
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/sign-up', (route) => false);
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
                      emailInput(),
                      const SizedBox(height: 20),
                      passwordInput(),
                      const SizedBox(height: 30),
                      submitButton(),
                      backToRegisterButton(),
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
