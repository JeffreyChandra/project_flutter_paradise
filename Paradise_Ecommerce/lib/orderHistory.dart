import 'package:flutter/material.dart';
import 'package:e_commerce/provider_data.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    const PrimaryColor2 = Color.fromARGB(50, 129, 141, 248);
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            color: Color(0xFFDBDBDB),
            height: 1.0,
          ),
        ),
        title: Text('Order History'),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Color(0xFF31323d),
        ),
        titleSpacing: 12,
      ),
      body: Consumer<OrderHistoryProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            padding: const EdgeInsets.all(15.0),
            itemCount: provider.orderHistoryItems.length,
            itemBuilder: (context, index) {
              final item = provider.orderHistoryItems[index];
              return Card(
                color: PrimaryColor2,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(15.0),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      item.imagePath,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.0),
                      Text(item.category),
                      SizedBox(height: 5.0),
                      Text(
                        'Total Price: ${formatCurrency(item.totalPrice)}',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Purchase Date: ${DateFormat.yMMMd().format(item.purchaseDate)}',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

  String formatCurrency(int amount) {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0);
    return formatter.format(amount);
  }
