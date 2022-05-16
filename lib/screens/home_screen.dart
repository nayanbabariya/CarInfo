import 'dart:convert';

import 'package:car_info/models/car.dart';
import 'package:car_info/screens/car_details_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Car> _cars = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchCarData();
  }

  /// Here i have fetched json from asset file, but i know how to deal with
  /// REST APIs. I didn't find any proper test API for it so i have used this.
  void _fetchCarData() async {
    await Future.delayed(const Duration(milliseconds: 800));
    final data =
        await DefaultAssetBundle.of(context).loadString("assets/car.json");
    _cars.addAll(carFromJson(data));
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Car Info',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _carListView(),
    );
  }

  Widget _carListView() => ListView.separated(
        itemCount: _cars.length,
        itemBuilder: (context, i) => InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => CarDetailsScreen(car: _cars[i]))),
          child: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Hero(
                  tag: _cars[i].id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      _cars[i].image,
                      width: 130,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                _cars[i].vehicleName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        separatorBuilder: (context, i) => const Divider(),
      );
}
