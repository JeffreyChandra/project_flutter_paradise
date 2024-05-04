import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:e_commerce/widget/face_api.dart' hide Image;

class Account {
  int id;
  String name;
  String profilePictureUrl;
  String email;
  String password;
  String nik;
  String tglLahir;
  String gender;
  String provinsi;
  String kota;
  String kecamatan;
  String kode_pos;
  bool isBiometricEnabled;
  bool isFaceUnlockEnabled;
  var faceData;

  Account({
    this.id = 0,
    this.name = '',
    this.profilePictureUrl = '',
    this.email = '',
    this.password = '',
    this.nik = '',
    this.tglLahir = '',
    this.gender = '',
    this.provinsi = '',
    this.kota = '',
    this.kecamatan = '',
    this.kode_pos = '',
    this.isBiometricEnabled = false,
    this.isFaceUnlockEnabled = false,
    this.faceData,
  }) {
    this.faceData ??= MatchFacesImage();
  }
}

class ProfileProvider extends ChangeNotifier{
  List<Account> account = [];

  void addAccount(Account a){
    a.id = account.length;
    account.add(a);
    notifyListeners();
  }

  void changeName(int id, String name){
    for (var a in account) {
      if (a.id == id) {
        a.name = name;
        break;
      }
    }
    notifyListeners();
  }

  void changePassword(int id, String oldPass, String newPass){
    for (var a in account) {
      if (a.id == id) {
        if (a.password == oldPass) {
          a.password = newPass;
          break;
        }
      }
    }
    notifyListeners();
  }

  void enableBiometric(int id, bool isEnabled){
    for (var a in account) {
      if (a.id == id) {
        a.isBiometricEnabled = isEnabled;
        break;
      }
    }
    notifyListeners();
  }

  void enableFaceUnlock(int id, bool isEnabled){
    for (var a in account) {
      if (a.id == id) {
        a.isFaceUnlockEnabled = isEnabled;
        break;
      }
    }
    notifyListeners();
  }

  void addFaceData(int id, var incFaceData, int type){
    for (var a in account) {
      if (a.id == id) {
        a.faceData.bitmap = base64Encode(incFaceData);
        a.faceData.imageType = type;
        break;
      }
    }
    notifyListeners();
  }
}

// Product
class Product {
  final String imagePath;
  final String title;
  final int price;
  final String category;
  Map<String, int> varianStock;
  String description;
  int sold;

  Product({
    required this.imagePath,
    required this.title,
    required this.price,
    required this.category,
    this.description = '',
    this.sold = 0,
    Map<String, int>? varianStock,
  }) : this.varianStock = varianStock ?? {};
}

class ProductProvider extends ChangeNotifier {
  List<Product> products = [
    Product(
      imagePath: 'assets/produk/1.jpg',
      title: 'Poke Ball',
      price: 72000,
      category: "Mainan",
      description: 'Lorem ipsum dolor sit amet consectetur. Sit a aliquam sagittis vel. Proin netus faucibus ullamcorper sit tristique. Odio non lorem sed massa auctor senectus. Proin condimentum fermentum mauris sagittis etiam molestie id. Semper sit facilisis orci scelerisque. Massa lacinia ut cursus ultrices etiam faucibus eu. Nibh ut aliquam volutpat amet praesent justo scelerisque ac. Nisl et donec amet non. Ultrices dignissim rutrum egestas curabitur ullamcorper elit. Dolor ut ullamcorper odio in id eu.',
      varianStock: {'S': 2, 'M': 3, 'L': 4, 'XL': 5, 'XXL': 0},
    ),
    Product(
      imagePath: 'assets/produk/2.jpg',
      title: 'Lenovo Thinkpad',
      price: 3700000,
      category: "Elektronik",
      description: 'Lorem ipsum dolor sit amet consectetur. Sit a aliquam sagittis vel. Proin netus faucibus ullamcorper sit tristique. Odio non lorem sed massa auctor senectus. Proin condimentum fermentum mauris sagittis etiam molestie id. Semper sit facilisis orci scelerisque. Massa lacinia ut cursus ultrices etiam faucibus eu. Nibh ut aliquam volutpat amet praesent justo scelerisque ac. Nisl et donec amet non. Ultrices dignissim rutrum egestas curabitur ullamcorper elit. Dolor ut ullamcorper odio in id eu.',
      varianStock: {'RAM 16GB': 5, 'RAM 32GB': 3},
    ),
    Product(
      imagePath: 'assets/produk/3.jpg',
      title: 'Piakchu Figure',
      price: 410500,
      category: "Mainan",
      description: 'Lorem ipsum dolor sit amet consectetur. Sit a aliquam sagittis vel. Proin netus faucibus ullamcorper sit tristique. Odio non lorem sed massa auctor senectus. Proin condimentum fermentum mauris sagittis etiam molestie id. Semper sit facilisis orci scelerisque. Massa lacinia ut cursus ultrices etiam faucibus eu. Nibh ut aliquam volutpat amet praesent justo scelerisque ac. Nisl et donec amet non. Ultrices dignissim rutrum egestas curabitur ullamcorper elit. Dolor ut ullamcorper odio in id eu.',
      varianStock: {'Basic': 20, 'Premium': 2},
    ),
    Product(
      imagePath: 'assets/produk/4.jpg',
      title: 'Vacuum Cleaner Zetzt',
      price: 4307500,
      category: "Elektronik",
      description: 'Lorem ipsum dolor sit amet consectetur. Sit a aliquam sagittis vel. Proin netus faucibus ullamcorper sit tristique. Odio non lorem sed massa auctor senectus. Proin condimentum fermentum mauris sagittis etiam molestie id. Semper sit facilisis orci scelerisque. Massa lacinia ut cursus ultrices etiam faucibus eu. Nibh ut aliquam volutpat amet praesent justo scelerisque ac. Nisl et donec amet non. Ultrices dignissim rutrum egestas curabitur ullamcorper elit. Dolor ut ullamcorper odio in id eu.',
      varianStock: {'Blue': 5, 'Red': 7},
    ),
    Product(
      imagePath: 'assets/produk/5.jpg',
      title: 'Sling Alpaka',
      price: 1349000,
      category: "Tas",
      description: 'Lorem ipsum dolor sit amet consectetur. Sit a aliquam sagittis vel. Proin netus faucibus ullamcorper sit tristique. Odio non lorem sed massa auctor senectus. Proin condimentum fermentum mauris sagittis etiam molestie id. Semper sit facilisis orci scelerisque. Massa lacinia ut cursus ultrices etiam faucibus eu. Nibh ut aliquam volutpat amet praesent justo scelerisque ac. Nisl et donec amet non. Ultrices dignissim rutrum egestas curabitur ullamcorper elit. Dolor ut ullamcorper odio in id eu.',
      varianStock: {'Basic': 50, 'Premium': 4},
    ),
    Product(
      imagePath: 'assets/produk/6.jpg',
      title: 'Remote AC Daikon',
      price: 60000,
      category: "Elektronik",
      description: 'Lorem ipsum dolor sit amet consectetur. Sit a aliquam sagittis vel. Proin netus faucibus ullamcorper sit tristique. Odio non lorem sed massa auctor senectus. Proin condimentum fermentum mauris sagittis etiam molestie id. Semper sit facilisis orci scelerisque. Massa lacinia ut cursus ultrices etiam faucibus eu. Nibh ut aliquam volutpat amet praesent justo scelerisque ac. Nisl et donec amet non. Ultrices dignissim rutrum egestas curabitur ullamcorper elit. Dolor ut ullamcorper odio in id eu.',
      varianStock: {'Basic': 12},
    ),
    Product(
      imagePath: 'assets/produk/7.jpg',
      title: 'Robot Vacuum Cleaner',
      price: 3990000,
      category: "Elektronik",
      description: 'Lorem ipsum dolor sit amet consectetur. Sit a aliquam sagittis vel. Proin netus faucibus ullamcorper sit tristique. Odio non lorem sed massa auctor senectus. Proin condimentum fermentum mauris sagittis etiam molestie id. Semper sit facilisis orci scelerisque. Massa lacinia ut cursus ultrices etiam faucibus eu. Nibh ut aliquam volutpat amet praesent justo scelerisque ac. Nisl et donec amet non. Ultrices dignissim rutrum egestas curabitur ullamcorper elit. Dolor ut ullamcorper odio in id eu.',
      varianStock: {'Silver': 6, 'Gold': 15},
    ),
    Product(
      imagePath: 'assets/produk/8.jpg',
      title: 'Tissue See You',
      price: 6990,
      category: "Kebutuhan Umum",
      description: 'Lorem ipsum dolor sit amet consectetur. Sit a aliquam sagittis vel. Proin netus faucibus ullamcorper sit tristique. Odio non lorem sed massa auctor senectus. Proin condimentum fermentum mauris sagittis etiam molestie id. Semper sit facilisis orci scelerisque. Massa lacinia ut cursus ultrices etiam faucibus eu. Nibh ut aliquam volutpat amet praesent justo scelerisque ac. Nisl et donec amet non. Ultrices dignissim rutrum egestas curabitur ullamcorper elit. Dolor ut ullamcorper odio in id eu.',
      varianStock: {'Basic': 100},
    ),
  ];

  int getTotalStock(Product product) {
    int totalStock = 0;
    product.varianStock.values.forEach((stock) {
      totalStock += stock;
    });
    return totalStock;
  }
}