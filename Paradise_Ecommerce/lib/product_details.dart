import 'package:e_commerce/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_commerce/provider_data.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final Product obj;
  const ProductDetails({super.key, required this.obj});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String _varian = '';

  @override
  Widget build(BuildContext context) {
    Product product = widget.obj;

    String formatNumber(int number) {
      var format = NumberFormat('#,###', 'en_US');
      return format.format(number).replaceAll(',', '.');
    }

    String formatShort(int number) {
      if (number >= 1000000) {
        return (number / 1000000).toStringAsFixed(1) + 'Jt';
      } else if (number >= 1000) {
        return (number / 1000).toStringAsFixed(1) + 'Rb';
      } else {
        return number.toString();
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Color(0xFFDBDBDB),
            height: 1.0,
          ),
        ),
        titleSpacing: 12,
        title: Container(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  child: TextField(
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF31323D),
                    ), // adjust text field height
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
                          color: Color(0xFFDBDBDB), // this is for the enabled state
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
                      prefixIcon: Icon(Icons.search, size: 24, color: Color(0xFF6366F1),),
                      prefixIconConstraints: BoxConstraints(minWidth: 40, minHeight: 40),
                      hintText: 'Cari di sini',
                      hintStyle: TextStyle(
                        color: Color(0xFFB1B1B1),
                      )
                    ),
                  ),
                )
              ),
              SizedBox(width: 12),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(4)
                      ),
                      border: Border.all(
                        color: Color(0xFFDBDBDB),
                        width: 1.0,
                      )
                  ),
                  child: Icon(Icons.shopping_cart,
                      color: Color(0xFF6366F1), size: 20),
                ),
              ),
              SizedBox(width: 12),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile()));
                },
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4)
                    ),
                    border: Border.all(
                      color: Color(0xFFDBDBDB),
                      width: 1.0,
                    )
                  ),
                  child: Icon(Icons.person,
                    color: Color(0xFF6366F1), size: 24),
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image(image: AssetImage(product.imagePath),
                      height: MediaQuery.of(context).size.width,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)
                                          ),
                                          color: Color(0xFF6366F1),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                                        child: Text(product.category, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white)),
                                      ),
                                    ),
                                    SizedBox(height: 8,),
                                    Text(product.title, style: GoogleFonts.inter(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),)
                                  ],
                                ),
                              ),
                              SizedBox(width: 8,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('Rp', style: TextStyle(
                                        color: Color(0xFF6366F1),
                                        fontSize: 16,
                                      )),
                                      SizedBox(width: 4,),
                                      Text(formatShort(product.price), style: GoogleFonts.inter(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF6366F1),
                                      ))
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('Rp', style: TextStyle(
                                        color: Color(0xFF818CF8),
                                        fontSize: 12,
                                      )),
                                      SizedBox(width: 4,),
                                      Text(formatNumber(product.price), style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF818CF8),
                                      ))
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 8,),
                          Divider(
                            color: Color(0xFFDBDBDB),
                            thickness: 1,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.inventory_2_outlined, color: Color(0xFF31323D), size: 20,),
                                    SizedBox(width: 8,),
                                    Text("Stok tersisa", style: TextStyle(
                                      color: Color(0xFF31323D),
                                      fontSize: 12,
                                    ))
                                  ],
                                ),
                                Text('${Provider.of<ProductProvider>(context).getTotalStock(product)} pcs', style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Color(0xFF31323D),
                                ))
                              ],
                            ),
                          ),
                          Divider(
                            color: Color(0xFFDBDBDB),
                            thickness: 1,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage("assets/icon/sold.png"),
                                      fit: BoxFit.contain,
                                      width: 20,
                                      height: 20,
                                    ),
                                    SizedBox(width: 8,),
                                    Text("Produk terjual", style: TextStyle(
                                      color: Color(0xFF31323D),
                                      fontSize: 12,
                                    ))
                                  ],
                                ),
                                Text('${product.sold} pcs', style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Color(0xFF31323D),
                                ))
                              ],
                            ),
                          ),
                          Divider(
                            color: Color(0xFFDBDBDB),
                            thickness: 1,
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Varian', style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Color(0xFF31323D),
                                    ),),
                                    SizedBox(height: 12),
                                    Container(
                                      height: product.varianStock.keys.length > 4 ? ((product.varianStock.keys.length / 4).ceil() * 45.0) : 40,
                                      child: GridView.count(
                                        childAspectRatio: (2 / 1),
                                        mainAxisSpacing: 8,
                                        crossAxisSpacing: 12,
                                        crossAxisCount: 4,
                                        children: product.varianStock.keys.map((varian) {
                                          return ChoiceChip(
                                            showCheckmark: false,
                                            padding: EdgeInsets.all(0),
                                            label: Container(
                                              height: 40,
                                              padding: EdgeInsets.symmetric(horizontal: 12),
                                              alignment: Alignment.center,
                                              child: Text(
                                                varian,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: _varian == varian ? Colors.white : Color(0xFF31323D),
                                                ),
                                              ),
                                            ),
                                            selected: _varian == varian,
                                            onSelected: (bool selected) {
                                              setState(() {
                                                if (_varian == varian) {
                                                  _varian = ''; // deselect the chip
                                                } else {
                                                  _varian = varian; // select the chip
                                                }
                                              });
                                            },
                                            backgroundColor: Colors.white, // this is the background color
                                            selectedColor: Color(0xFF6366F1),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(4),
                                              ),
                                              side: BorderSide(
                                                color: Color(0xFFDBDBDB),
                                                width: 1.0,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    )
                                  ]
                              )
                          ),
                          Divider(
                            color: Color(0xFFDBDBDB),
                            thickness: 1,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Deskripsi', style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Color(0xFF31323D),
                                ),),
                                SizedBox(height: 12,),
                                Text(product.description,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF31323D),
                                  ),)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  )
                ]
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ButtonTheme(
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Add to Cart',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          )
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFF6366F1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12,),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(4)
                          ),
                          border: Border.all(
                            color: Color(0xFFDBDBDB),
                            width: 1.0,
                          )
                      ),
                      child: Icon(Icons.favorite_border_outlined,
                          color: Color(0xFF6366F1), size: 24),
                    ),
                  )
                ],
              )
            )
          ],
        ),
    );
  }
}
