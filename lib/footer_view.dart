import 'package:flutter/material.dart';
import 'package:shop_test_app/item.dart';

class FooterView extends StatelessWidget {
  final List<Item> items;
  const FooterView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF802E2E),
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.where((element) => element.quantity > 0).length,
                itemBuilder: (context, index) {
                  final newItem = items.where((element) => element.quantity > 0).toList();
                  return Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(
                              newItem[index].name,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          Text(
                            "Qty : ${newItem[index].quantity}",
                            style: const TextStyle(color: Colors.white),
                          ),
                          const Expanded(child: SizedBox()),
                          SizedBox(
                            width: 120,
                            child: Text(
                              "Amount : ${(newItem[index].quantity * newItem[index].price).toStringAsFixed(2)}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 1,
                        color: Colors.white,
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Qty : ${getTotalQuantity()}",
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  "Total Amount : ${getTotalAmount().toStringAsFixed(2)}",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  int getTotalQuantity() {
    int total = 0;
    for (var x in items) {
      total = total + x.quantity;
    }
    return total;
  }

  double getTotalAmount() {
    double total = 0;
    for (var x in items) {
      total = total + (x.price * x.quantity);
    }
    return total;
  }
}
