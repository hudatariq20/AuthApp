// ignore_for_file: public_member_api_docs, sort_constructors_first, use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors

import 'package:auth_ui/core/utils/constants.dart';
import 'package:auth_ui/data/repositories/auth/auth_repository.dart';
import 'package:auth_ui/data/repositories/user/user_repository.dart';
import 'package:auth_ui/firebase_options.dart';
import 'package:auth_ui/presentation/blocs/auth/auth_bloc.dart';
import 'package:auth_ui/presentation/blocs/profile/profile_bloc.dart';
import 'package:auth_ui/presentation/cubits/login/login_cubit.dart';
import 'package:auth_ui/presentation/cubits/sign_up/sign_up_cubit.dart';
import 'package:auth_ui/presentation/pages/login/login_option.dart';
import 'package:auth_ui/presentation/pages/profile/profile_page.dart';
import 'package:auth_ui/presentation/pages/signup/signup_page.dart';
import 'package:auth_ui/presentation/pages/signup/signup_option.dart';
import 'package:auth_ui/presentation/pages/login/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => UserRepository()),
        RepositoryProvider(
            create: (context) =>
                AuthRepository(userRepository: context.read<UserRepository>()))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AuthBloc(
                  authRepository: context.read<AuthRepository>(),
                  userRepository: context.read<UserRepository>())),
          //
          BlocProvider(
            create: (context) =>
                LoginCubit(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                SignUpCubit(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider(
              create: ((context) => ProfileBloc(
                  authBloc: context.read<AuthBloc>(),
                  userRepository: context.read<UserRepository>())
                ..add(LoadProfile(context.read<AuthBloc>().state.authUser)))),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: GoogleFonts.muktaVaaniTextTheme()),
          home: HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool login = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1C),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Yellow container for LOGIN..
            GestureDetector(
              onTap: () {
                setState(() {
                  login = true;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
                height: login
                    ? MediaQuery.of(context).size.height * 0.6
                    : MediaQuery.of(context).size.height * 0.4,
                child: CustomPaint(
                    painter: CustomCurve(login),
                    child: Container(
                      //padding: EdgeInsets.only(bottom: login ? 0 : 55),
                      child: Center(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          child: login ? LoginPage() : LoginOption(),
                        ),
                      ),
                    )),
              ),
            ),

            //Dark Container for SIGN UP..
            GestureDetector(
              onTap: () {
                setState(() {
                  login = false;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
                height: login
                    ? MediaQuery.of(context).size.height * 0.4
                    : MediaQuery.of(context).size.height * 0.6,
                child: Container(
                  color: Colors.transparent,
                  child: Center(
                    child: SingleChildScrollView(
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      child: login ? SignUpOption() : SignUpPage(),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomCurve extends CustomPainter {
  bool login;
  CustomCurve(this.login);
  @override
  void paint(Canvas canvas, Size size) {
    print('paint');
    var paint = Paint();
    paint.color = Color(0xFFF3D657);
    paint.style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    //path.quadraticBezierTo(x1,y1,x2, y2);
    path.quadraticBezierTo(size.width * 0.5,
        login ? size.height + 110 : size.height - 100, size.width, size.height);
    path.lineTo(size.width, 0);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
//font color
//bloc provider logic..
//feel like m in a mess.

