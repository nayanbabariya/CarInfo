import 'package:car_info/models/car.dart';
import 'package:flutter/material.dart';

class CarDetailsScreen extends StatefulWidget {
  final Car car;

  const CarDetailsScreen({Key? key, required this.car}) : super(key: key);

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          splashRadius: 24,
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.car.vehicleName,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.car.id,
              child: Image.network(
                widget.car.image,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            _carDetails('Car Name', widget.car.vehicleName),
            _carDetails('Company', widget.car.modelName),
            _carDetails('Age', widget.car.age),
          ],
        ),
      ),
    );
  }

  Widget _carDetails(String title, String detail) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Text.rich(
          TextSpan(
            text: '$title: ',
            children: [
              TextSpan(
                text: detail,
                style: const TextStyle(fontWeight: FontWeight.normal),
              )
            ],
          ),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}
