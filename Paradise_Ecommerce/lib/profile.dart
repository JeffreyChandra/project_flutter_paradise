import 'package:e_commerce/edit_password.dart';
import 'package:e_commerce/edit_profile.dart';
import 'package:e_commerce/home.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
        title: Text('Profile'),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Color(0xFF31323d),
        ),
        titleSpacing: 12,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color(0xFFDBDBDB),
                    )
                  )
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProfile()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage("assets/images/pp-placeholder.webp"),
                              radius: 30,
                            ),
                            SizedBox(width: 24),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Jane Doe',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF31323d),
                                  ),),
                                SizedBox(height: 4),
                                Text('Edit profile',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF31323d),
                                  ),)
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 12),
                        child: Icon(Icons.navigate_next, color: Color(0xFFB1B1B1))
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditPassword()));
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: Color(0xFFDBDBDB),
                          )
                      )
                  ),
                  padding: EdgeInsets.all(12),
                  child: Text("Change Password",
                    style: TextStyle(
                      color: Color(0xFF31323d),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),),
                )
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Color(0xFFDBDBDB),
                        )
                    )
                ),
                padding: EdgeInsets.all(12),
                child: Text("Orders",
                style: TextStyle(
                  color: Color(0xFF31323d),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),),
              )
            ),
            InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: Color(0xFFDBDBDB),
                          )
                      )
                  ),
                  padding: EdgeInsets.all(12),
                  child: Text("Wishlist",
                    style: TextStyle(
                      color: Color(0xFF31323d),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),),
                )
            ),
            InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: Color(0xFFDBDBDB),
                          )
                      )
                  ),
                  padding: EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Log Out",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),),
                      Icon(Icons.logout, color: Colors.red, size: 16)
                    ]
                  ),
                )
            )
          ]
        ),
      )
    );
  }
}
