import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_app/Data/model.dart';
import 'package:shopping_app/pages/SecondScreen.dart';
import 'package:shopping_app/pages/ThirdScreen.dart';
import 'package:shopping_app/providerPage/ProviderData.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> chips = ["All", "Adidas", "Nike", "Bata"];

  List<int> choosing = [];
  int CurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Shoes\nCollection",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: chips.length,
                itemBuilder: (context, index) {
                  return Container(
                      width: 100,
                      height: 30,
                      child: Chip(label: Text(chips[index])));
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondPage(
                              CurrentIndex: index,
                            ),
                          ));
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: index.isEven
                              ? const Color.fromARGB(255, 191, 224, 252)
                              : Colors.white),
                      width: 100,
                      height: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(items[index].name),
                          Text(items[index].price.toString()),
                          Image(
                            image: AssetImage(items[index].image),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
              onTap: () {
                AppProvider().Datacarry.length;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ThirdPage()));
              },
              child: Icon(Icons.shopping_cart)),
          label: "",
        )
      ]),
    );
  }
}
