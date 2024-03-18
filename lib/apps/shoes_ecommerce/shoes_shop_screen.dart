import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'shoes_cart_screen.dart';

class ShoesShopScreen extends StatefulWidget {
  const ShoesShopScreen({super.key});

  @override
  State<ShoesShopScreen> createState() => _ShoesShopScreenState();
}

class _ShoesShopScreenState extends State<ShoesShopScreen> {
  // add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
    // alert the user, shoe successfully added
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Successfully Added'),
              content: Text('Check your cart'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => SingleChildScrollView(
              child: Column(
                children: [
                  // search bar
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Search'),
                        Icon(Icons.search),
                      ],
                    ),
                  ),

                  // message
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Everyone flies.. some fly longer than others',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),

                  //hot picks
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Hot Picks 🔥',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          'See all',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        // Create a shoe
                        Shoe shoe = value.getShoeList()[index];
                        return ShoeTile(
                          shoe: shoe,
                          onTap: () => addShoeToCart(shoe),
                        );
                      }),

                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 25, right: 25),
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),

                  Container(
                    color: Colors.red,
                    height: 200,
                    width: 200,
                  ),
                  Container(
                    color: Colors.red,
                    height: 200,
                    width: 200,
                  ),
                  Text('overflow'),
                  Container(
                    color: Colors.red,
                    height: 200,
                    width: 200,
                  ),
                  Container(
                    color: Colors.red,
                    height: 200,
                    width: 200,
                  ),
                  Text('overflow'),
                ],
              ),
            ));
  }
}

class ShoeTile extends StatelessWidget {
  final void Function()? onTap;
  final Shoe shoe;
  const ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 40),
      width: 250,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Shoe pic
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(shoe.imagePath),
          ),

          // description
          Text(
            shoe.description,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          // price + details
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Shoe Name
                    Text(
                      shoe.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),

                    const SizedBox(
                      height: 5,
                    ),

                    // Price
                    Text(
                      ' \$ ${shoe.price}',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                // Plus Button
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          )),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ),

          // add to cart button
        ],
      ),
    );
  }
}

class Shoe {
  final String name;
  final String price;
  final String imagePath;
  final String description;

  Shoe(
      {required this.name,
      required this.price,
      required this.imagePath,
      required this.description});
}
