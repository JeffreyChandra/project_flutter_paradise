import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product {
  final String imagePath;
  final String title;
  final String price;

  Product({
    required this.imagePath,
    required this.title,
    required this.price,
  });
}

class ItemWidget extends StatelessWidget {
  ItemWidget({Key? key}) : super(key: key);

  final List<Product> products = [
    Product(
      imagePath: 'assets/produk/1.jpg',
      title: 'Poke Ball',
      price: 'Rp. 72.000',
    ),
    Product(
      imagePath: 'assets/produk/2.jpg',
      title: 'Lenovo Thinkpad',
      price: 'Rp. 3.700.000',
    ),
    Product(
      imagePath: 'assets/produk/3.jpg',
      title: 'Piakchu Figure',
      price: 'Rp. 30.000',
    ),
    Product(
      imagePath: 'assets/produk/4.jpg',
      title: 'Vacuum Cleaner Zetzt',
      price: 'Rp. 690.000',
    ),
    Product(
      imagePath: 'assets/produk/5.jpg',
      title: 'Sling Alpaka',
      price: 'Rp. 1.349.000',
    ),
    Product(
      imagePath: 'assets/produk/6.jpg',
      title: 'Remote AC Daikon',
      price: 'Rp. 60.000',
    ),
    Product(
      imagePath: 'assets/produk/7.jpg',
      title: 'Robot Vacuum Cleaner',
      price: 'Rp. 3.990.000',
    ),
    Product(
      imagePath: 'assets/produk/8.jpg',
      title: 'Tissue See You',
      price: 'Rp. 6.990',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.count(
          childAspectRatio: 0.68,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          shrinkWrap: true,
          children: [
            for (int i = 0; i < 8; i++)
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 198, 206, 235),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color(0xFF312E81),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "-50%",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/produk/${i + 1}.jpg',
                          height: 120,
                          width: 120,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 8),
                      alignment: Alignment.center,
                      child: Text(
                        products[i].title,
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF312E81),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    // Container(
                    //   alignment: Alignment.centerLeft,
                    //   child: Text("Write Description",
                    //       style: TextStyle(
                    //         fontSize: 15,
                    //         color: Color.fromARGB(255, 228, 147, 243),
                    //       )),
                    // ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        products[i].price,
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF312E81),
                            fontWeight: FontWeight.bold),
                      ),
                      // child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       "\Rp. 550.000",
                      //       style: TextStyle(
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.bold,
                      //         color: Color.fromARGB(255, 228, 147, 243),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    )
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}
