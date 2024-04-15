import 'package:e_commerce/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider_data.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({super.key});

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
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
          title: Text('Edit Password'),
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xFF31323d),
          ),
          titleSpacing: 12,
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    TextField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF6366F1), width: 1)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF6366F1))
                        ),
                        labelText: "Old Password",
                        hintText: "Fill your old password",
                        hintStyle: TextStyle(color: Colors.grey),
                        floatingLabelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 24),
                    TextField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF6366F1), width: 1)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF6366F1))
                        ),
                        labelText: "New Password",
                        hintText: "Fill your new password",
                        hintStyle: TextStyle(color: Colors.grey),
                        floatingLabelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 24),
                    TextField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF6366F1), width: 1)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF6366F1))
                        ),
                        labelText: "Confirm New Password",
                        hintText: "Fill again your new password",
                        hintStyle: TextStyle(color: Colors.grey),
                        floatingLabelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width,
                    child: TextButton(onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Profile()));
                    }, child: Text('Save',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFF6366F1),
                      ),
                    )
                )
              ],
            )
        )
    );
  }
}
