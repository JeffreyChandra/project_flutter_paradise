import 'package:e_commerce/home.dart';
import 'package:e_commerce/loginPage.dart';
import 'package:e_commerce/provider_data.dart';
import 'package:e_commerce/register_ktp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool isObscure = true;

  // Data KTP
  var nik = "";
  var tglLahir = "";
  var gender = "";
  var provinsi = "";
  var kota = "";
  var kecamatan = "";
  var kode_pos = "";

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
              right: -40,
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
                      "Create your account",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Image.asset(
                      "assets/images/burung.jpeg",
                      scale: 1.3,
                      fit: BoxFit.contain,
                    ),

                    //Username
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: PrimaryColor2),
                      child: TextField(
                        controller: _username,
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

                    //Email
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: PrimaryColor2),
                      child: TextField(
                        controller: _email,
                        cursorColor: PrimaryColor,
                        decoration: InputDecoration(
                            focusColor: Colors.blue,
                            icon: Icon(
                              Icons.email,
                              color: PrimaryColor,
                            ),
                            hintText: "Email",
                            border: InputBorder.none),
                      ),
                    ),

                    //Password
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: PrimaryColor2),
                      child: TextField(
                        controller: _password,
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

                    InkWell(
                      onTap: () async {
                        var result = null;
                        if (nik == "") {
                          result = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterKTP()),
                          );
                        }

                        if (result != null) {
                          Map<String, dynamic> ktpData = result;

                          setState(() {
                            nik = ktpData['nik'];
                            tglLahir = ktpData['tglLahir'];
                            gender = ktpData['gender'];
                            provinsi = ktpData['provinsi'];
                            kota = ktpData['kota'];
                            kecamatan = ktpData['kecamatan'];
                            kode_pos = ktpData['kode_pos'];
                          });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              nik == "" ? Text('Verifikasi data KTP disini', style: TextStyle(decoration: TextDecoration.underline),) : Text('Data KTP sudah divalidasi', style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Color(0xFF6366F1))),
                              nik == "" ? Icon(Icons.arrow_circle_right_rounded) : Icon(Icons.verified_user_rounded, color: Colors.green,)
                            ],
                          )
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    //REGISTER BUTTON
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_username.text.isEmpty ||
                              _email.text.isEmpty ||
                              _password.text.isEmpty ||
                              nik == "") {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Register Failed"),
                                  content: Text(
                                      "Username, email, password, or KTP data can't be empty. Please try again."),
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
                            final profileProvider =
                                Provider.of<ProfileProvider>(context,
                                    listen: false);
                            final newAccount = Account(
                              name: _username.text,
                              email: _email.text,
                              password: _password.text,
                              nik : nik,
                              tglLahir : tglLahir,
                              gender : gender,
                              provinsi : provinsi,
                              kota : kota,
                              kecamatan : kecamatan,
                              kode_pos : kode_pos,
                            );
                            profileProvider.addAccount(newAccount);

                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Registration Successful"),
                                  content: Text(
                                      "Your account has been successfully registered."),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()));
                                      },
                                      child: Text("OK"),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
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
                            "REGISTER",
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text("Already have an account? Sign in"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
