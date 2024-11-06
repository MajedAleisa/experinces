import 'package:flutter/material.dart';
import 'widgets/city_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'City Explorer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: HomePage(),
      routes: {
        '/detail': (context) => DetailPage(city: ModalRoute.of(context)!.settings.arguments as City),
      },
    );
  }
}

class City {
  final String name;
  final String imagePath;
  final double price;
  final String description;

  City({required this.name, required this.imagePath, required this.price, this.description = ''});
}

class HomePage extends StatelessWidget {
  final List<City> cities = [
    City(name: 'Jizan', imagePath: 'lib/images/1.jpg', price: 100.0, description: 'Jizan, also spelled Jazan, is a province in southwestern Saudi Arabia, stretching along 300 kilometers of the Red Sea coast. It is known for its rich agricultural output, producing over 30 types of fruits, including mangoes and papayas, earning it the nickname “the Kingdoms fruit basket.” The capital city, Jizan, serves as a vital port and economic hub, linking the region to East African markets. The province features diverse landscapes, from coastal areas to mountains, and includes the Farasan Islands, a UNESCO biosphere reserve. With a population density among the highest in Saudi Arabia, Jizan plays a significant role in the nations economy and culture.'),
    City(name: 'Makkah', imagePath: 'lib/images/2.jpg', price: 1500.0, description: 'Makkah, also known as Mecca, is the holiest city in Islam, located in the Hejaz region of Saudi Arabia. It is the birthplace of the Prophet Muhammad and the site where he received his first revelation of the Quran. The city is home to the Kabah, situated within the Masjid al-Haram, which Muslims face during prayer worldwide. Makkah hosts millions of pilgrims annually for the Hajj, one of Islam’s Five Pillars. The citys economy thrives on religious tourism, and it has undergone significant modernization to accommodate the growing number of visitors while preserving its spiritual significance.'),
    City(name: 'Jeddah', imagePath: 'lib/images/3.jpg', price: 120.0, description: 'Jeddah is a major city located on the western coast of Saudi Arabia along the Red Sea. It serves as the largest city in Makkah Province and is an important commercial hub. Historically, Jeddah has been a gateway for millions of Muslim pilgrims traveling to the holy cities of Mecca and Medina. The city boasts a rich cultural heritage, with its historic district, Al-Balad, recognized as a UNESCO World Heritage Site. Jeddah is known for its vibrant waterfront, shopping districts, and diverse population, making it a cosmopolitan center in Saudi Arabia. The city continues to grow rapidly, driven by tourism and trade.'),
    City(name: 'Riyadh', imagePath: 'lib/images/4.jpg', price: 200.0, description: 'Riyadh is the capital and largest city of Saudi Arabia, located in the central region of the country. It serves as the political and administrative center, housing key government institutions and foreign embassies. The city has experienced rapid growth, transforming from a small fortified town into a modern metropolis with a population exceeding seven million. Riyadh is known for its distinctive skyline, featuring landmarks like the Kingdom Centre and Al-Faisaliyah Tower. The city also hosts numerous cultural events and festivals, making it a vibrant hub for both business and tourism in the Arabian Peninsula.'),
    City(name: 'Abha', imagePath: 'lib/images/5.jpg', price: 180.0, description: 'Abha is the capital of the Asir region in southwestern Saudi Arabia, situated at an elevation of 2,270 meters above sea level. Known for its mild climate, it attracts tourists seeking relief from the heat of other regions. Abha is often referred to as the Bride of the Mountain due to its stunning landscapes and lush greenery. The city features several historical sites, including forts and traditional architecture. It is also home to Abha International Airport, facilitating travel to and from the city. Abha hosts various cultural events, making it a vibrant destination for both locals and visitors.'),
    City(name: 'Madinah', imagePath: 'lib/images/6.jpg', price: 1600.0, description: 'Madinah, also known as Al-Madinah al-Munawwarah, is the second holiest city in Islam, located in western Saudi Arabia. It is renowned for its historical significance as the site where Prophet Muhammad migrated from Mecca and established the first Muslim community. The city is home to the Prophet’s Mosque, which houses Muhammad’s tomb and attracts millions of visitors annually. Madinah was originally called Yathrib before the advent of Islam. Surrounded by mountains and valleys, it features a unique climate and lush landscapes. The city plays a vital role in Islamic culture and continues to be a center for religious pilgrimage and education.'),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('City Explorer', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Added padding to the body
        child: ListView.builder(
          itemCount: cities.length,
          itemBuilder: (context, index) {
            final city = cities[index];
            return Padding( // Added padding between list items
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CityCard(
                city: city,
                onTap: () {
                  Navigator.pushNamed(context, '/detail', arguments: city);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final City city;

  const DetailPage({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(city.name, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(city.imagePath)),
            const SizedBox(height: 16),
            Text('Price: \$${city.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text('Description:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(city.description, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
