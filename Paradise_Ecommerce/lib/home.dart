import 'package:e_commerce/keranjang.dart';
import 'package:e_commerce/product_details.dart';
import 'package:e_commerce/profile.dart';
import 'package:e_commerce/provider_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/widget/itemWidget.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
                height: 40,
                child: Consumer<ProductProvider>(
                  builder: (context, productProvider, _) =>
                      TypeAheadField<Product>(
                    suggestionsCallback: (pattern) async {
                      if (pattern.isEmpty) return [];
                      return productProvider.searchProducts(pattern);
                    },
                    itemBuilder: (context, Product suggestion) {
                      final formatter = NumberFormat.currency(
                        locale: 'id_ID',
                        symbol: 'Rp ',
                        decimalDigits: 0,
                      );

                      return ListTile(
                        contentPadding: EdgeInsets.all(8), // Add padding
                        leading: ClipRRect(
                          // Rounded image corners
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            suggestion.imagePath,
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          suggestion.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          formatter.format(suggestion.price),
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF6366F1)),
                        ),
                        trailing: Text(
                          'Stok sisa : ${productProvider.getTotalStock(suggestion)}',
                          style: TextStyle(color: Colors.grey),
                        ),
                      );
                    },
                    suggestionsController: SuggestionsController(),
                    onSelected: (Product suggestion) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Builder(
                              builder: (innerContext) =>
                                  ProductDetails(obj: suggestion)),
                        ),
                      );
                    },
                    debounceDuration: const Duration(milliseconds: 400),
                    builder: (context, controller, focusNode) {
                      return TextField(
                        controller: controller,
                        focusNode: focusNode,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF31323D),
                        ),
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                              color: Color(0xFFDBDBDB),
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                              color: Color(0xFFDBDBDB),
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                              color: Color(0xFF6366F1),
                              width: 1.0,
                            ),
                          ),
                          prefixIcon: Icon(Icons.search,
                              size: 24, color: Color(0xFF6366F1)),
                          prefixIconConstraints:
                              BoxConstraints(minWidth: 40, minHeight: 40),
                          hintText: 'Cari di sini',
                          hintStyle: TextStyle(
                            color: Color(0xFFB1B1B1),
                          ),
                        ),
                      );
                    },
                    emptyBuilder: (context) => SizedBox.shrink(),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.80,
                  padding: const EdgeInsets.all(
                      16.0), // Menambahkan padding jika diperlukan
                  child:
                      CartPage(), // Menampilkan CartPage di dalam BottomSheet
                ),
              );
            },
            backgroundColor: Colors
                .white, // Ganti dengan warna latar belakang yang diinginkan
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                      16)), // Menambahkan radius pada bagian atas BottomSheet
            ),
          );
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
