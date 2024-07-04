import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider_data.dart'; // Assuming CartProvider is imported from provider_data.dart

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Accessing cartItems from CartProvider using Provider.of
    List<Map<String, dynamic>> cartItems =
        Provider.of<CartProvider>(context).cartItems;

    // Building the UI
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartItemWidget(
                  item: cartItems[index],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: \$${calculateTotalPrice(cartItems).toStringAsFixed(2)}', // Calling the function to get total price
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle checkout
                  },
                  child: Text('Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to calculate total price
  double calculateTotalPrice(List<Map<String, dynamic>> cartItems) {
    return cartItems.fold(
      0.0,
      (sum, item) => sum + (item['price'] ?? 0.0) * (item['quantity'] ?? 0),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final Map<String, dynamic> item;

  const CartItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(
                  item['imageUrl'],
                  width: 50,
                  height: 50,
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name'],
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text('Price: Rp ${item['price'].toStringAsFixed(2)}'),
                      Text('Quantity: ${item['quantity']}'),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Provider.of<CartProvider>(context, listen: false)
                                  .updateItemQuantity(
                                      item['id'], item['quantity'] - 1);
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text('${item['quantity']}'),
                          IconButton(
                            onPressed: () {
                              Provider.of<CartProvider>(context, listen: false)
                                  .updateItemQuantity(
                                      item['id'], item['quantity'] + 1);
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
