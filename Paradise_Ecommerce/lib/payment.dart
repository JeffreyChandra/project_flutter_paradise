import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'navigationbar.dart'; 
import 'provider_data.dart'; 

class PaymentMethod extends ChangeNotifier {
  String _paymentMethod = '';

  String get paymentMethod => _paymentMethod;

  void setPaymentMethod(String method) {
    _paymentMethod = method;
    notifyListeners();
  }
}

class Payment extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const Payment({Key? key, required this.cartItems}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool isLoading = false;
  bool isSuccess = false;

  Future<void> _pay() async {
    try {
      setState(() {
        isLoading = true;
      });

      await Future.delayed(Duration(seconds: 2));

      setState(() {
        isLoading = false;
        isSuccess = true;
      });

      await Future.delayed(Duration(seconds: 1));

      final paymentModel = Provider.of<PaymentMethod>(context, listen: false);
      final selectedMethod = paymentModel.paymentMethod;

      if (selectedMethod.isNotEmpty) {
        final orderHistoryProvider = Provider.of<OrderHistoryProvider>(context, listen: false);

        for (var item in widget.cartItems) {
          final imagePath = item['imageUrl'] ?? '';
          final title = item['name'] ?? '';
          final totalPrice = (item['price'] ?? 0) * (item['quantity'] ?? 0);
          final category = item['category'] ?? '';

          orderHistoryProvider.addOrderHistoryItem(
            OrderHistoryItem(
              imagePath: imagePath,
              title: title,
              totalPrice: totalPrice,
              category: category,
              purchaseDate: DateTime.now(),
            ),
          );
        }
        Provider.of<CartProvider>(context, listen: false).hapusSemuaItemCart();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => NavBar())
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select a payment method')),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> cartItems = widget.cartItems;

    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Color(0xFFDBDBDB),
            height: 1.0,
          ),
        ),
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
          SizedBox(height: 10),
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
                  SizedBox(height: 20),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Color(0xFF6366F1),
                      ),
                    ),
                    Text(
                      'Rp ${formatCurrency(Provider.of<CartProvider>(context).calculateTotalPrice(cartItems))}',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Color(0xFF6366F1),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    TextButton(
                      onPressed: isLoading ? null : _pay,
                      child: isLoading
                          ? CircularProgressIndicator()
                          : isSuccess
                              ? Icon(Icons.check, color: Colors.green)
                              : Text(
                                  'Pay',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFF6366F1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String formatCurrency(double amount) {
    final formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0);
    return formatter.format(amount);
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
