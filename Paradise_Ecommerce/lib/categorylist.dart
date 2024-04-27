import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class Category {
  String name;
  String picFile;

  Category({
    this.name = '',
    this.picFile = '',
  });
}

class _CategoryListState extends State<CategoryList> {
  var PrimaryColor = Color.fromARGB(255, 129, 141, 248);
  List<Category> categories = [
    Category(name: 'Handphone', picFile: '../assets/images/category/handphone.png'),
    Category(name: 'Pria', picFile: '../assets/images/category/pakaianpria.png'),
    Category(name: 'Wanita', picFile: '../assets/images/category/pakaianwanita.jpg'),
    Category(name: 'Laptop', picFile: '../assets/images/category/laptop.jpg'),
    Category(name: 'Komputer', picFile: '../assets/images/category/komputer.jpg'),
    Category(name: 'Anak-anak', picFile: '../assets/images/category/kids.jpg'),
    Category(name: 'Game', picFile: '../assets/images/category/game.jpg'),
    Category(name: 'Sepatu', picFile: '../assets/images/category/motor.jpg'),
    Category(name: 'Aksesoris', picFile: '../assets/images/category/pakaianpria.png'),
  ];

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Category", style: TextStyle(fontWeight: FontWeight.bold),),
    //   ),
    //   body: SingleChildScrollView(
    //     scrollDirection: Axis.vertical,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Padding(padding: EdgeInsets.all(20),),
    //         ExpansionTile(
    //           title: Text("Man"),
    //           childrenPadding: EdgeInsets.only(left: 50),
    //           leading: FaIcon(FontAwesomeIcons.userTie),
    //           children: [
    //             ListTile(
    //               title: Text("All Clothing"),
    //               onTap: () {},
    //             ),
    //             ListTile(
    //               title: Text("All Clothing"),
    //               onTap: () {},
    //             ),
    //             ListTile(
    //               title: Text("All Clothing"),
    //               onTap: () {},
    //             ),
    //           ],
    //           ),
    //           ExpansionTile(
    //           title: Text("On Sale"),
    //           childrenPadding: EdgeInsets.only(left: 50),
    //           leading: Icon(Icons.shopping_bag_rounded),
    //           children: [
    //             ListTile(
    //               title: Text("All Clothing"),
    //               onTap: () {},
    //             ),
    //             ListTile(
    //               title: Text("All Clothing"),
    //               onTap: () {},
    //             ),
    //             ListTile(
    //               title: Text("All Clothing"),
    //               onTap: () {},
    //             ),
    //           ],
    //           ),
    //           ExpansionTile(
    //           title: Text("On Sale"),
    //           childrenPadding: EdgeInsets.only(left: 50),
    //           leading: Icon(Icons.shopping_bag_rounded),
    //           children: [
    //             ListTile(
    //               title: Text("All Clothing"),
    //               onTap: () {},
    //             ),
    //             ListTile(
    //               title: Text("All Clothing"),
    //               onTap: () {},
    //             ),
    //             ListTile(
    //               title: Text("All Clothing"),
    //               onTap: () {},
    //             ),
    //           ],
    //           )
    //       ],
    //     ),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text("Category",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(
                  categories.length,
                  (index) => InkWell(
                    onTap: () {
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Image.network(
                                categories[index].picFile,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              color: PrimaryColor,
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                categories[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}