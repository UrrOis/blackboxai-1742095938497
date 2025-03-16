import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  final Menu menu;

  OrderPage({required this.menu});

  @override
  Widget build(BuildContext context) {
    final TextEditingController quantityController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Detail Order')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(menu.name),
            Text('Harga: Rp ${menu.price}'),
            TextField(
              controller: quantityController,
              decoration: InputDecoration(labelText: 'Masukkan Jumlah'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                // Calculate total price
                int quantity = int.parse(quantityController.text);
                int totalPrice = menu.price * quantity;
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Total Harga'),
                    content: Text('Total Harga: Rp $totalPrice'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Hitung'),
            ),
          ],
        ),
      ),
    );
  }
}
