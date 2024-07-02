// import 'package:e_commerce/widget/keranjangItem.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// class Keranjang extends StatefulWidget {
//   const Keranjang({super.key});

//   @override
//   State<Keranjang> createState() => _KeranjangState();
// }

// class _KeranjangState extends State<Keranjang> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Keranjang'),
//       ),
//       body: ListView(
//         children: [
//           KeranjangItem(),
//           // Container(
//           //   margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
//           //   padding: EdgeInsets.all(10),
//           //   child: Row(
//           //     children: [
//           //       Container(
//           //         decoration: BoxDecoration(
//           //           color: Color.fromARGB(255, 129, 141, 248),
//           //           borderRadius: BorderRadius.circular(20),
//           //         ),
//           //         child: Icon(
//           //           Icons.add,
//           //           color: Colors.white,
//           //         ),
//           //       ),
//           //       Padding(
//           //         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//           //         child: Text(
//           //           "Add Coupon Code",
//           //           style: TextStyle(
//           //             color: Color(0xFF312E81),
//           //           ),
//           //         ),
//           //       )
//           //     ],
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }

// main.dart
import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Shopee-like Static Cart',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: CartPage(),
//     );
//   }
// }

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems = [
    {
      'id': '1',
      'name': 'Product 1',
      'price': 29.99,
      'quantity': 2,
      'imageUrl': 'https://via.placeholder.com/150',
    },
    {
      'id': '2',
      'name': 'Product 2',
      'price': 49.99,
      'quantity': 1,
      'imageUrl': 'https://via.placeholder.com/150',
    },
  ];

  double get totalPrice {
    return cartItems.fold(
      0.0,
      (sum, item) => sum + (item['price'] * item['quantity']),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  'Total: \$${totalPrice.toStringAsFixed(2)}',
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
                      Text('Price: \$${item['price'].toStringAsFixed(2)}'),
                      Text('Quantity: ${item['quantity']}'),
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
