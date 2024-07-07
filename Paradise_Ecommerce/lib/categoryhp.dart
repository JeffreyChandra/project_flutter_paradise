import 'package:e_commerce/widget/itemWidget.dart';
import 'package:e_commerce/categorylist.dart';
import 'package:e_commerce/provider_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class handphone extends StatefulWidget {
  final Category category;

  const handphone({Key? key, required this.category}) : super(key: key);

  @override
  State<handphone> createState() => _handphoneState();
}

class Handphone {
  String title;
  String filehp;
  int price;

  Handphone({this.title = ' ', this.filehp = ' ', required this.price});
}

class _handphoneState extends State<handphone> {
  List<Handphone> handphones = [
    Handphone(title: "hp", filehp: '../assets/images/vivo.webp', price: 79000),
    Handphone(title: "hp", filehp: '../assets/images/vivo.webp', price: 79000),
    Handphone(title: "hp", filehp: '../assets/images/vivo.webp', price: 79000),
    Handphone(title: "hp", filehp: '../assets/images/vivo.webp', price: 79000),
    Handphone(title: "hp", filehp: '../assets/images/vivo.webp', price: 79000)
  ];

  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    List<Handphone> filteredHandphones =
        handphones.where((hp) => hp.price <= _currentSliderValue).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Filter by Price',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Max Price: Rp ${_currentSliderValue.round()}'),
                Expanded(
                  child: Slider(
                    value: _currentSliderValue,
                    min: 0,
                    max: 100000,
                    divisions: 10,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Best Sales',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filteredHandphones.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(filteredHandphones[index].filehp,
                          height: 100),
                      SizedBox(height: 8),
                      Text(filteredHandphones[index].title),
                      Text("Rp ${filteredHandphones[index].price}"),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Rekomendasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredHandphones.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListTile(
                    leading: Image.asset(filteredHandphones[index].filehp),
                    title: Text(filteredHandphones[index].title),
                    subtitle: Text('Deskripsi produk'),
                    trailing: Text("Rp ${filteredHandphones[index].price}"),
                    onTap: () {
                      // Tambahkan logika untuk menavigasi ke detail produk
                    },
                  ),
                );
              },
            ),
          ),
        ],
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

class PriaProduct {
  String title;
  String filepria;
  int price;

  PriaProduct({this.title = ' ', this.filepria = ' ', required this.price});
}

class _PriaState extends State<Pria> {
  List<PriaProduct> priaProducts = [
    PriaProduct(
        title: "Pria", filepria: '../assets/images/pria.jpg', price: 1000000),
    PriaProduct(
        title: "Pria", filepria: '../assets/images/pria.jpg', price: 1000000),
    PriaProduct(
        title: "Pria", filepria: '../assets/images/pria.jpg', price: 1000000),
    PriaProduct(
        title: "Pria", filepria: '../assets/images/pria.jpg', price: 1000000),
    PriaProduct(
        title: "Pria", filepria: '../assets/images/pria.jpg', price: 1000000)
  ];

  double _currentSliderValue = 1000000;

  @override
  Widget build(BuildContext context) {
    List<PriaProduct> filteredPriaProducts =
        priaProducts.where((pp) => pp.price <= _currentSliderValue).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Filter by Price',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Max Price: Rp ${_currentSliderValue.round()}'),
                Expanded(
                  child: Slider(
                    value: _currentSliderValue,
                    min: 0,
                    max: 1000000,
                    divisions: 10,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Best Sales',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filteredPriaProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(filteredPriaProducts[index].filepria,
                          height: 100),
                      SizedBox(height: 8),
                      Text(filteredPriaProducts[index].title),
                      Text("Rp ${filteredPriaProducts[index].price}"),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Rekomendasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredPriaProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListTile(
                    leading: Image.asset(filteredPriaProducts[index].filepria),
                    title: Text(filteredPriaProducts[index].title),
                    subtitle: Text('Deskripsi produk'),
                    trailing: Text("Rp ${filteredPriaProducts[index].price}"),
                    onTap: () {
                      // Tambahkan logika untuk menavigasi ke detail produk
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Wanita extends StatefulWidget {
  final Category category;

  const Wanita({Key? key, required this.category}) : super(key: key);

  @override
  State<Wanita> createState() => _WanitaState();
}

class wanitaProduct {
  String title;
  String filewanita;
  int price;

  wanitaProduct({this.title = ' ', this.filewanita = ' ', required this.price});
}

class _WanitaState extends State<Wanita> {
  List<wanitaProduct> wanitaProducts = [
    wanitaProduct(
        title: "Wanita",
        filewanita: '../assets/images/wanita.jpg',
        price: 800000),
    wanitaProduct(
        title: "Wanita",
        filewanita: '../assets/images/wanita.jpg',
        price: 900000),
    wanitaProduct(
        title: "Wanita",
        filewanita: '../assets/images/wanita.jpg',
        price: 1000000),
    wanitaProduct(
        title: "Wanita",
        filewanita: '../assets/images/wanita.jpg',
        price: 1100000),
    wanitaProduct(
        title: "Wanita",
        filewanita: '../assets/images/wanita.jpg',
        price: 1200000),
  ];

  double _currentSliderValue = 1200000;

  @override
  Widget build(BuildContext context) {
    List<wanitaProduct> filteredWanitaProducts =
        wanitaProducts.where((wp) => wp.price <= _currentSliderValue).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Filter by Price',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Max Price: Rp ${_currentSliderValue.round()}'),
                Expanded(
                  child: Slider(
                    value: _currentSliderValue,
                    min: 0,
                    max: 1200000,
                    divisions: 12,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Best Sales',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filteredWanitaProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(filteredWanitaProducts[index].filewanita,
                          height: 100),
                      SizedBox(height: 8),
                      Text(filteredWanitaProducts[index].title),
                      Text("Rp ${filteredWanitaProducts[index].price}"),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Rekomendasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredWanitaProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListTile(
                    leading:
                        Image.asset(filteredWanitaProducts[index].filewanita),
                    title: Text(filteredWanitaProducts[index].title),
                    subtitle: Text('Deskripsi produk'),
                    trailing: Text("Rp ${filteredWanitaProducts[index].price}"),
                    onTap: () {
                      // Tambahkan logika untuk menavigasi ke detail produk
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Laptop extends StatefulWidget {
  final Category category;

  const Laptop({Key? key, required this.category}) : super(key: key);

  @override
  State<Laptop> createState() => _LaptopState();
}

class laptopProduct {
  String title;
  String filelaptop;
  int price;

  laptopProduct({this.title = ' ', this.filelaptop = ' ', required this.price});
}

class _LaptopState extends State<Laptop> {
  List<laptopProduct> laptopProducts = [
    laptopProduct(
        title: "Laptop A",
        filelaptop: '../assets/images/laptop.jpg',
        price: 3000000),
    laptopProduct(
        title: "Laptop B",
        filelaptop: '../assets/images/laptop.jpg',
        price: 4000000),
    laptopProduct(
        title: "Laptop C",
        filelaptop: '../assets/images/laptop.jpg',
        price: 5000000),
    laptopProduct(
        title: "Laptop D",
        filelaptop: '../assets/images/laptop.jpg',
        price: 6000000),
    laptopProduct(
        title: "Laptop E",
        filelaptop: '../assets/images/laptop.jpg',
        price: 7000000),
  ];

  double _currentSliderValue = 7000000;

  @override
  Widget build(BuildContext context) {
    List<laptopProduct> filteredLaptopProducts =
        laptopProducts.where((lp) => lp.price <= _currentSliderValue).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Filter by Price',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Max Price: Rp ${_currentSliderValue.round()}'),
                Expanded(
                  child: Slider(
                    value: _currentSliderValue,
                    min: 0,
                    max: 10000000,
                    divisions: 10,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Best Sales',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filteredLaptopProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(filteredLaptopProducts[index].filelaptop,
                          height: 100),
                      SizedBox(height: 8),
                      Text(filteredLaptopProducts[index].title),
                      Text("Rp ${filteredLaptopProducts[index].price}"),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Rekomendasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredLaptopProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListTile(
                    leading:
                        Image.asset(filteredLaptopProducts[index].filelaptop),
                    title: Text(filteredLaptopProducts[index].title),
                    subtitle: Text('Deskripsi produk'),
                    trailing: Text("Rp ${filteredLaptopProducts[index].price}"),
                    onTap: () {
                      // Tambahkan logika untuk menavigasi ke detail produk
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class komputer extends StatefulWidget {
  final Category category;

  const komputer({Key? key, required this.category}) : super(key: key);

  @override
  State<komputer> createState() => _KomputerState();
}

class komputerProduct {
  String title;
  String filekomputer;
  int price;

  komputerProduct(
      {this.title = ' ', this.filekomputer = ' ', required this.price});
}

class _KomputerState extends State<komputer> {
  List<komputerProduct> komputerProducts = [
    komputerProduct(
        title: "Komputer A",
        filekomputer: '../assets/images/komputer.jpg',
        price: 10000000),
    komputerProduct(
        title: "Komputer B",
        filekomputer: '../assets/images/komputer.jpg',
        price: 20000000),
    komputerProduct(
        title: "Komputer C",
        filekomputer: '../assets/images/komputer.jpg',
        price: 30000000),
    komputerProduct(
        title: "Komputer D",
        filekomputer: '../assets/images/komputer.jpg',
        price: 40000000),
    komputerProduct(
        title: "Komputer E",
        filekomputer: '../assets/images/komputer.jpg',
        price: 50000000),
  ];

  double _currentSliderValue = 50000000;

  @override
  Widget build(BuildContext context) {
    List<komputerProduct> filteredKomputerProducts = komputerProducts
        .where((kp) => kp.price <= _currentSliderValue)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Filter by Price',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Max Price: Rp ${_currentSliderValue.round()}'),
                Expanded(
                  child: Slider(
                    value: _currentSliderValue,
                    min: 0,
                    max: 100000000,
                    divisions: 10,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Best Sales',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filteredKomputerProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(filteredKomputerProducts[index].filekomputer,
                          height: 100),
                      SizedBox(height: 8),
                      Text(filteredKomputerProducts[index].title),
                      Text("Rp ${filteredKomputerProducts[index].price}"),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Rekomendasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredKomputerProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListTile(
                    leading: Image.asset(
                        filteredKomputerProducts[index].filekomputer),
                    title: Text(filteredKomputerProducts[index].title),
                    subtitle: Text('Deskripsi produk'),
                    trailing:
                        Text("Rp ${filteredKomputerProducts[index].price}"),
                    onTap: () {
                      // Tambahkan logika untuk menavigasi ke detail produk
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AnakAnak extends StatefulWidget {
  final Category category;

  const AnakAnak({Key? key, required this.category}) : super(key: key);

  @override
  State<AnakAnak> createState() => _AnakState();
}

class AnakAnakProduct {
  String title;
  String fileAnakAnak;
  int price;

  AnakAnakProduct(
      {this.title = ' ', this.fileAnakAnak = ' ', required this.price});
}

class _AnakState extends State<AnakAnak> {
  List<AnakAnakProduct> anakProducts = [
    AnakAnakProduct(
        title: "Mainan A",
        fileAnakAnak: '../assets/images/mainan.webp',
        price: 50000),
    AnakAnakProduct(
        title: "Mainan B",
        fileAnakAnak: '../assets/images/mainan.webp',
        price: 75000),
    AnakAnakProduct(
        title: "Mainan C",
        fileAnakAnak: '../assets/images/mainan.webp',
        price: 100000),
    AnakAnakProduct(
        title: "Mainan D",
        fileAnakAnak: '../assets/images/mainan.webp',
        price: 150000),
    AnakAnakProduct(
        title: "Mainan E",
        fileAnakAnak: '../assets/images/mainan.webp',
        price: 200000),
  ];

  double _currentSliderValue = 200000;

  @override
  Widget build(BuildContext context) {
    List<AnakAnakProduct> filteredAnakProducts =
        anakProducts.where((ap) => ap.price <= _currentSliderValue).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Filter by Price',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Max Price: Rp ${_currentSliderValue.round()}'),
                Expanded(
                  child: Slider(
                    value: _currentSliderValue,
                    min: 0,
                    max: 200000,
                    divisions: 10,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Best Sales',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filteredAnakProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(filteredAnakProducts[index].fileAnakAnak,
                          height: 100),
                      SizedBox(height: 8),
                      Text(filteredAnakProducts[index].title),
                      Text("Rp ${filteredAnakProducts[index].price}"),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Rekomendasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredAnakProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListTile(
                    leading:
                        Image.asset(filteredAnakProducts[index].fileAnakAnak),
                    title: Text(filteredAnakProducts[index].title),
                    subtitle: Text('Deskripsi produk'),
                    trailing: Text("Rp ${filteredAnakProducts[index].price}"),
                    onTap: () {
                      // Tambahkan logika untuk menavigasi ke detail produk
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Game extends StatefulWidget {
  final Category category;

  const Game({Key? key, required this.category}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class GameProduct {
  String title;
  String fileGame;
  int price;

  GameProduct({this.title = ' ', this.fileGame = ' ', required this.price});
}

class _GameState extends State<Game> {
  List<GameProduct> gameProducts = [
    GameProduct(
        title: "Game A", fileGame: '../assets/images/game.webp', price: 500000),
    GameProduct(
        title: "Game B", fileGame: '../assets/images/game.webp', price: 600000),
    GameProduct(
        title: "Game C", fileGame: '../assets/images/game.webp', price: 700000),
    GameProduct(
        title: "Game D", fileGame: '../assets/images/game.webp', price: 800000),
    GameProduct(
        title: "Game E", fileGame: '../assets/images/game.webp', price: 900000),
    GameProduct(
        title: "Game F",
        fileGame: '../assets/images/game.webp',
        price: 1000000),
  ];

  double _currentSliderValue = 1000000;

  @override
  Widget build(BuildContext context) {
    List<GameProduct> filteredGameProducts =
        gameProducts.where((gp) => gp.price <= _currentSliderValue).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Filter by Price',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Max Price: Rp ${_currentSliderValue.round()}'),
                Expanded(
                  child: Slider(
                    value: _currentSliderValue,
                    min: 0,
                    max: 2000000,
                    divisions: 20,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Best Sales',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filteredGameProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(filteredGameProducts[index].fileGame,
                          height: 100),
                      SizedBox(height: 8),
                      Text(filteredGameProducts[index].title),
                      Text("Rp ${filteredGameProducts[index].price}"),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Rekomendasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredGameProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListTile(
                    leading: Image.asset(filteredGameProducts[index].fileGame),
                    title: Text(filteredGameProducts[index].title),
                    subtitle: Text('Deskripsi produk'),
                    trailing: Text("Rp ${filteredGameProducts[index].price}"),
                    onTap: () {
                      // Tambahkan logika untuk menavigasi ke detail produk
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Motor extends StatefulWidget {
  final Category category;

  const Motor({Key? key, required this.category}) : super(key: key);

  @override
  State<Motor> createState() => _MotorState();
}

class MotorProduct {
  String title;
  String fileMotor;
  int price;

  MotorProduct({this.title = ' ', this.fileMotor = ' ', required this.price});
}

class _MotorState extends State<Motor> {
  List<MotorProduct> motorProducts = [
    MotorProduct(
        title: "Motor A",
        fileMotor: '../assets/images/motor.png',
        price: 20000000),
    MotorProduct(
        title: "Motor B",
        fileMotor: '../assets/images/motor.png',
        price: 25000000),
    MotorProduct(
        title: "Motor C",
        fileMotor: '../assets/images/motor.png',
        price: 30000000),
    MotorProduct(
        title: "Motor D",
        fileMotor: '../assets/images/motor.png',
        price: 35000000),
    MotorProduct(
        title: "Motor E",
        fileMotor: '../assets/images/motor.png',
        price: 40000000),
    MotorProduct(
        title: "Motor F",
        fileMotor: '../assets/images/motor.png',
        price: 45000000),
  ];

  double _currentSliderValue = 50000000;

  @override
  Widget build(BuildContext context) {
    List<MotorProduct> filteredMotorProducts =
        motorProducts.where((mp) => mp.price <= _currentSliderValue).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Filter by Price',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Max Price: Rp ${_currentSliderValue.round()}'),
                Expanded(
                  child: Slider(
                    value: _currentSliderValue,
                    min: 0,
                    max: 60000000,
                    divisions: 12,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Best Sales',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filteredMotorProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(filteredMotorProducts[index].fileMotor,
                          height: 100),
                      SizedBox(height: 8),
                      Text(filteredMotorProducts[index].title),
                      Text("Rp ${filteredMotorProducts[index].price}"),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Rekomendasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredMotorProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListTile(
                    leading:
                        Image.asset(filteredMotorProducts[index].fileMotor),
                    title: Text(filteredMotorProducts[index].title),
                    subtitle: Text('Deskripsi produk'),
                    trailing: Text("Rp ${filteredMotorProducts[index].price}"),
                    onTap: () {
                      // Tambahkan logika untuk menavigasi ke detail produk
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Aksesoris extends StatefulWidget {
  final Category category;

  const Aksesoris({Key? key, required this.category}) : super(key: key);

  @override
  State<Aksesoris> createState() => _AksesorisState();
}

class AksesorisProduct {
  String title;
  String fileAksesoris;
  int price;

  AksesorisProduct(
      {this.title = ' ', this.fileAksesoris = ' ', required this.price});
}

class _AksesorisState extends State<Aksesoris> {
  List<AksesorisProduct> aksesorisProducts = [
    AksesorisProduct(
        title: "Aksesoris",
        fileAksesoris: '../assets/images/aksesoris.jpeg',
        price: 100000),
    AksesorisProduct(
        title: "Aksesoris",
        fileAksesoris: '../assets/images/aksesoris.jpeg',
        price: 100000),
    AksesorisProduct(
        title: "Aksesoris",
        fileAksesoris: '../assets/images/aksesoris.jpeg',
        price: 100000),
    AksesorisProduct(
        title: "Aksesoris",
        fileAksesoris: '../assets/images/aksesoris.jpeg',
        price: 100000),
    AksesorisProduct(
        title: "Aksesoris",
        fileAksesoris: '../assets/images/aksesoris.jpeg',
        price: 100000),
    AksesorisProduct(
        title: "Aksesoris",
        fileAksesoris: '../assets/images/aksesoris.jpeg',
        price: 100000)
  ];

  double _currentSliderValue = 100000;

  @override
  Widget build(BuildContext context) {
    List<AksesorisProduct> filteredAksesorisProducts = aksesorisProducts
        .where((ap) => ap.price <= _currentSliderValue)
        .toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.category.name),
        ),
        backgroundColor: Colors.grey[300],
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Filter by Price',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Max Price: Rp ${_currentSliderValue.round()}'),
                Expanded(
                  child: Slider(
                    value: _currentSliderValue,
                    min: 0,
                    max: 200000,
                    divisions: 10,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Best Sales',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filteredAksesorisProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                          filteredAksesorisProducts[index].fileAksesoris,
                          height: 100),
                      SizedBox(height: 8),
                      Text(filteredAksesorisProducts[index].title),
                      Text("Rp ${filteredAksesorisProducts[index].price}"),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Rekomendasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: filteredAksesorisProducts.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListTile(
                  leading: Image.asset(
                      filteredAksesorisProducts[index].fileAksesoris),
                  title: Text(filteredAksesorisProducts[index].title),
                  subtitle: Text('Deskripsi produk'),
                  trailing:
                      Text("Rp ${filteredAksesorisProducts[index].price}"),
                  onTap: () {
                    // Tambahkan logika untuk menavigasi ke detail produk
                  },
                ),
              );
            },
          ))
        ]));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      handphone(category: Category(name: 'Handphone')),
      Pria(category: Category(name: 'Pria')),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce App'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_android),
            label: 'Handphone',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Pria',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
