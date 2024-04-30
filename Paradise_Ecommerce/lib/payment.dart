import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// Buat model untuk menyimpan payment method
class PaymentMethod extends ChangeNotifier {
  String _paymentMethod = '';

  String get paymentMethod => _paymentMethod;

  void setPaymentMethod(String method) {
    _paymentMethod = method;
    notifyListeners();
  }
}

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Color(0xFFDBDBDB),
            height: 1.0,
          ),),
        title: Text(
          "Payment",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xFF31323d),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 70),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "E-Wallet",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 10),
                  PaymentButton(
                    imagePath: "../assets/images/payment/OVO.png",
                    paymentMethod: 'OVO',
                  ),
                  SizedBox(height: 10),
                  PaymentButton(
                    imagePath: "../assets/images/payment/Gopay_logo.png",
                    paymentMethod: 'GoPay',
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Bank",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 10),
                  PaymentButton(
                    imagePath: "../assets/images/payment/BCA.png",
                    paymentMethod: 'BCA',
                  ),
                  SizedBox(height: 10),
                  PaymentButton(
                    imagePath: "../assets/images/payment/mandiri.png",
                    paymentMethod: 'Mandiri',
                  ),
                  SizedBox(height: 20), // Add some spacing
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: ButtonTheme(
                    child: TextButton(
                      onPressed: () {
                        final paymentModel =
                            Provider.of<PaymentMethod>(context, listen: false);
                        final selectedMethod = paymentModel.paymentMethod;
                        if (selectedMethod.isNotEmpty) {
                          print('Melakukan pembayaran dengan $selectedMethod');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'Silakan pilih metode pembayaran terlebih dahulu'),
                          ));
                        }
                      },
                      child: Text('Pay',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          )),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFF6366F1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentButton extends StatelessWidget {
  final String imagePath;
  final String paymentMethod;

  const PaymentButton({
    required this.imagePath,
    required this.paymentMethod,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paymentModel = Provider.of<PaymentMethod>(context);

    return ElevatedButton(
      onPressed: () {
        paymentModel.setPaymentMethod(paymentMethod);
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        backgroundColor: paymentModel.paymentMethod == paymentMethod
            ? Color.fromARGB(255, 129, 141, 248)
            : null,
        side: BorderSide(
          width: 0.5,
        ),
        padding: EdgeInsets.all(25),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.contain,
            width: MediaQuery.of(context).size.width * 0.15,
          ),
          SizedBox(width: 20),
          Text(
            paymentMethod,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: paymentModel.paymentMethod == paymentMethod
                  ? Colors.white
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
