import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_man/components/button.dart';
import 'package:sushi_man/models/food.dart';
import 'package:sushi_man/theme/colors.dart';

import '../components/custom_foodTile.dart';
import '../models/shop.dart';
import 'food_details.dart';

class MenuPage extends StatefulWidget{

  const MenuPage({super.key});
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {



  void navigateToFoodDetails(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetails(
      food: foodMenu[index],
    )));
  }
  @override
  Widget build(BuildContext context) {

    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey.shade900,
        elevation: 0,
        leading: const Icon(Icons.menu),
        title: const Text('Sargodha'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cartpage'),
              icon: const Icon(Icons.shopping_cart)
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: PrimaryColor,
              borderRadius: BorderRadius.circular(28)
            ),
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            padding: EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Get 32% Promo',
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 20,
                      color: Colors.white
                    ),
                    ),
                    const SizedBox(height: 20),
                    MyButton(text: 'Redeem', onTap: () {}),
                  ],
                ),
                Image.asset('lib/images/salmon.png', height: 100)
              ],
            ),
          ),

          const SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search here...',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('Food Menu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
                fontSize: 18
              ),
            ),
          ),
          const SizedBox(height: 10),

          Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                  itemBuilder: (context, index) => FoodTile(
                    food: foodMenu[index],
                    onTap: () => navigateToFoodDetails(index),
                  ),
              )
          ),

          const SizedBox(height: 25),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('lib/images/salmon-eggs.png', height: 60),

                    const SizedBox(width: 25),

                    Column(
                      children: [
                        Text('Salmon Eggs',
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        Text('\$ 21.00', style: TextStyle(color: Colors.grey.shade700),)
                      ],
                    )
                  ],
                ),
                Icon(Icons.favorite_outline)
              ],
            ),
          )
        ],
      ),
    );
  }
}