import 'package:e_commerce/keranjang.dart';
import 'package:e_commerce/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/widget/itemWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var PrimaryColor = Color.fromARGB(255, 129, 141, 248);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      Text(
                        'cari di sini',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Icon(Icons.shopping_cart),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Profile()));
                },
                child: Icon(Icons.person),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Keranjang()));
        },
        backgroundColor: PrimaryColor,
        child: Icon(
          Icons.shopping_cart_rounded,
          color: Colors.white,
        ),
        heroTag: 'uniqueTag',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(height: 100.0),
                          items: [
                            "assets/images/banner-1.webp",
                            "assets/images/banner-2.webp"
                          ].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  child: Image.asset(
                                    i,
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Container(
                  //   height: 80,
                  //   child: ListView(
                  //     scrollDirection: Axis.horizontal,
                  //     children: [
                  //       MenuButton(
                  //         label: "Official store",
                  //         icon: Icon(Icons.abc),
                  //       ),
                  //       MenuButton(
                  //         label: "Elektronik",
                  //         icon: Icon(Icons.ac_unit),
                  //       ),
                  //       MenuButton(
                  //         label: "Pakaian",
                  //         icon: Icon(Icons.access_alarm_rounded),
                  //       ),
                  //       MenuButton(
                  //         label: "Official store",
                  //         icon: Icon(Icons.abc),
                  //       ),
                  //       MenuButton(
                  //         label: "Elektronik",
                  //         icon: Icon(Icons.ac_unit),
                  //       ),
                  //       MenuButton(
                  //         label: "Pakaian",
                  //         icon: Icon(Icons.access_alarm_rounded),
                  //       ),
                  //       MenuButton(
                  //         label: "Official store",
                  //         icon: Icon(Icons.abc),
                  //       ),
                  //       MenuButton(
                  //         label: "Elektronik",
                  //         icon: Icon(Icons.ac_unit),
                  //       ),
                  //       MenuButton(
                  //         label: "Pakaian",
                  //         icon: Icon(Icons.access_alarm_rounded),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Best Selling",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: ItemWidget(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
