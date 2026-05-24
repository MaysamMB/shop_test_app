import 'package:flutter/material.dart';
import 'package:shop_test_app/custom_items.dart';
import 'package:shop_test_app/footer_view.dart';
import 'package:shop_test_app/item.dart';

List<Item> items = [
  Item(
      name: "Dragon Fruit",
      image: "https://fruits.today/image/catalog/product/1/Pitahaja_smoczy_owoc_1szt.jpg",
      price: 5.00,
      type: ItemType.fruit),
  Item(
      name: "Banana",
      image:
          "https://media.istockphoto.com/id/157375066/photo/banana.jpg?s=612x612&w=0&k=20&c=3v7si4IY-VZRIiUnG2fUodH2kIF4ipt06YnrtBCF3nc=",
      price: 1.20,
      type: ItemType.fruit),
  Item(
      name: "Apple",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBKiFWTqfGdBRKlZ1yLmaqeINS1P_5lR6RNQ&s",
      price: 0.65,
      type: ItemType.fruit),
  Item(
      name: "Orange",
      image:
          "https://i5.walmartimages.com/seo/Fresh-Navel-Orange-Each_a134f2a1-2bb0-4e5c-a594-f84b63ab5928.22241f295458186b2ba0e4ed7d460d52.jpeg?odnHeight=768&odnWidth=768&odnBg=FFFFFF",
      price: 1.99,
      type: ItemType.fruit),
  Item(
      name: "Mango",
      image:
          "https://orchardfruit.com/cdn/shop/files/Mango-Whole-The-Orchard-Fruit-72136115.jpg?v=1722937809&width=1000",
      price: 4.75,
      type: ItemType.fruit),
  Item(
      name: "Tomato",
      image: "https://source.washu.edu/app/uploads/2015/11/Tomato250-1.jpg",
      price: 0.45,
      type: ItemType.vegetable),
  Item(
      name: "Potato",
      image: "https://m.media-amazon.com/images/I/41QKCkQ2A5L._AC_UF1000,1000_QL80_.jpg",
      price: 0.85,
      type: ItemType.vegetable),
  Item(
      name: "Carrot",
      image: "https://evergreenfoods.co.uk/wp-content/uploads/2019/06/carrot-600x600.png",
      price: 0.90,
      type: ItemType.vegetable),
  Item(
      name: "Cucumber",
      image:
          "https://lh3.googleusercontent.com/proxy/uAP0COl6pYdMYCK7qQ8ByEIj5vJxItD15VJPNG2e-h9sN31B3oHsfGDMCMXEKMgJqD4PWXmRIE5fbKOCQL_iVyFAEFWARtIlh5Tm3yzZSmjyplOJYj_4wYSQuZIABHcKdQu1NsZrCmjoZJfwxL4S",
      price: 0.90,
      type: ItemType.vegetable),
];

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final fruitList = items.where((element) => element.type == ItemType.fruit).toList();
    final vegetableList = items.where((element) => element.type == ItemType.vegetable).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Shop",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color(0xFF802E2E),
        bottom: TabBar(
          controller: tabController,
          labelColor: Colors.white,
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: "Fruits"),
            Tab(text: "Vegetables"),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: fruitList.length,
                      itemBuilder: (context, index) {
                        return CustomItem(
                          item: fruitList[index],
                          onItemchange: () {
                            setState(() {});
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: vegetableList.length,
                      itemBuilder: (context, index) {
                        return CustomItem(
                          item: vegetableList[index],
                          onItemchange: () {
                            setState(() {});
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            FooterView(items: items)
          ],
        ),
      ),
    );
  }
}
