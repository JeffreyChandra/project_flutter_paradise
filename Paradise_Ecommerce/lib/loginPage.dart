import 'package:e_commerce/home.dart';
import 'package:e_commerce/register.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const PrimaryColor = Color.fromARGB(255, 129, 141, 248);
    const PrimaryColor2 = Color.fromARGB(50, 129, 141, 248);


    // double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.2);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -70,
            left: -25,
            child: Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: PrimaryColor,
              ),
          )),
          Positioned(
            top: 50,
            right: -30,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: PrimaryColor,
              ),
          )),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: size.width,
                height: defaultLoginSize,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome back",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black
                      ),
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    Image.asset(
                        "../assets/images/burung.jpeg",scale: 1.3,fit: BoxFit.contain,),

                    //Username
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: PrimaryColor2),
                      child: TextField(
                        cursorColor: PrimaryColor,
                        decoration: InputDecoration(
                            focusColor: Colors.blue,
                            icon: Icon(
                              Icons.account_box,
                              color: PrimaryColor,
                            ),
                            hintText: "Username",
                            border: InputBorder.none),
                      ),
                    ),

                    //Password
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: PrimaryColor2),
                      child: TextField(
                        
                        cursorColor: PrimaryColor,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock,
                              color: PrimaryColor,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                            ),
                            hintText: "Password",
                            border: InputBorder.none),
                        obscureText: isObscure,
                      ),
                    ),

                    //LOGIN BUTTON
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                        },
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: size.width * 0.8,
                          height: size.width * 0.14,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: PrimaryColor,
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14),
                          alignment: Alignment.center,
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: size.height * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100)),
                color: PrimaryColor,
              ),
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: Text("Don't have an account? Sing up"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
