import 'package:e_commerce/categoryhp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/navigationbar.dart'; // Sesuaikan dengan import yang sesuai
import 'package:e_commerce/provider_data.dart'; // Sesuaikan dengan import yang sesuai
import 'package:e_commerce/register.dart'; // Sesuaikan dengan import yang sesuai

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Indikator loading
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscure = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    Size size = MediaQuery.of(context).size;
    const PrimaryColor = Color.fromARGB(255, 129, 141, 248);
    const PrimaryColor2 = Color.fromARGB(50, 129, 141, 248);

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
            ),
          ),
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
            ),
          ),
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
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Paradise",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: PrimaryColor2,
                      ),
                      child: TextField(
                        controller: usernameController,
                        cursorColor: PrimaryColor,
                        decoration: InputDecoration(
                          focusColor: Colors.blue,
                          icon: Icon(
                            Icons.account_box,
                            color: PrimaryColor,
                          ),
                          hintText: "Username",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: PrimaryColor2,
                      ),
                      child: TextField(
                        controller: passwordController,
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
                          border: InputBorder.none,
                        ),
                        obscureText: isObscure,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(vertical: 5),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(PrimaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        onPressed: () {
                          String enteredUsername = usernameController.text;
                          String enteredPassword = passwordController.text;

                          if (enteredUsername.isEmpty ||
                              enteredPassword.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Login Failed"),
                                  content: Text(
                                      "Username or password cannot be empty. Please try again."),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("OK"),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            bool isValidUser = profileProvider.account.any(
                              (account) =>
                                  account.name == enteredUsername &&
                                  account.password == enteredPassword,
                            );
                            if (isValidUser) {
                              navigateToHome();
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Login Failed"),
                                    content: Text(
                                        "Incorrect username or password. Please try again."),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          }
                        },
                        child: Container(
                          width: size.width * 0.8,
                          height: size.width * 0.14,
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
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => NavBar()),
                        );
                      },
                      child: Text("Shortcut login, capek jir regis mulu"),
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
                  topRight: Radius.circular(100),
                ),
                color: PrimaryColor,
              ),
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("Don't have an account?"),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoadingScreen()),
    );

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }
}
