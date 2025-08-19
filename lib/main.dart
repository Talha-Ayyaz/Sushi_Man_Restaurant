import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_man/models/shop.dart';
import 'package:sushi_man/pages/cart_page.dart';
import 'package:sushi_man/pages/intro_page.dart';
import 'package:sushi_man/pages/menu_page.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
          create: (context) => Shop(),
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const IntroPage(),
      routes: {
        '/intropage' : (context) => const IntroPage(),
        '/menupage' : (context) => const MenuPage(),
        '/cartpage' : (context) => const CartPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Demo'),
      ),
      body: Container(),
    );
  }
}
