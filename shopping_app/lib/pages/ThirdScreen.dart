import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:provider/provider.dart";
import "package:shopping_app/Data/model.dart";

import "package:shopping_app/providerPage/ProviderData.dart";

class ThirdPage extends StatefulWidget {
  ThirdPage({
    super.key,
  });

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AppProvider>(
        builder: (context, exchange, child) => Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              children: [
                Text(
                  "Cart",
                  style: TextStyle(fontSize: 20),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: exchange.Datacarry.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child:
                              Image.asset("${exchange.Datacarry[index].image}"),
                        ),
                        title: Text(
                          "${exchange.Datacarry[index].name}",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 10),
                        ),
                        subtitle: Text(
                          "Size: ${exchange.size[index]}",
                        ),
                        trailing: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  return AlertDialog(
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("No"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Provider.of<AppProvider>(context,
                                                  listen: false)
                                              .removeItem(exchange.Datacarry[
                                                  exchange.selected]);

                                          Navigator.of(context).pop();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Successful Deleted")));
                                        },
                                        child: Text("Yes"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Icon(Icons.delete)),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
