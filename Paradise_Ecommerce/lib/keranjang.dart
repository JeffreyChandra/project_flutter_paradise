import 'package:e_commerce/widget/keranjangItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        ],
      ),
    );
  }
}
