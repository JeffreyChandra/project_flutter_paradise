import 'package:e_commerce/payment.dart';
import 'package:e_commerce/provider_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
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
                        Text("Jl. M.H Thamrin No.140, Pusat Ps., Kec. Medan Kota, Kota Medan, Sumatera Utara 20212", style: TextStyle(fontSize: 12),)
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
                            Container(
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
                                    child: Image(image: NetworkImage('https://images.unsplash.com/photo-1560343090-f0409e92791a?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
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
                                              Text("Sepatu hijo", style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 14)),
                                              SizedBox(height: 8),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text("1", style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 10)),
                                                  SizedBox(width: 2),
                                                  Text("pcs", style: GoogleFonts.inter(fontSize: 10)),
                                                ],
                                              ),
                                              SizedBox(height: 8),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text("Size : ", style: GoogleFonts.inter(fontSize: 10)),
                                                  SizedBox(width: 2),
                                                  Text("M", style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 10)),
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
                                            Text("241.150", style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF6366F1))),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
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
                                    child: Image(image: NetworkImage('https://images.unsplash.com/photo-1560343090-f0409e92791a?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
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
                                              Text("Sepatu hijo", style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 14)),
                                              SizedBox(height: 8),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text("2", style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 10)),
                                                  SizedBox(width: 2),
                                                  Text("pcs", style: GoogleFonts.inter(fontSize: 10)),
                                                ],
                                              ),
                                              SizedBox(height: 8),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text("Size : ", style: GoogleFonts.inter(fontSize: 10)),
                                                  SizedBox(width: 2),
                                                  Text("L", style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 10)),
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
                                            Text("241.150", style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF6366F1))),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
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
                            Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Sepatu hijo (Size : M) x 1', style: TextStyle(fontSize: 10)),
                                    Text('Rp 241.150', style: TextStyle(fontSize: 10))
                                  ],
                                )
                            ),
                            SizedBox(height: 8),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Sepatu hijo (Size : L) x 2', style: TextStyle(fontSize: 10)),
                                  Text('Rp 482.300', style: TextStyle(fontSize: 10))
                                ],
                              ),
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
                                  Text('Total', style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 10, color: Color(0xFF6366F1))),
                                  Text('Rp 723.450', style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 10, color: Color(0xFF6366F1)))
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Payment()));
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
