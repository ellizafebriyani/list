import 'package:flutter/material.dart';
import 'package:list/lib/price.dart';

class DataProduct extends StatefulWidget {
  const DataProduct({Key? key}) : super(key: key);

  @override
  State<DataProduct> createState() => _DataProductState();
}

class _DataProductState extends State<DataProduct> {
  TextEditingController menuController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  List<Price> prices = List.empty(growable: true);
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 147, 241),
      appBar: AppBar(
        title: Text('MENU OF CAKE (please type manual:)'),
        backgroundColor: Color.fromARGB(255, 226, 123, 245),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: menuController,
              decoration: const InputDecoration(
                  hintText: 'Name of Menu',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: const InputDecoration(
                  hintText: 'Price of Cake',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      //
                      String menu = menuController.text.trim();
                      String price = priceController.text.trim();
                      if (menu.isNotEmpty && price.isNotEmpty) {
                        setState(() {
                          menuController.text = '';
                          priceController.text = '';
                          prices.add(Price(menu: menu, price: price));
                        });
                      }
                      //
                    },
                    child: const Text('Save')),
                ElevatedButton(
                    onPressed: () {
                      //
                      String menu = menuController.text.trim();
                      String price = priceController.text.trim();
                      if (menu.isNotEmpty && price.isNotEmpty) {
                        setState(() {
                          menuController.text = '';
                          priceController.text = '';
                          prices[selectedIndex].menu = menu;
                          prices[selectedIndex].price = price;
                          selectedIndex = -1;
                        });
                      }
                      //
                    },
                    child: const Text('Update')),
              ],
            ),
            const SizedBox(height: 10),
            prices.isEmpty
                ? const Text(
                    'No Menu Yet. Please Add Your Menu',
                    style: TextStyle(fontSize: 22),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: prices.length,
                      itemBuilder: (context, index) => getRow(index),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              index % 2 == 0 ? Colors.deepPurpleAccent : Colors.purple,
          foregroundColor: Colors.white,
          child: Text(
            prices[index].menu[0],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              prices[index].menu,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(prices[index].price),
          ],
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    //
                    menuController.text = prices[index].menu;
                    priceController.text = prices[index].price;
                    setState(() {
                      selectedIndex = index;
                    });
                    //
                  },
                  child: const Icon(Icons.edit)),
              InkWell(
                  onTap: (() {
                    //
                    setState(() {
                      prices.removeAt(index);
                    });
                    //
                  }),
                  child: const Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
