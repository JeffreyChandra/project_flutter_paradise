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
  List<Product> wishlist = [];

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
    this.wishlist = wishlist ?? [];
  }
}

class ProfileProvider extends ChangeNotifier {
  List<Account> account = [
    Account(
      id: 0,
      name: 'Admin',
      profilePictureUrl: "assets/images/pp-placeholder.webp",
      email: 'admin@admin.com',
      password: 'pass',
      nik: '012345678901',
      tglLahir: '01-01-2006',
      gender: 'LAKI-LAKI',
      provinsi: 'SUMATERA UTARA',
      kota: 'MEDAN',
      kecamatan: 'MEDAN KOTA',
      kode_pos: '20222',
    )
  ];

  void addAccount(Account a) {
    a.id = account.length;
    account.add(a);
    notifyListeners();
  }

  void changeName(int id, String name) {
    for (var a in account) {
      if (a.id == id) {
        a.name = name;
        break;
      }
    }
    notifyListeners();
  }

  void changePassword(int id, String oldPass, String newPass) {
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

  void enableBiometric(int id, bool isEnabled) {
    for (var a in account) {
      if (a.id == id) {
        a.isBiometricEnabled = isEnabled;
        break;
      }
    }
    notifyListeners();
  }

  void enableFaceUnlock(int id, bool isEnabled) {
    for (var a in account) {
      if (a.id == id) {
        a.isFaceUnlockEnabled = isEnabled;
        break;
      }
    }
    notifyListeners();
  }

  void addFaceData(int id, var incFaceData, int type) {
    for (var a in account) {
      if (a.id == id) {
        a.faceData.bitmap = base64Encode(incFaceData);
        a.faceData.imageType = type;
        break;
      }
    }
    notifyListeners();
  }

  void toggleWishlist(int accountId, Product product) {
    for (var a in account) {
      if (a.id == accountId) {
        int productIndex =
            a.wishlist.indexWhere((p) => p.title == product.title);

        if (productIndex != -1) {
          a.wishlist.removeAt(productIndex);
        } else {
          a.wishlist.add(
            product.copyWith(dateAddedToWishlist: DateTime.now()),
          );
        }
        notifyListeners();
        break;
      }
    }
  }

  bool isProductInWishlist(Product product, Account account) {
    return account.wishlist.any((p) =>
        p.title ==
        product.title); // Compare based on title (or other unique identifier)
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
  DateTime? dateAddedToWishlist;

  Product({
    required this.imagePath,
    required this.title,
    required this.price,
    required this.category,
    this.description = '',
    this.sold = 0,
    this.dateAddedToWishlist,
    Map<String, int>? varianStock,
  }) : this.varianStock = varianStock ?? {};

  Product copyWith({
    String? imagePath,
    String? title,
    int? price,
    String? category,
    String? description,
    int? sold,
    Map<String, int>? varianStock,
    DateTime? dateAddedToWishlist,
  }) {
    return Product(
      imagePath: imagePath ?? this.imagePath,
      title: title ?? this.title,
      price: price ?? this.price,
      category: category ?? this.category,
      description: description ?? this.description,
      sold: sold ?? this.sold,
      varianStock: varianStock ?? this.varianStock,
      dateAddedToWishlist: dateAddedToWishlist ?? this.dateAddedToWishlist,
    );
  }
}

class ProductProvider extends ChangeNotifier {
  List<Product> products = [
    Product(
      imagePath: 'assets/produk/1.jpg',
      title: 'Poke Ball',
      price: 72000,
      category: "Mainan",
      description:
          'Lorem ipsum dolor sit amet consectetur. Sit a aliquam sagittis vel. Proin netus faucibus ullamcorper sit tristique. Odio non lorem sed massa auctor senectus. Proin condimentum fermentum mauris sagittis etiam molestie id. Semper sit facilisis orci scelerisque. Massa lacinia ut cursus ultrices etiam faucibus eu. Nibh ut aliquam volutpat amet praesent justo scelerisque ac. Nisl et donec amet non. Ultrices dignissim rutrum egestas curabitur ullamcorper elit. Dolor ut ullamcorper odio in id eu.',
      varianStock: {'S': 2, 'M': 3, 'L': 4, 'XL': 5, 'XXL': 0},
    ),
    Product(
      imagePath: 'assets/produk/2.jpg',
      title: 'Lenovo Thinkpad',
      price: 3700000,
      category: "Elektronik",
      description:
          'Lorem ipsum dolor sit amet consectetur. Sit a aliquam sagittis vel. Proin netus faucibus ullamcorper sit tristique. Odio non lorem sed massa auctor senectus. Proin condimentum fermentum mauris sagittis etiam molestie id. Semper sit facilisis orci scelerisque. Massa lacinia ut cursus ultrices etiam faucibus eu. Nibh ut aliquam volutpat amet praesent justo scelerisque ac. Nisl et donec amet non. Ultrices dignissim rutrum egestas curabitur ullamcorper elit. Dolor ut ullamcorper odio in id eu.',
      varianStock: {'RAM 16GB': 5, 'RAM 32GB': 3},
    ),
    Product(
      imagePath: 'assets/produk/3.jpg',
      title: 'Piakchu Figure',
      price: 410500,
      category: "Mainan",
      description:
          'Lorem ipsum dolor sit amet consectetur. Sit a aliquam sagittis vel. Proin netus faucibus ullamcorper sit tristique. Odio non lorem sed massa auctor senectus. Proin condimentum fermentum mauris sagittis etiam molestie id. Semper sit facilisis orci scelerisque. Massa lacinia ut cursus ultrices etiam faucibus eu. Nibh ut aliquam volutpat amet praesent justo scelerisque ac. Nisl et donec amet non. Ultrices dignissim rutrum egestas curabitur ullamcorper elit. Dolor ut ullamcorper odio in id eu.',
      varianStock: {'Basic': 20, 'Premium': 2},
    ),
    Product(
      imagePath: 'assets/produk/4.jpg',
      title: 'Vacuum Cleaner Zetzt',
      price: 4307500,
      category: "Elektronik",
      description:
          'Lorem ipsum dolor sit amet consectetur. Sit a aliquam sagittis vel. Proin netus faucibus ullamcorper sit tristique. Odio non lorem sed massa auctor senectus. Proin condimentum fermentum mauris sagittis etiam molestie id. Semper sit facilisis orci scelerisque. Massa lacinia ut cursus ultrices etiam faucibus eu. Nibh ut aliquam volutpat amet praesent justo scelerisque ac. Nisl et donec amet non. Ultrices dignissim rutrum egestas curabitur ullamcorper elit. Dolor ut ullamcorper odio in id eu.',
      varianStock: {'Blue': 5, 'Red': 7},
    ),
    Product(
      imagePath: 'assets/produk/5.jpg',
      title: 'Sling Alpaka',
      price: 1349000,
      category: "Tas",
      description:
          'Lorem ipsum dolor sit amet consectetur. Sit a aliquam sagittis vel. Proin netus faucibus ullamcorper sit tristique. Odio non lorem sed massa auctor senectus. Proin condimentum fermentum mauris sagittis etiam molestie id. Semper sit facilisis orci scelerisque. Massa lacinia ut cursus ultrices etiam faucibus eu. Nibh ut aliquam volutpat amet praesent justo scelerisque ac. Nisl et donec amet non. Ultrices dignissim rutrum egestas curabitur ullamcorper elit. Dolor ut ullamcorper odio in id eu.',
      varianStock: {'Basic': 50, 'Premium': 4},
    ),
    Product(
      imagePath: 'assets/produk/6.jpg',
      title: 'Remote AC Daikon',
      price: 60000,
      category: "Elektronik",
      description:
          'Lorem ipsum dolor sit amet consectetur. Sit a aliquam sagittis vel. Proin netus faucibus ullamcorper sit tristique. Odio non lorem sed massa auctor senectus. Proin condimentum fermentum mauris sagittis etiam molestie id. Semper sit facilisis orci scelerisque. Massa lacinia ut cursus ultrices etiam faucibus eu. Nibh ut aliquam volutpat amet praesent justo scelerisque ac. Nisl et donec amet non. Ultrices dignissim rutrum egestas curabitur ullamcorper elit. Dolor ut ullamcorper odio in id eu.',
      varianStock: {'Basic': 12},
    ),
    Product(
      imagePath: 'assets/produk/7.jpg',
      title: 'Robot Vacuum Cleaner',
      price: 3990000,
      category: "Elektronik",
      description:
          'Lorem ipsum dolor sit amet consectetur. Sit a aliquam sagittis vel. Proin netus faucibus ullamcorper sit tristique. Odio non lorem sed massa auctor senectus. Proin condimentum fermentum mauris sagittis etiam molestie id. Semper sit facilisis orci scelerisque. Massa lacinia ut cursus ultrices etiam faucibus eu. Nibh ut aliquam volutpat amet praesent justo scelerisque ac. Nisl et donec amet non. Ultrices dignissim rutrum egestas curabitur ullamcorper elit. Dolor ut ullamcorper odio in id eu.',
      varianStock: {'Silver': 6, 'Gold': 15},
    ),
    Product(
      imagePath: 'assets/produk/8.jpg',
      title: 'Tissue See You',
      price: 6990,
      category: "Kebutuhan Umum",
      description:
          'Lorem ipsum dolor sit amet consectetur. Sit a aliquam sagittis vel. Proin netus faucibus ullamcorper sit tristique. Odio non lorem sed massa auctor senectus. Proin condimentum fermentum mauris sagittis etiam molestie id. Semper sit facilisis orci scelerisque. Massa lacinia ut cursus ultrices etiam faucibus eu. Nibh ut aliquam volutpat amet praesent justo scelerisque ac. Nisl et donec amet non. Ultrices dignissim rutrum egestas curabitur ullamcorper elit. Dolor ut ullamcorper odio in id eu.',
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

  List<Product> _searchResults = [];

  List<Product> get searchResults => _searchResults;

  Future<List<Product>> searchProducts(String query) async {
    return products.where((product) {
      return product.title.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}

// Order History
class OrderHistoryItem {
  final String imagePath;
  final String title;
  final int totalPrice;
  final String category;
  final DateTime purchaseDate;
  int sold;

  OrderHistoryItem({
    required this.imagePath,
    required this.title,
    required this.totalPrice,
    required this.category,
    required this.purchaseDate,
    this.sold = 0,
  });
}

class OrderHistoryProvider extends ChangeNotifier {
  List<OrderHistoryItem> orderHistoryItems = [
    OrderHistoryItem(
      imagePath: 'assets/produk/1.jpg',
      title: 'Poke Ball',
      totalPrice: 72000,
      category: "Mainan",
      purchaseDate: DateTime.now(),
    ),
    OrderHistoryItem(
      imagePath: 'assets/produk/1.jpg',
      title: 'Poke Ball',
      totalPrice: 72000,
      category: "Mainan",
      purchaseDate: DateTime.now(),
    ),
    OrderHistoryItem(
      imagePath: 'assets/produk/1.jpg',
      title: 'Poke Ball',
      totalPrice: 72000,
      category: "Mainan",
      purchaseDate: DateTime.now(),
    ),
    OrderHistoryItem(
      imagePath: 'assets/produk/1.jpg',
      title: 'Poke Ball',
      totalPrice: 72000,
      category: "Mainan",
      purchaseDate: DateTime.now(),
    ),
    OrderHistoryItem(
      imagePath: 'assets/produk/1.jpg',
      title: 'Poke Ball',
      totalPrice: 72000,
      category: "Mainan",
      purchaseDate: DateTime.now(),
    ),
  ];

  void addOrderHistoryItem(OrderHistoryItem item) {
    orderHistoryItems.add(item);
    notifyListeners();
  }
}

class Locations {
  final String name;
  final String address;
  final double latitude;
  final double longitude;

  Locations(
      {required this.name,
      required this.address,
      required this.latitude,
      required this.longitude});
}

class LocationProvider extends ChangeNotifier {
  List<Locations> _locations = [
    Locations(
        name: 'Rumah',
        address: 'My Home',
        latitude: -6.200000,
        longitude: 106.816666),
    Locations(
        name: 'Kos Beruang Merah',
        address: 'Jalan beruang merah',
        latitude: -6.300000,
        longitude: 106.816666),
  ];

  List<Locations> get locations => _locations;

  Locations? _selectedLocation;

  Locations? get selectedLocation => _selectedLocation;

  void setSelectedLocation(Locations location) {
    _selectedLocation = location;
    notifyListeners();
  }

  void addLocation(Locations location) {
    _locations.add(location);
    notifyListeners();
  }
}

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Map<String, dynamic> cartItem) {
    // Check if the item already exists in the cart
    var existingItemIndex =
        _cartItems.indexWhere((item) => item['id'] == cartItem['id']);

    if (existingItemIndex >= 0) {
      // Item already exists, update its quantity
      _cartItems[existingItemIndex]['quantity'] += 1;
    } else {
      // Add new item with default quantity 1
      cartItem['quantity'] = 1;
      _cartItems.add(cartItem);
    }

    notifyListeners();
  }

  void removeProduct(String id) {
    _cartItems.removeWhere((item) => item['id'] == id);
    notifyListeners();
  }

  void updateItemQuantity(String id, int newQuantity) {
    var index = _cartItems.indexWhere((item) => item['id'] == id);
    if (index != -1) {
      if (newQuantity > 0) {
        _cartItems[index]['quantity'] = newQuantity;
      } else {
        _cartItems.removeAt(index);
      }
      notifyListeners();
    }
  }

  double get totalPrice {
    return _cartItems.fold(
      0.0,
      (sum, item) => sum + (item['price'] * item['quantity']),
    );
  }
}
