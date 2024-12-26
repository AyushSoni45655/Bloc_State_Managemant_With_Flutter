import 'package:bloc_state_manangemant/favorite_app/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:bloc_state_manangemant/favorite_app/bloc/favorite_bloc/favorite_event.dart';
import 'package:bloc_state_manangemant/favorite_app/repo/favorite_repositry.dart';
import 'package:bloc_state_manangemant/favorite_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FavoriteBloc(FavoriteRepositry()),
          )
        ],
        child: MaterialApp(
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData(brightness: Brightness.dark),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        ));
  }
}

//git remote add origin https://github.com/AyushSoni45655/Bloc_State_Managemant_With_Flutter.git
