import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_man/components/button.dart';
import 'package:sushi_man/models/shop.dart';
import 'package:sushi_man/theme/colors.dart';

import '../models/food.dart';

class CartPage extends StatelessWidget{

  void removeFromCart(Food food, BuildContext context) {
    final shop = context.read<Shop>();

    shop.removeFromCart(food);
  }

  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
        builder: (context, value, child) => Scaffold(

          appBar: AppBar(
            title: Text('My Cart'),
            centerTitle: true,
            backgroundColor: PrimaryColor,
            elevation: 0,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: value.cart.length,
                    itemBuilder: (context, index) {

                      final Food food = value.cart[index];
                      final String foodName = food.name;
                      final String foodPrice = food.price;

                      return Container(
                        decoration: BoxDecoration(
                          color: SecondaryColor,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                        child: ListTile(
                          title: Text(foodName,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            )
                          ),
                          subtitle: Text(foodPrice,
                              style: TextStyle(
                                  color: Colors.grey.shade200,
                              )
                          ),
                          trailing: IconButton(
                              onPressed:() => removeFromCart(food, context),
                              icon: Icon(Icons.delete, color: Colors.grey.shade300)
                          ),
                        ),
                      );
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: MyButton(
                    text: 'Pay Now',
                    onTap: () {}
                ),
              )
            ],
          ),
        )
    );
  }

}