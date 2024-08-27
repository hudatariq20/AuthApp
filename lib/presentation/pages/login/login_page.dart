// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auth_ui/core/utils/constants.dart';
import 'package:auth_ui/core/utils/validators/validation.dart';
import 'package:auth_ui/core/utils/validators/validator.dart';
import 'package:auth_ui/presentation/cubits/login/login_cubit.dart';
import 'package:auth_ui/presentation/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginformKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //this will be modified.
    return Form(
      key: loginformKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome to",
            style: TextStyle(fontSize: 16, color: Color(0xFF1C1C1C), height: 2),
          ),
          Text("HOMELAND",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C1C1C),
                  height: 1,
                  letterSpacing: 2)),
          Text("Please login to continue",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF1C1C1C),
                height: 1,
              )),
          SizedBox(
            height: 16,
          ),
          _EmailInput(),
          SizedBox(
            height: 16,
          ),
          _PasswordInput(),
          SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () {
              if (loginformKey.currentState?.validate() == true) {
                context.read<LoginCubit>().logInWithCredentials();

                try {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                } catch (_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Could not login')),
                  );
                }
              }
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Color(0xFF1C1C1C),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFF1C1C1C).withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 4,
                        offset: Offset(0, 3))
                  ]),
              child: Center(
                  child: Text(
                "LOGIN",
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFFECCB45),
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "FORGOT PASSWORD",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C1C1C)),
          )
        ],
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          validator: Validator.apply(context, [
            RequiredValidation(),
          ]),
          onChanged: (password) {
            context.read<LoginCubit>().passwordChanged(password);
          },
          decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD9BC43),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(width: 0, style: BorderStyle.none),
              ),
              filled: true,
              fillColor: Color(0xFFECCB45),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 0)),
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextFormField(
          validator: Validator.apply(
              context, [RequiredValidation(), EmailValidation()]),
          onChanged: (email) {
            context.read<LoginCubit>().emailChanged(email);
          },
          decoration: InputDecoration(
              hintText: "Email / Username",
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD9BC43),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(width: 0, style: BorderStyle.none),
              ),
              filled: true,
              fillColor: Color(0xFFECCB45),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 0)),
        );
      },
    );
  }
}
