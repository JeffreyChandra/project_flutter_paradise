import 'package:e_commerce/provider_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../product_details.dart';
import 'package:intl/intl.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String formatNumber(int number) {
      var format = NumberFormat('#,###', 'en_US');
      return format.format(number).replaceAll(',', '.');
    }

    return Column(
      children: [
        GridView.count(
          childAspectRatio: 0.68,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          shrinkWrap: true,
          children: [
            for (int i = 0; i < Provider.of<ProductProvider>(context).products.length; i++)
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Builder(
                        builder: (innerContext) => ProductDetails(obj: Provider.of<ProductProvider>(innerContext).products[i])
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
                            message: Provider.of<ProfileProvider>(context, listen: false).isProductInWishlist(Provider.of<ProductProvider>(context).products[i], Provider.of<ProfileProvider>(context).account[0]) ? 'Remove from Wishlist' : 'Add to Wishlist',
                            child: InkWell(
                              onTap: () {
                                Provider.of<ProfileProvider>(context, listen: false).toggleWishlist(0, Provider.of<ProductProvider>(context, listen: false).products[i]);
                                final snackBar = SnackBar(
                                  content: Text(
                                    Provider.of<ProfileProvider>(context, listen: false).isProductInWishlist(Provider.of<ProductProvider>(context, listen: false).products[i], Provider.of<ProfileProvider>(context, listen: false).account[0]) ? 'Added to Wishlist' : 'Removed from Wishlist',
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              },
                              child: Icon(
                                Provider.of<ProfileProvider>(context, listen: false).isProductInWishlist(Provider.of<ProductProvider>(context).products[i], Provider.of<ProfileProvider>(context).account[0]) ? Icons.favorite : Icons.favorite_border,
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
                            'assets/produk/${i + 1}.jpg',
                            height: 120,
                            width: 120,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(bottom: 8),
                          alignment: Alignment.center,
                          child: Text(
                            Provider.of<ProductProvider>(context).products[i].title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF312E81),
                                fontWeight: FontWeight.bold),
                          ),
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
                          "Rp ${formatNumber(Provider.of<ProductProvider>(context).products[i].price)}",
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
              ),
          ],
        ),
      ],
    );
  }
}
