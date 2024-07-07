import 'package:e_commerce/product_details.dart';
import 'package:e_commerce/provider_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  DateTime? _selectedDate;
  RangeValues _priceRange = RangeValues(0, 5000000);
  String _priceRangeText = 'Rp 0 - Rp 5.000.000';

  String formatNumber(int number) {
    var format = NumberFormat('#,###', 'en_US');
    return format.format(number).replaceAll(',', '.');
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  void _updatePriceRangeText() {
    setState(() {
      _priceRangeText =
      'Rp ${formatNumber(_priceRange.start.toInt())} - Rp ${formatNumber(_priceRange.end.toInt())}';
    });
  }

  @override
  Widget build(BuildContext context) {

    String formatNumber(int number) {
      var format = NumberFormat('#,###', 'en_US');
      return format.format(number).replaceAll(',', '.');
    }

    final profileProvider = Provider.of<ProfileProvider>(context);
    final account = profileProvider.account[0];

    List<Product> filteredWishlist = account.wishlist.where((product) {
      if (_selectedDate != null && product.dateAddedToWishlist != null && !isSameDay(product.dateAddedToWishlist!, _selectedDate!)) {
        return false;
      }
      return product.price >= _priceRange.start && product.price <= _priceRange.end;
    }).toList();

    // Calculate maxPrice dynamically and update _priceRange *outside* the build method
    int maxPrice = filteredWishlist.isNotEmpty
        ? filteredWishlist.map((product) => product.price).reduce(max)
        : 5000000; // Default max if wishlist is empty

    if (_priceRange.end != maxPrice) {
      _priceRange = RangeValues(0, maxPrice.toDouble());
      _updatePriceRangeText(); // Update the text initially
    }

    Future<void> _showPriceFilterDialog(BuildContext context) async {
      final newPriceRange = await showDialog<RangeValues>(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) { // Use StatefulBuilder for live updates
              return AlertDialog(
                title: Text('Filter by Price'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(_priceRangeText), // Display the range text
                    RangeSlider(
                      values: _priceRange,
                      min: 0,
                      max: maxPrice.toDouble(),
                      divisions: 100,
                      onChanged: (RangeValues values) {
                        setState(() {
                          _priceRange = values;
                          _updatePriceRangeText(); // Update the text on change
                        });
                      },
                    ),
                  ],
                ),
                // ... (rest of your AlertDialog code)
              );
            },
          );
        },
      );

      if (newPriceRange != null) {
        setState(() {
          _priceRange = newPriceRange;
          _updatePriceRangeText(); // Update the text after applying
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            color: Color(0xFFDBDBDB),
            height: 1.0,
          ),
        ),
        title: Text('Wishlist'),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Color(0xFF31323d),
        ),
        titleSpacing: 12,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: MenuBar(
                children: [
                  SubmenuButton(
                  menuChildren: <Widget>[
                    MenuItemButton(
                      onPressed: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate ?? DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null && pickedDate != _selectedDate) {
                          setState(() {
                            _selectedDate = pickedDate;
                          });
                        }
                      },
                      child: Row(
                          children: [
                            Text(_selectedDate == null
                                ? 'Filter by Wishlisted Date'
                                : DateFormat('yyyy-MM-dd').format(_selectedDate!)),
                            if (_selectedDate != null) ...[
                              SizedBox(width: 12),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _selectedDate = null;
                                  });
                                },
                                child: Icon(Icons.clear, size: 20,),
                              ),
                            ]
                          ]
                      ),
                    ),
                    MenuItemButton(
                      onPressed: () => _showPriceFilterDialog(context),
                      child: Text('Filter by Price'),
                    ),
                  ],
                  child: const MenuAcceleratorLabel('Filter'),
                ),
                ]
              ),
            ),
          ),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: Row(
          //       children: [
          //         ElevatedButton(
          //           onPressed: () async {
          //             final pickedDate = await showDatePicker(
          //               context: context,
          //               initialDate: _selectedDate ?? DateTime.now(),
          //               firstDate: DateTime(2000),
          //               lastDate: DateTime.now(),
          //             );
          //             if (pickedDate != null && pickedDate != _selectedDate) {
          //               setState(() {
          //                 _selectedDate = pickedDate;
          //               });
          //             }
          //           },
          //           child: Row(
          //             children: [
          //               Text(_selectedDate == null
          //                   ? 'Filter by Wishlisted Date'
          //                   : DateFormat('yyyy-MM-dd').format(_selectedDate!)),
          //               if (_selectedDate != null) ...[
          //                 SizedBox(width: 12),
          //                 InkWell(
          //                   onTap: () {
          //                     setState(() {
          //                       _selectedDate = null;
          //                     });
          //                   },
          //                   child: Icon(Icons.clear, size: 20,),
          //                 ),
          //               ]
          //             ]
          //           ),
          //         ),
          //         SizedBox(width: 12,),
          //         ElevatedButton(
          //           onPressed: () => _showPriceFilterDialog(context),
          //           child: Text('Filter by Price'),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Expanded(
            child: SingleChildScrollView(
              child: GridView.count(
                childAspectRatio: 0.68,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                shrinkWrap: true,
                children: [
                  for (int i = 0; i < filteredWishlist.length; i++)
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Builder(
                                builder: (innerContext) => ProductDetails(obj: Provider.of<ProfileProvider>(innerContext).account[0].wishlist[i])
                            ),
                          ),
                        );
                      },
                      child: Container(
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
                                Tooltip(
                                  message: Provider.of<ProfileProvider>(context, listen: false).isProductInWishlist(Provider.of<ProfileProvider>(context).account[0].wishlist[i], Provider.of<ProfileProvider>(context).account[0]) ? 'Remove from Wishlist' : 'Add to Wishlist',
                                  child: InkWell(
                                    onTap: () {
                                      Provider.of<ProfileProvider>(context, listen: false).toggleWishlist(0, Provider.of<ProfileProvider>(context, listen: false).account[0].wishlist[i]);
                                      final snackBar = SnackBar(
                                        content: Text(
                                          Provider.of<ProfileProvider>(context, listen: false).isProductInWishlist(Provider.of<ProfileProvider>(context, listen: false).account[0].wishlist[i], Provider.of<ProfileProvider>(context, listen: false).account[0]) ? 'Added to Wishlist' : 'Removed from Wishlist',
                                        ),
                                      );
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    },
                                    child: Icon(
                                      Provider.of<ProfileProvider>(context, listen: false).isProductInWishlist(Provider.of<ProfileProvider>(context).account[0].wishlist[i], Provider.of<ProfileProvider>(context).account[0]) ? Icons.favorite : Icons.favorite_border, // Toggle icon based on state
                                      color: Colors.red,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Image.asset(
                                  Provider.of<ProfileProvider>(context).account[0].wishlist[i].imagePath,
                                  height: 120,
                                  width: 120,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  Provider.of<ProfileProvider>(context).account[0].wishlist[i].title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF312E81),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Rp ${formatNumber(Provider.of<ProfileProvider>(context).account[0].wishlist[i].price)}",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF312E81),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              "Wishlisted on: ${DateFormat.yMd().format(Provider.of<ProfileProvider>(context).account[0].wishlist[i].dateAddedToWishlist!)}",
                              style: TextStyle(fontSize: 12, color: Color(0xFF312E81)),
                            ),
                            SizedBox(height: 12),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
