import 'package:flutter/material.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Shopping Cart',
              style: Theme.of(context).textTheme.titleLarge),
        ),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(
                cartItem['imageUrl'].toString(),
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        "Delete producP ?",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: const Text(
                          "Are You sure want to remove product from Cart ?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .removeProduct(cartItem);
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Yes",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "No",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            title: Text(
              'Product: ${cartItem['title']}'.toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text(
              'Size: ${cartItem['size']}'.toString(),
            ),
          );
        },
      ),
    );
  }
}
