import 'package:e_commerce/home.dart';
import 'package:e_commerce/register.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  String errorMessage = '';
  String errorMessage2 = '';
  bool isObscure = true; 
  
  @override
  void dispose() {
    t1.dispose();
    t2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(30),
              child: const Image(
                image: AssetImage("../assets/ParadiseLogo.png"),
                fit: BoxFit.fill,
                width: 250,
                height: 50,
                
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                onChanged: (_) {
                  setState(() {
                    errorMessage2 = '';
                  });
                },
                controller: t2,
                decoration: InputDecoration(
                  labelText: "Username",
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 129, 141, 248)),
                  hintText: "Masukkan Username Disinii",
                  hintStyle: TextStyle(color: Color.fromARGB(255, 129, 141, 248)),
                  errorText: errorMessage2.isNotEmpty ? errorMessage2 : null,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Color.fromARGB(255, 99, 101, 241),
                    width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Color.fromARGB(255, 99, 101, 241),width: 2),
                  ),
                
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                onChanged: (_) {
                  setState(() {
                    errorMessage = '';
                  });
                },
                controller: t1,
                decoration: InputDecoration(
                  
                  labelText: "Password",
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 129, 141, 248)),
                  hintText: "Masukkan Password Disini",
                  suffixIcon: IconButton(
                    icon: Icon(
                      isObscure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ), onPressed: () {  
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                  ),
                  
                  hintStyle: TextStyle(color: Color.fromARGB(255, 129, 141, 248)),
                  errorText: errorMessage.isNotEmpty ? errorMessage : null,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Color.fromARGB(255, 99, 101, 241),
                    width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Color.fromARGB(255, 99, 101, 241),width: 2),
                  ),
                ),
                obscureText: isObscure,
              ),
            ),
            Container(
              height: 60,
              width: 400,
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  if (t2.text != "Jeffrey") {
                    setState(() {
                      errorMessage2 = "Username Salah";
                      t2.clear();
                    });
                  } else if (t1.text != "test") {
                    setState(() {
                      errorMessage = "Password Salah";
                      t1.clear();
                    });
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 129, 141, 248),
                  foregroundColor: Color.fromARGB(230, 49, 46, 129),
                ),
                child: const Text("LOGIN",style: TextStyle(
                  fontWeight: FontWeight.w700
                ),),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?", style: TextStyle(
                    fontWeight: FontWeight.w600
                  ),),
                  SizedBox(width: 8),
                  InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const RegisterPage()),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 129, 141, 248)),
                    ),
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
