import 'package:building_layouts/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'shoes_shop_screen.dart';

class ShoesCartScreen extends StatelessWidget {
  const ShoesCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // heading
                  const Text(
                    'My Cart',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: value.userCart.length,
                          itemBuilder: (context, index) {
                            // get individual shoe
                            Shoe individualShoe = value.getUserCart()[index];

                            // return the cart item
                            return CartItem(
                              shoe: individualShoe,
                            );
                          }))
                ],
              ),
            ));
  }
}

class CartItem extends StatefulWidget {
  final Shoe shoe;
  const CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // remove item from cart

  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePath),
        title: Text(widget.shoe.name),
        subtitle: Text(widget.shoe.price),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: removeItemFromCart,
        ),
      ),
    );
  }
}

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Zoom FREAK',
      price: '999.99',
      description: 'Freaky Sneaks!',
      imagePath: ShoesImages.shoesOrange,
    ),
    Shoe(
      name: 'Zoom CREAK ',
      price: '1199.99',
      description: 'Creaky Sneaks!',
      imagePath: ShoesImages.shoesRed,
    ),
    Shoe(
      name: 'Air Jordan',
      price: '1999.99',
      description: 'For the elites!',
      imagePath: ShoesImages.shoesGrey,
    ),
    Shoe(
      name: 'Air Classic',
      price: '1799.99',
      description: 'To conquer your everyday!',
      imagePath: ShoesImages.shoesSilver,
    ),
  ];
  // list of items in user cart
  List<Shoe> userCart = [];

  // get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
