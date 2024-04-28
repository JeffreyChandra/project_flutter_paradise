import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment", style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Color(0xFF31323d),),
      ),),

      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB( 15, 0, 15, 0),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("E-Wallet",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 10,),

            ElevatedButton(onPressed: () {}, 
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              ),
              side: BorderSide(
                width: 0.5,
                ),
                padding: EdgeInsets.all(20)
            ),
            child: Row(
              children: [
                Image.asset("../assets/images/payment/OVO.png", 
                  fit: BoxFit.contain,
                  width:MediaQuery.of(context).size.width * 0.15,
                  // height: MediaQuery.of(context).size.height * 0,
                  ),
                SizedBox(width: 20,),
                Text("OVO", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),),
              ],
            )),

            SizedBox(height: 10,),

        
            ElevatedButton(onPressed: () {}, 
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              ),
              side: BorderSide(
                width: 0.5,
                ),
                padding: EdgeInsets.all(20)
            ),
            child: Row(
              children: [
                Image.asset("../assets/images/payment/Gopay_logo.png", 
                  fit: BoxFit.contain,
                  width:MediaQuery.of(context).size.width * 0.15,
                  ),
                SizedBox(width: 20,),
                Text("GoPay", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),),

                
              ],
            )),

            SizedBox(height: 20),

            Text("Rekening",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 10,),

            ElevatedButton(onPressed: () {}, 
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              ),
              side: BorderSide(
                width: 0.5,
                ),
                padding: EdgeInsets.all(20)
            ),
            child: Row(
              children: [
                Image.asset("../assets/images/payment/BCA.png", 
                  fit: BoxFit.contain,
                  width:MediaQuery.of(context).size.width * 0.15,
                  ),
                SizedBox(width: 20,),
                Text("BCA", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),),
              ],
            )),

            SizedBox(height: 10,),

            ElevatedButton(onPressed: () {}, 
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              ),
              side: BorderSide(
                width: 0.5,
                ),
                padding: EdgeInsets.all(20)
            ),
            child: Row(
              children: [
                Image.asset("../assets/images/payment/Gopay_logo.png", 
                  fit: BoxFit.contain,
                  width:MediaQuery.of(context).size.width * 0.15,
                  ),
                SizedBox(width: 20,),
                Text("GoPay", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),),

                
              ],
            )),
          ],
        ),
      ),
    );
  }
}