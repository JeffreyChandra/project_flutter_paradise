import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0).copyWith(bottom: 0),
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.search, size: 15, color: Colors.grey),
                              Text(
                                "Cari di sini",
                                style:
                                TextStyle(color: Colors.grey, fontSize: 10),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        child: Icon(Icons.person))
                  ],
                ),
              ),
            ),
            Divider()
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                children: [
                                  SizedBox(height: 60),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 14,
                                      ),
                                      Text(
                                        "Dikirim ke ",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        "Medan",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        size: 15,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 40)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                      Positioned(
                        top: 90,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 90,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              MenuButton(
                                  "assets/category-icon/official-store.png",
                                  label: "Official Store"),
                              MenuButton("assets/category-icon/lihat-semua.png",
                                  label: "Lihat Semua"),
                              MenuButton(
                                  "assets/category-icon/rumah-tangga.png",
                                  label: "Rumah Tangga"),
                              MenuButton("assets/category-icon/topup.png",
                                  label: "Top Up & Tagihan"),
                              MenuButton("assets/category-icon/elektronik.png",
                                  label: "Elektronik"),
                              MenuButton("assets/category-icon/fashion.png",
                                  label: "Fashion-Pria"),
                              MenuButton(
                                  "assets/category-icon/rumah-tangga.png",
                                  label: "Rumah Tangga"),
                              MenuButton("assets/category-icon/keuangan.png",
                                  label: "Keuangan"),
                              MenuButton("assets/category-icon/travel.png",
                                  label: "Travel & Entertainment"),
                              MenuButton("assets/category-icon/elektronik.png",
                                  label: "Elektronik"),
                              MenuButton(
                                  "assets/category-icon/komputer-dan-laptop.png",
                                  label: "Komputer"),
                              // MenuButton(label: "Official Store",icon: Icon(Icons.description),),
                              // MenuButton(label: "Lihat Semua", icon: Icon(Icons.add_business),),
                              // MenuButton(label: "Rumah Tangga",icon: Icon(Icons.map),),
                              // MenuButton(label: "Top Up & Tagihan",icon: Icon(Icons.safety_divider),),
                              // MenuButton(label: "Kesehatan",icon: Icon(Icons.expand),),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String? label;
  final String imageLocation;
  const MenuButton(this.imageLocation, {Key? key, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 50,
      child: Column(
        children: [
          Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
              ),
              child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(imageLocation))),
          Text(
            "$label",
            style: TextStyle(color: Colors.black, fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}