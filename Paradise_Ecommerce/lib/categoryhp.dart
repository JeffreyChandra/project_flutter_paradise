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

  @override
  Widget build(BuildContext context) {
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
              'Best Sales',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: handphones.length,
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
                      Image.asset(handphones[index].filehp, height: 100),
                      SizedBox(height: 8),
                      Text(handphones[index].title),
                      Text("Rp ${handphones[index].price}"),
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
              'rekomendasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: handphones.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListTile(
                    leading: Image.asset(handphones[index].filehp),
                    title: Text(handphones[index].title),
                    subtitle: Text('Deskripsi produk'),
                    trailing: Text("Rp ${handphones[index].price}"),
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
        selectedItemColor: Colors.blue,
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Pria(category: Category(name: 'Pria')),
              ),
            );
          }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.category.name),
        ),
        backgroundColor: Colors.grey[300],
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              itemCount: priaProducts.length,
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
                      Image.asset(priaProducts[index].filepria, height: 100),
                      SizedBox(height: 8),
                      Text(priaProducts[index].title),
                      Text("Rp ${priaProducts[index].price}"),
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
              'rekomendasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: priaProducts.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListTile(
                  leading: Image.asset(priaProducts[index].filepria),
                  title: Text(priaProducts[index].title),
                  subtitle: Text('Deskripsi produk'),
                  trailing: Text("Rp ${priaProducts[index].price}"),
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

class Wanita extends StatefulWidget {
  final Category category;

  const Wanita({Key? key, required this.category}) : super(key: key);

  @override
  State<Wanita> createState() => _wanitaState();
}

class wanitaProduct {
  String title;
  String filewanita;
  int price;

  wanitaProduct({this.title = ' ', this.filewanita = ' ', required this.price});
}

class _wanitaState extends State<Wanita> {
  List<wanitaProduct> wanitaProducts = [
    wanitaProduct(
        title: "Wanita",
        filewanita: '../assets/images/wanita.jpg',
        price: 3000000000),
    wanitaProduct(
        title: "Wanita",
        filewanita: '../assets/images/wanita.jpg',
        price: 3000000000),
    wanitaProduct(
        title: "Wanita",
        filewanita: '../assets/images/wanita.jpg',
        price: 3000000000),
    wanitaProduct(
        title: "Wanita",
        filewanita: '../assets/images/wanita.jpg',
        price: 3000000000),
    wanitaProduct(
        title: "Wanita",
        filewanita: '../assets/images/wanita.jpg',
        price: 3000000000)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.category.name),
        ),
        backgroundColor: Colors.grey[300],
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              itemCount: wanitaProducts.length,
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
                      Image.asset(wanitaProducts[index].filewanita,
                          height: 100),
                      SizedBox(height: 8),
                      Text(wanitaProducts[index].title),
                      Text("Rp ${wanitaProducts[index].price}"),
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
              'rekomendasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: wanitaProducts.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListTile(
                  leading: Image.asset(wanitaProducts[index].filewanita),
                  title: Text(wanitaProducts[index].title),
                  subtitle: Text('Deskripsi produk'),
                  trailing: Text("Rp ${wanitaProducts[index].price}"),
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
        title: "Laptop",
        filelaptop: '../assets/images/laptop.jpg',
        price: 3000000000),
    laptopProduct(
        title: "Laptop",
        filelaptop: '../assets/images/laptop.jpg',
        price: 3000000000),
    laptopProduct(
        title: "Laptop",
        filelaptop: '../assets/images/laptop.jpg',
        price: 3000000000),
    laptopProduct(
        title: "Laptop",
        filelaptop: '../assets/images/laptop.jpg',
        price: 3000000000)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.category.name),
        ),
        backgroundColor: Colors.grey[300],
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              itemCount: laptopProducts.length,
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
                      Image.asset(laptopProducts[index].filelaptop,
                          height: 100),
                      SizedBox(height: 8),
                      Text(laptopProducts[index].title),
                      Text("Rp ${laptopProducts[index].price}"),
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
              'rekomendasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: laptopProducts.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListTile(
                  leading: Image.asset(laptopProducts[index].filelaptop),
                  title: Text(laptopProducts[index].title),
                  subtitle: Text('Deskripsi produk'),
                  trailing: Text("Rp ${laptopProducts[index].price}"),
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
        title: "Komputer",
        filekomputer: '../assets/images/komputer.jpg',
        price: 100000000000),
    komputerProduct(
        title: "Komputer",
        filekomputer: '../assets/images/komputer.jpg',
        price: 100000000000),
    komputerProduct(
        title: "Komputer",
        filekomputer: '../assets/images/komputer.jpg',
        price: 100000000000),
    komputerProduct(
        title: "Komputer",
        filekomputer: '../assets/images/komputer.jpg',
        price: 100000000000),
    komputerProduct(
        title: "Komputer",
        filekomputer: '../assets/images/komputer.jpg',
        price: 100000000000)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.category.name),
        ),
        backgroundColor: Colors.grey[300],
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              itemCount: komputerProducts.length,
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
                      Image.asset(komputerProducts[index].filekomputer,
                          height: 100),
                      SizedBox(height: 8),
                      Text(komputerProducts[index].title),
                      Text("Rp ${komputerProducts[index].price}"),
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
              'rekomendasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: komputerProducts.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListTile(
                  leading: Image.asset(komputerProducts[index].filekomputer),
                  title: Text(komputerProducts[index].title),
                  subtitle: Text('Deskripsi produk'),
                  trailing: Text("Rp ${komputerProducts[index].price}"),
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

class AnakAnak extends StatefulWidget {
  final Category category;

  const AnakAnak({Key? key, required this.category}) : super(key: key);

  @override
  State<AnakAnak> createState() => _AnakAnakState();
}

class AnakAnakProduct {
  String title;
  String fileAnakAnak;
  int price;

  AnakAnakProduct(
      {this.title = ' ', this.fileAnakAnak = ' ', required this.price});
}

class _AnakAnakState extends State<AnakAnak> {
  List<AnakAnakProduct> anakAnakProducts = [
    AnakAnakProduct(
        title: "Mainan Anak",
        fileAnakAnak: '../assets/images/mainan.webp',
        price: 50000),
    AnakAnakProduct(
        title: "Mainan Anak",
        fileAnakAnak: '../assets/images/mainan.webp',
        price: 50000),
    AnakAnakProduct(
        title: "Mainan Anak",
        fileAnakAnak: '../assets/images/mainan.webp',
        price: 50000),
    AnakAnakProduct(
        title: "Mainan Anak",
        fileAnakAnak: '../assets/images/mainan.webp',
        price: 50000),
    AnakAnakProduct(
        title: "Mainan Anak",
        fileAnakAnak: '../assets/images/mainan.webp',
        price: 50000),
    AnakAnakProduct(
        title: "Mainan Anak",
        fileAnakAnak: '../assets/images/mainan.webp',
        price: 50000)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.category.name),
        ),
        backgroundColor: Colors.grey[300],
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              itemCount: anakAnakProducts.length,
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
                      Image.asset(anakAnakProducts[index].fileAnakAnak,
                          height: 100),
                      SizedBox(height: 8),
                      Text(anakAnakProducts[index].title),
                      Text("Rp ${anakAnakProducts[index].price}"),
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
              'rekomendasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: anakAnakProducts.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListTile(
                  leading: Image.asset(anakAnakProducts[index].fileAnakAnak),
                  title: Text(anakAnakProducts[index].title),
                  subtitle: Text('Deskripsi produk'),
                  trailing: Text("Rp ${anakAnakProducts[index].price}"),
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
        title: "Game", fileGame: '../assets/images/game.webp', price: 500000),
    GameProduct(
        title: "Game", fileGame: '../assets/images/game.webp', price: 500000),
    GameProduct(
        title: "Game", fileGame: '../assets/images/game.webp', price: 500000),
    GameProduct(
        title: "Game", fileGame: '../assets/images/game.webp', price: 500000),
    GameProduct(
        title: "Game", fileGame: '../assets/images/game.webp', price: 500000),
    GameProduct(
        title: "Game", fileGame: '../assets/images/game.webp', price: 500000)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.category.name),
        ),
        backgroundColor: Colors.grey[300],
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              itemCount: gameProducts.length,
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
                      Image.asset(gameProducts[index].fileGame, height: 100),
                      SizedBox(height: 8),
                      Text(gameProducts[index].title),
                      Text("Rp ${gameProducts[index].price}"),
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
              'rekomendasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: gameProducts.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListTile(
                  leading: Image.asset(gameProducts[index].fileGame),
                  title: Text(gameProducts[index].title),
                  subtitle: Text('Deskripsi produk'),
                  trailing: Text("Rp ${gameProducts[index].price}"),
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
        title: "Motor",
        fileMotor: '../assets/images/motor.png',
        price: 50000000),
    MotorProduct(
        title: "Motor",
        fileMotor: '../assets/images/motor.png',
        price: 50000000),
    MotorProduct(
        title: "Motor",
        fileMotor: '../assets/images/motor.png',
        price: 50000000),
    MotorProduct(
        title: "Motor",
        fileMotor: '../assets/images/motor.png',
        price: 50000000),
    MotorProduct(
        title: "Motor",
        fileMotor: '../assets/images/motor.png',
        price: 50000000),
    MotorProduct(
        title: "Motor",
        fileMotor: '../assets/images/motor.png',
        price: 50000000)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.category.name),
        ),
        backgroundColor: Colors.grey[300],
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              itemCount: motorProducts.length,
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
                      Image.asset(motorProducts[index].fileMotor, height: 100),
                      SizedBox(height: 8),
                      Text(motorProducts[index].title),
                      Text("Rp ${motorProducts[index].price}"),
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
              'rekomendasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: motorProducts.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListTile(
                  leading: Image.asset(motorProducts[index].fileMotor),
                  title: Text(motorProducts[index].title),
                  subtitle: Text('Deskripsi produk'),
                  trailing: Text("Rp ${motorProducts[index].price}"),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.category.name),
        ),
        backgroundColor: Colors.grey[300],
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              itemCount: aksesorisProducts.length,
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
                      Image.asset(aksesorisProducts[index].fileAksesoris,
                          height: 100),
                      SizedBox(height: 8),
                      Text(aksesorisProducts[index].title),
                      Text("Rp ${aksesorisProducts[index].price}"),
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
              'rekomendasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: aksesorisProducts.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListTile(
                  leading: Image.asset(aksesorisProducts[index].fileAksesoris),
                  title: Text(aksesorisProducts[index].title),
                  subtitle: Text('Deskripsi produk'),
                  trailing: Text("Rp ${aksesorisProducts[index].price}"),
                  onTap: () {
                  },
                ),
              );
            },
          ))
        ]));
  }
}

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> _pages = [
//       handphone(category: Category(name: 'Handphone')),
//       Pria(category: Category(name: 'Pria')),
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('E-Commerce App'),
//       ),
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.phone_android),
//             label: 'Handphone',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Pria',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
