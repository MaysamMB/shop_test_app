import 'package:flutter/material.dart';
import 'package:shop_test_app/item.dart';

class CustomItem extends StatefulWidget {
  final Item item;
  final VoidCallback onItemchange;
  const CustomItem({super.key, required this.item, required this.onItemchange});

  @override
  State<CustomItem> createState() => _CustomItemState();
}

class _CustomItemState extends State<CustomItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        color: Colors.grey[300],
        height: 75,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(widget.item.image),
                backgroundColor: Colors.transparent,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Text(
                      "${widget.item.price}",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const Text(
                      "JD",
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            widget.item.quantity == 0
                ? IconButton(
                    onPressed: () {
                      widget.item.quantity = 1;
                      widget.onItemchange();
                      setState(() {});
                    },
                    icon: const Icon(Icons.shopify_sharp))
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              widget.item.quantity = widget.item.quantity - 1;
                              widget.onItemchange();
                              setState(() {});
                            },
                            icon: const Icon(Icons.remove),
                          ),
                          Text(
                            "${widget.item.quantity}",
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          IconButton(
                            onPressed: () {
                              widget.item.quantity = widget.item.quantity + 1;
                              widget.onItemchange();
                              setState(() {});
                            },
                            icon: const Icon(Icons.add),
                          )
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
