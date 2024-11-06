import 'package:flutter/material.dart';
import '../main.dart';

class CityCard extends StatelessWidget {
  final City city;
  final VoidCallback onTap;

  const CityCard({super.key, required this.city, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
              child: SizedBox(
                height: 150,
                child: Image.asset(city.imagePath, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0), // Increased padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${city.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold)), // Increased font size
                  Text(city.name,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold)), // Increased font size
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
