import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_man/components/button.dart';
import 'package:sushi_man/models/shop.dart';
import 'package:sushi_man/theme/colors.dart';

import '../models/food.dart';

class FoodDetails extends StatefulWidget{
  final Food food;

  const FoodDetails({
    super.key,
    required this.food
});
  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {

  int count = 0;
  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      if(count > 0) {
        count--;
      }
    });
  }

  void addToCart() {
    if(count > 0) {
      final shop = context.read<Shop>();
      
      shop.addToCart(widget.food, count);

      showDialog(
        barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: PrimaryColor,
            content: const Text('Successfully added to cart',
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.done, color: Colors.white)
              )
            ],
          )
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey.shade900,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
                children: [
                  Image.asset(widget.food.imagePath, height: 200),
                  
                  const SizedBox(height: 25),
                  
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow.shade800),
                      Text(widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),

                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  const SizedBox(height: 25),

                  Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                  const SizedBox(height: 10),
                  
                  Text('Each dish is prepared with the finest ingredients, combining authenticity, freshness, and artistry. Our chefs bring together traditional techniques and refined flavors to create a culinary experience that delights the senses. Every bite reflects our commitment to quality and excellence.',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      height: 2
                    ),
                  )
                ],
              )
          ),
          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: PrimaryColor
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$' + widget.food.price,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),

                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: SecondaryColor,
                            shape: BoxShape.circle
                          ),
                          child: IconButton(
                              onPressed: decrement,
                              icon: Icon(Icons.remove, color: Colors.white,)
                          ),
                        ),

                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(count.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                              ),
                            ),
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                              color: SecondaryColor,
                              shape: BoxShape.circle
                          ),
                          child: IconButton(
                              onPressed: increment,
                              icon: Icon(Icons.add, color: Colors.white,)
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 25),
                MyButton(
                    text: 'Add To Cart',
                    onTap: addToCart
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}