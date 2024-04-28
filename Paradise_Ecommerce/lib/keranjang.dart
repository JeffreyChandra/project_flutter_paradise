import 'package:e_commerce/widget/keranjangItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Keranjang extends StatefulWidget {
  const Keranjang({super.key});

  @override
  State<Keranjang> createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
      ),
      body: ListView(
        children: [
          KeranjangItem(),
          // Container(
          //   margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          //   padding: EdgeInsets.all(10),
          //   child: Row(
          //     children: [
          //       Container(
          //         decoration: BoxDecoration(
          //           color: Color.fromARGB(255, 129, 141, 248),
          //           borderRadius: BorderRadius.circular(20),
          //         ),
          //         child: Icon(
          //           Icons.add,
          //           color: Colors.white,
          //         ),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //         child: Text(
          //           "Add Coupon Code",
          //           style: TextStyle(
          //             color: Color(0xFF312E81),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
