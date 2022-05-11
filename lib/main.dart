import 'package:cancerapy/Bloc_Cubit/Medical_Bloc.dart';
import 'package:cancerapy/Screens/Signup_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Bloc_Cubit/BlocObserver.dart';
import 'Bloc_Cubit/Login_Bloc.dart';
import 'Screens/Home_Screen.dart';
import 'Screens/Login_Screen.dart';
import 'Screens/Result_Screen.dart';
import 'Screens/Uploading_Image.dart';
import 'Screens/onBoarding_Screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ScreenUtil.ensureScreenSize();
  BlocOverrides.runZoned(
        () {
       runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) {
          return LoginCubit();
        }),
        BlocProvider(create: (ctx){
          return MedicalCubit();
        })
      ],
      child: ScreenUtilInit(
        designSize: const Size(2240, 1080),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          title: 'Cancerapy',
          theme: ThemeData(
            colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.blue ),
            primarySwatch: Colors.blue,
            backgroundColor: Colors.white,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                )),
            textTheme: TextTheme(
                headline1: GoogleFonts.ptSans(
                    fontSize: 26, color: Colors.blue, fontWeight: FontWeight.bold),
                headline3: GoogleFonts.ptSans(
                    fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
                headline5: GoogleFonts.ubuntu(
                    fontSize: 27, color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.bold),
                headline4: GoogleFonts.ptSans(
                    fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
                headline2:
                    GoogleFonts.ptSans(fontSize: 16, color: Colors.grey.shade600)),
          ),
          debugShowCheckedModeBanner: false,
          home:  const OnBoardingScreen(),
          routes: {
            LoginScreen.routeName: (ctx) {
              return LoginScreen();
            },
            SignUp.routeName : (ctx){
              return const SignUp();
            },
            HomeScreen.routeName : (ctx){
              return const HomeScreen();
            },
            UploadingImage.routeName : (ctx){
              return UploadingImage();
            },
            ResultScreen.routeName : (ctx){
              return const ResultScreen();
            }
          },
        ),
      ),
    );
  }
}

