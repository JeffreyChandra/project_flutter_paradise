import 'package:e_commerce/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int ukuran = 0;

  @override
  Widget build(BuildContext context) {
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
                    Image(image: NetworkImage('https://images.unsplash.com/photo-1560343090-f0409e92791a?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
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
                              Column(
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
                                      child: Text("Sepatu", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white)),
                                    ),
                                  ),
                                  SizedBox(height: 8,),
                                  Text('Sepatu hijo', style: GoogleFonts.inter(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),)
                                ],
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
                                      Text('241.1k', style: GoogleFonts.inter(
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
                                      Text('241.150', style: GoogleFonts.inter(
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
                                Text('12 pcs', style: GoogleFonts.inter(
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
                                    Text("Stok tersisa", style: TextStyle(
                                      color: Color(0xFF31323D),
                                      fontSize: 12,
                                    ))
                                  ],
                                ),
                                Text('2 pcs', style: GoogleFonts.inter(
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
                                    Text('Ukuran', style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Color(0xFF31323D),
                                    ),),
                                    SizedBox(height: 12,),
                                    Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                                height: 40,
                                                padding: EdgeInsets.symmetric(horizontal: 12),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFE4E4E4),
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(4)
                                                    ),
                                                    border: Border.all(
                                                      color: Color(0xFFDBDBDB),
                                                      width: 1.0,
                                                    )
                                                ),
                                                child : Text('37', style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFFB1B1B1),
                                                ))
                                            ),
                                          ),
                                          SizedBox(width: 12),
                                          Expanded(
                                            child: ChoiceChip(
                                              showCheckmark: false,
                                              padding: EdgeInsets.all(0),
                                              label: Container(
                                                  height: 40,
                                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                                  alignment: Alignment.center,
                                                  child : Text('38', style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: ukuran == 38 ? Colors.white : Color(0xFF31323D),
                                                  ))
                                              ),
                                              selected: ukuran == 38,
                                              onSelected: (bool selected) {
                                                setState(() {
                                                  if (ukuran == 38) {
                                                    ukuran = 0; // deselect the chip
                                                  } else {
                                                    ukuran = 38; // select the chip
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
                                            ),
                                          ),
                                          SizedBox(width: 12),
                                          Expanded(
                                            child: ChoiceChip(
                                              showCheckmark: false,
                                              padding: EdgeInsets.all(0),
                                              label: Container(
                                                  height: 40,
                                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                                  alignment: Alignment.center,
                                                  child : Text('39', style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: ukuran == 39 ? Colors.white : Color(0xFF31323D),
                                                  ))
                                              ),
                                              selected: ukuran == 39,
                                              onSelected: (bool selected) {
                                                setState(() {
                                                  if (ukuran == 39) {
                                                    ukuran = 0; // deselect the chip
                                                  } else {
                                                    ukuran = 39; // select the chip
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
                                            ),
                                          ),
                                          SizedBox(width: 12),
                                          Expanded(
                                            child: ChoiceChip(
                                              showCheckmark: false,
                                              padding: EdgeInsets.all(0),
                                              label: Container(
                                                  height: 40,
                                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                                  alignment: Alignment.center,
                                                  child : Text('40', style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: ukuran == 40 ? Colors.white : Color(0xFF31323D),
                                                  ))
                                              ),
                                              selected: ukuran == 40,
                                              onSelected: (bool selected) {
                                                setState(() {
                                                  if (ukuran == 40) {
                                                    ukuran = 0; // deselect the chip
                                                  } else {
                                                    ukuran = 40; // select the chip
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
                                            ),
                                          ),
                                        ]
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                        children: [
                                          Expanded(
                                            child: ChoiceChip(
                                              showCheckmark: false,
                                              padding: EdgeInsets.all(0),
                                              label: Container(
                                                  height: 40,
                                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                                  alignment: Alignment.center,
                                                  child : Text('41', style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: ukuran == 41 ? Colors.white : Color(0xFF31323D),
                                                  ))
                                              ),
                                              selected: ukuran == 41,
                                              onSelected: (bool selected) {
                                                setState(() {
                                                  if (ukuran == 41) {
                                                    ukuran = 0; // deselect the chip
                                                  } else {
                                                    ukuran = 41; // select the chip
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
                                            ),
                                          ),
                                          SizedBox(width: 12),
                                          Expanded(
                                            child: ChoiceChip(
                                              showCheckmark: false,
                                              padding: EdgeInsets.all(0),
                                              label: Container(
                                                  height: 40,
                                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                                  alignment: Alignment.center,
                                                  child : Text('42', style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: ukuran == 42 ? Colors.white : Color(0xFF31323D),
                                                  ))
                                              ),
                                              selected: ukuran == 42,
                                              onSelected: (bool selected) {
                                                setState(() {
                                                  if (ukuran == 42) {
                                                    ukuran = 0; // deselect the chip
                                                  } else {
                                                    ukuran = 42; // select the chip
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
                                            ),
                                          ),
                                          SizedBox(width: 12),
                                          Expanded(
                                            child: ChoiceChip(
                                              showCheckmark: false,
                                              padding: EdgeInsets.all(0),
                                              label: Container(
                                                  height: 40,
                                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                                  alignment: Alignment.center,
                                                  child : Text('43', style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: ukuran == 43 ? Colors.white : Color(0xFF31323D),
                                                  ))
                                              ),
                                              selected: ukuran == 43,
                                              onSelected: (bool selected) {
                                                setState(() {
                                                  if (ukuran == 43) {
                                                    ukuran = 0; // deselect the chip
                                                  } else {
                                                    ukuran = 43; // select the chip
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
                                            ),
                                          ),
                                          SizedBox(width: 12),
                                          Expanded(child: Text('')),
                                        ]
                                    ),
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
                                Text('Lorem ipsum dolor sit amet consectetur. Sit a aliquam sagittis vel. Proin netus faucibus ullamcorper sit tristique. Odio non lorem sed massa auctor senectus. Proin condimentum fermentum mauris sagittis etiam molestie id. Semper sit facilisis orci scelerisque. Massa lacinia ut cursus ultrices etiam faucibus eu. Nibh ut aliquam volutpat amet praesent justo scelerisque ac. Nisl et donec amet non. Ultrices dignissim rutrum egestas curabitur ullamcorper elit. Dolor ut ullamcorper odio in id eu. Posuere eget phasellus mauris condimentum quisque tincidunt consectetur enim vitae. Mattis sit facilisis habitant sodales. Lobortis consequat sit vitae netus felis augue imperdiet hendrerit aliquet. Felis eleifend justo aenean tortor libero id proin in. Urna vulputate tortor purus dui aenean ornare cras habitasse. Nisi vitae nunc nibh risus vitae. Viverra eget facilisis aliquam egestas augue fermentum. Et venenatis sed velit vitae massa gravida lacus eget enim. Parturient pretium est cursus convallis posuere turpis laoreet luctus. Nisl tempor blandit velit pulvinar massa. Placerat pretium lectus cras donec purus gravida neque tristique in. Rhoncus ultrices nibh cum aliquam nullam sit pellentesque faucibus.',
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
