import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Modules/Login/cubit/AppCubit.dart';
import 'package:untitled/Dio/DioHelper.dart';
import 'package:untitled/Modules/Login/LoginScreen.dart';
import 'package:untitled/Network/Remote/sharedPref.dart';
import 'package:untitled/constant/constants.dart';
import 'package:untitled/layouts/cubit/shopCubit.dart';
import 'package:untitled/layouts/shopScreen.dart';
import 'package:untitled/layouts/onboarding_screen.dart';
import 'package:untitled/styles/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await cachHelper.init();
  Widget widget;
  bool? onboard =  cachHelper.gatDa(key: "onBoard");
  token = cachHelper.gatDa(key: "token");
  //bool? isDark;
  //print(onboard);
  if(onboard!=null)
    {
      if(token!=null) widget= shopScreen();
      else widget = LoginScreen();
    }
  else{ widget = onboardingScreen();}
  //if(isDark!=null)
    runApp(MyApp(
      startWidget: widget,
    ));
}
class MyApp extends StatelessWidget {
  final Widget startWidget;
  //final bool isdark;
  MyApp({required this.startWidget,});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context)=> AppCubit()..getSettingsData()),
        BlocProvider(
        create: (BuildContext context)=>shopCubit()..getHomeData()..getCategoriesData()..getFavScreen()..getSettingsData()),
      ],
        child: MaterialApp(
          theme: light,
          //darkTheme: darkTheme,
          home: startWidget,
          debugShowCheckedModeBanner: false,
        ),
    );
  }
}
