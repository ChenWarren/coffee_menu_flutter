import 'dart:convert';

import 'package:coffee_menu/model/coffee_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<CoffeeList> fetchCoffeeList() async {
  const url = "https://smooth-imaginary-anemone.glitch.me";
  final response = await get(Uri.parse(url));
  if( response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    CoffeeList list = CoffeeList.fromJson(jsonResponse);
    print(list);
    return list;
  } else {
    throw Exception('Failed to get data');
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<CoffeeList> coffeeList;

  @override
  void initState() {
    super.initState();
    coffeeList = fetchCoffeeList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Menu'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      body: FutureBuilder<CoffeeList>(
        future: coffeeList,
        builder: (context, snapshot) {
          if( snapshot.hasData) {
            ListView.builder(
              itemCount: snapshot.data?.coffees.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: (){},
                    title: Text(snapshot.data!.coffees[index].title),
                  ),
                );
              },
            );
          } else if ( snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
