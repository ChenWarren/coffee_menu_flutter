import 'dart:convert';
import 'dart:core';

import 'package:coffee_menu/model/coffee_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
      body: FutureBuilder<List<Coffee>>(
        future: fetchCoffees(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else if (snapshot.hasData) {
            return CoffeeList(coffees: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class CoffeeList extends StatelessWidget {
  const CoffeeList({Key? key, required this.coffees}) : super(key: key);
  final List<Coffee> coffees;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: coffees.length,
      itemBuilder: (context, i) {
        return Card(
          child: Image.network(
            coffees[i].image,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}

Future<List<Coffee>> fetchCoffees(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://smooth-imaginary-anemone.glitch.me'));
  return compute(parseCoffees, response.body);
}

List<Coffee> parseCoffees(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Coffee>((json) => Coffee.fromJson(json)).toList();
}
