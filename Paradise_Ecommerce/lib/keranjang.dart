import 'package:e_commerce/checkout.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
                  'Total: Rp ${formatCurrency(Provider.of<CartProvider>(context).calculateTotalPrice(cartItems))}', // Calling the function to get total price
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman Checkout dan kirim data cartItems
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Checkout(cartItems: cartItems),
                    ));
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


}


class CartItemWidget extends StatelessWidget {
  final Map<String, dynamic> item;

  const CartItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    Text('Price: Rp ${formatCurrency(item['price'] ?? 0.0)}'),
                    Text('Stok :${item['quantity'] ?? 0}'),
                    Text('Variant :${item['variant'] ?? ""}'),

                    SizedBox(height: 8),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .kurangItemCart(
                                    item['id']);
                          },
                          icon: Icon(Icons.remove),
                        ),
                        Text('${item['quantity']}'),
                        IconButton(
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .tambahItemCart(
                                    item['id']);
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
    );
  }
}


  String formatCurrency(double amount) {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0);
    return formatter.format(amount);
  }
