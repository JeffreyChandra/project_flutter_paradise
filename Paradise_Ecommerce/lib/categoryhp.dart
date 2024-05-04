import 'package:e_commerce/categorylist.dart';
import 'package:e_commerce/provider_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class handphone extends StatefulWidget {
    final Category category; // Terima parameter category
  const handphone({Key? key, required this.category}) : super(key: key);

  @override
  State<handphone> createState() => _handphoneState();
}
class Handphone{
  String title;
  String filehp;

  Handphone({
    this.title=' ',
    this.filehp=' ',
  });
}
class _handphoneState extends State<handphone>{

  List<Handphone>handphone=[
      Handphone(
        title: "hp",filehp: '../assets/images/category/vivo.jpg'
      )
  ];
  

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final product = productProvider.products;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      body: ListView.builder(
        // itemCount: handphone.length,
        itemBuilder: (context, index) {
          return ListTile(
            // leading: Image.asset(handphone[index].filehp),
            // title: Text(handphone[index].title),
            subtitle: Text('Handphone'),
            trailing: Text('Rp 1.000.000'),
            onTap: () {
              
            },
          );
        },
      ),
    );
  }
  }
  class Pria extends StatefulWidget {
    final Category category;
  const Pria({Key? key, required this.category}) : super(key: key);

  

  @override
  State<Pria> createState() => _PriaState();
}

class pria{
  String title;
  String filepria;

  pria({
    this.title=' ',
    this.filepria=' ',
  });
}
class _PriaState extends State<Pria>{

  List<pria>handphone=[
      pria(
        title: "Pria",filepria: '../assets/images/pria.jpg'
      )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}


