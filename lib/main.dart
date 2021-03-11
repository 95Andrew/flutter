import 'package:flutter/material.dart';
import 'package:flutter_app/shared/theme_data_test.dart';
import 'package:flutter_app/ui/screens/home_screen/cubit/home_screen_cubit.dart';
import 'package:flutter_app/ui/screens/home_screen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'data/repository/unsplash_repository.dart';

void main() {
  runApp(initApp());
}

Widget initApp() {
  return BlocProvider(create: (context) => HomeScreenCubit(UnsplashRepository()), child: MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen(), theme: ThemeDataTest.themeData());
  }
}
