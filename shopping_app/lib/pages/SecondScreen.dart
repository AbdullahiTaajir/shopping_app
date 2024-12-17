import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:shopping_app/Data/model.dart";
import "package:shopping_app/providerPage/ProviderData.dart";

class SecondPage extends StatefulWidget {
  SecondPage({super.key, required this.CurrentIndex});
  final int CurrentIndex;
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, exchange, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Details",
            style: TextStyle(fontSize: 20),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Text(
              items[widget.CurrentIndex].name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 90,
            ),
            Image.asset(items[widget.CurrentIndex].image),
            SizedBox(
              height: 90,
            ),
            Text(items[widget.CurrentIndex].price.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items[widget.CurrentIndex].size.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      exchange.selectedIndex(index);
                    },
                    child: Container(
                        width: 60,
                        height: 30,
                        child: Chip(
                            backgroundColor: index == exchange.selected
                                ? Colors.orange
                                : Colors.white,
                            label: Text(
                                "${items[widget.CurrentIndex].size[index]}"))),
                  );
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 40,
              width: 400,
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () {
                    exchange.additems(items[widget.CurrentIndex],
                        items[widget.CurrentIndex].size[exchange.selected]);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Saved Successful")));
                  },
                  child: Text("Add To Cart")),
            )
          ],
        ),
      ),
    );
  }
}
