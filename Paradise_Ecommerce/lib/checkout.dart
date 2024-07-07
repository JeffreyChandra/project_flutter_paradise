import 'package:e_commerce/payment.dart';
import 'package:e_commerce/provider_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  const Checkout({Key? key, required this.cartItems}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> cartItems = widget.cartItems;
    final selectedLocation = Provider.of<LocationProvider>(context).selectedLocation;


    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Color(0xFFDBDBDB),
            height: 1.0,
          ),
        ),
        title: Text('Checkout'),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Color(0xFF31323d),
        ),
        titleSpacing: 12,
      ),
      body: Column(
        children: 
        [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Text("Alamat", style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 14)),
                        SizedBox(height: 12),
                        Text(
                          selectedLocation != null
                          ? '${selectedLocation.address}'
                          : 'Tidak ada lokasi pengiriman terpilih',
                    ),
                      ],
                    ),
                    Divider(
                      color: Color(0xFFDBDBDB),
                      thickness: 1,
                      height: 32,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Order", style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 14)),
                        SizedBox(height: 12),
                        Column(
                          children: [
                            ListView.builder(
                        shrinkWrap: true,
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          return Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(4)
                                  ),
                                  border: Border.all(
                                    color: Color(0xFFDBDBDB),
                                    width: 1.0,
                                  )
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                    child: Image(image: NetworkImage('${cartItems[index]['imageUrl']}'),
                                      height: 60,
                                      width: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("${cartItems[index]['name']}", style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 14)),
                                              SizedBox(height: 8),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text("${cartItems[index]['quantity']}", style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 10)),
                                                  SizedBox(width: 2),
                                                  Text("pcs", style: GoogleFonts.inter(fontSize: 10)),
                                                ],
                                              ),
                                              SizedBox(height: 8),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text("Variant : ", style: GoogleFonts.inter(fontSize: 10)),
                                                  SizedBox(width: 2),
                                                  Text("${cartItems[index]['variant']}", style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 10)),
                                                ],
                                              ),
                                            ]
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text("Rp : ", style: GoogleFonts.inter(fontSize: 10, color: Color(0xFF6366F1))),
                                            SizedBox(width: 2),
                                            Text("${formatCurrency(cartItems[index]['price'])}", style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF6366F1))),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                          ],
                        )
                      ],
                    ),
                    Divider(
                      color: Color(0xFFDBDBDB),
                      thickness: 1,
                      height: 32,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total biaya", style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 14)),
                        SizedBox(height: 12),
                        Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: cartItems.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:[
                                      Text('${cartItems[index]["name"]}', style: TextStyle(fontSize: 13)),
                                      Text('${formatCurrency(cartItems[index]['price'] * cartItems[index]['quantity'])}', style: TextStyle(fontSize: 13))
                                    ]
                                  )
                                );
                              },
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: List.generate(
                                  120,
                                      (index) => index % 2 == 0
                                      ? Container(width: 4, height: 1, color: Color(0xFFDBDBDB))
                                      : Container(width: 2, height: 1),
                                ),
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total', style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF6366F1))),
                                  Text('Rp ${formatCurrency(Provider.of<CartProvider>(context).calculateTotalPrice(cartItems))}', style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF6366F1)))
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
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
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Payment(cartItems: cartItems,)));
                        },
                        child: Text('Continue to Payment',
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
                ],
              )
          )
        ]
      )
    );
  }
}


  String formatCurrency(double amount) {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0);
    return formatter.format(amount);
  }
