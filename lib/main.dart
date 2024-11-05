import 'package:flutter/material.dart';
import 'item_data.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int total = 0;
  List<Map<String, dynamic>> receiptItems = [];

  void reset() {
    setState(() {
      for (var item in items) {
        item.quantity.text = '0';
      }
      receiptItems.clear();
      total = 0;
    });
  }

  void printReceipt() {
    setState(() {
      int newTotal = 0;
      receiptItems.clear();
      for (var item in items) {
        int qty = int.tryParse(item.quantity.text) ?? 0;
        if (qty > 0) {
          int subtotal = item.price * qty;
          newTotal += subtotal;
          receiptItems.add({
            'name': item.name,
            'price': item.price,
            'quantity': qty,
            'subtotal': subtotal,
          });
        }
      }
      total = newTotal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Toko Komputer'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: items.map((item) {
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text('Harga: ${item.price}'),
                    trailing: Container(
                      width: 50,
                      child: TextField(
                        controller: item.quantity,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(hintText: '0'),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: reset,
                  child: Text('Reset'),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                ),
                ElevatedButton(
                  onPressed: printReceipt,
                  child: Text('Cetak Struk'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: receiptItems.map((item) {
                  return ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Text('${item['name']}'),
                    subtitle: Text('${item['price']} x ${item['quantity']}'),
                    trailing: Text('${item['subtotal']}'),
                  );
                }).toList(),
              ),
            ),
            Container(
              color: Colors.blue[100],
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$total',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
