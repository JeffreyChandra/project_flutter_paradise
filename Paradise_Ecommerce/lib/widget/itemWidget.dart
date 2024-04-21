import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key});

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
            for (int i = 1; i < 9; i++)
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
                          'assets/images/burung.jpeg',
                          height: 120,
                          width: 120,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 8),
                      alignment: Alignment.center,
                      child: Text(
                        "Product Title",
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
                        "Rp. 500.000",
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
