import 'package:e_commerce/categorylist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        title: "hp",filehp: '../assets/images/vivo.webp'
      )
  ];
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      body: ListView.builder(
        itemCount: handphone.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(handphone[index].filehp),
            title: Text(handphone[index].title),
            subtitle: Text('Deskripsi produk'),
            trailing: Text('Rp 1.000.000'),
            onTap: () {
              // Tambahkan logika untuk menavigasi ke detail produk
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Cari',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Keranjang',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        selectedItemColor: Colors.blue, // Sesuaikan dengan tema Anda
        currentIndex: 0, // Ubah sesuai halaman yang aktif
        onTap: (index) {
          // Tambahkan logika untuk menavigasi antar halaman
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





