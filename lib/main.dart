import 'package:building_layouts/apps/form_app/form_home_screen.dart';
import 'package:building_layouts/apps/shoes_ecommerce/shoes_cart_screen.dart';
import 'package:building_layouts/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'apps/shoes_ecommerce/shoes_home_screen.dart';
import 'apps/shoes_ecommerce/shoes_intro.dart';
import 'apps/todo_app/features/dashboard/presentation/view/homescreen/todo_app_screen.dart';
import 'view/screens/travel_destination_screen.dart';

void main() async {
  // init the hive
  await Hive.initFlutter();

  // open a box
  var todoAppBox = await Hive.openBox('todoAppBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Cart(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Mini Apps',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
        routes: {
          '/home': (context) => const HomeScreen(),
          '/travel': (context) => const TravelDestinationScreen(),
          '/todo': (context) => const TodoAppScreen(),
          '/shoes_intro': (context) => const ShoesIntroScreen(),
          '/shoes_Home': (context) => const ShoesHomeScreen(),
          '/form_home': (context) => const FormHomeScreen(),
        },
      ),
    );
  }
}
