import 'package:e_commerce/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider_data.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    TextEditingController name = TextEditingController(text: "${profileProvider.account.isNotEmpty ? profileProvider.account[0].name : ''}");

    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Color(0xFFDBDBDB),
            height: 1.0,
          ),
        ),
        title: Text('Edit Profile'),
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
            TextField(
              controller: name,
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
                labelText: "Name",
                hintStyle: TextStyle(color: Colors.grey),
                floatingLabelStyle: TextStyle(color: Colors.black),
              ),
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
