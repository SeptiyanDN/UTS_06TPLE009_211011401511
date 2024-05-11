import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project App Shoes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ShoesList(),
    );
  }
}

class ShoesList extends StatefulWidget {
  const ShoesList({Key? key}) : super(key: key);

  @override
  State<ShoesList> createState() => _ShoesListState();
}

class _ShoesListState extends State<ShoesList> {
  final List<Map<String, dynamic>> shoes = [
    {
      'title': 'Nike SB Zoom Blazer',
      'subtitle': 'Mid Premium',
      'price': '28,795',
      'imageUrl':
          'https://static.nike.com/a/images/t_default/c352f459-7930-4067-a51a-372df13b6ff2/vaporfly-3-womens-road-racing-shoes-4jJ4vQ.png',
      'backgroundColor': Colors.blue, // Tambahkan warna latar belakang di sini
    },
    {
      'title': 'Nike Air Zoom Pegasus',
      'subtitle': "Men's Road Running Shoes",
      'price': '29,995',
      'imageUrl':
          'https://static.nike.com/a/images/t_default/c352f459-7930-4067-a51a-372df13b6ff2/vaporfly-3-womens-road-racing-shoes-4jJ4vQ.png',
      'backgroundColor': Colors.green, // Tambahkan warna latar belakang di sini
    },
    {
      'title': 'Nike ZoomX Vaporfly',
      'subtitle': "Men's Road Racing Shoe",
      'price': '219,695',
      'imageUrl':
          'https://static.nike.com/a/images/t_default/c352f459-7930-4067-a51a-372df13b6ff2/vaporfly-3-womens-road-racing-shoes-4jJ4vQ.png',
      'backgroundColor': Colors.red, // Tambahkan warna latar belakang di sini
    },
    {
      'title': 'Nike Air Force 1 S50',
      'subtitle': "Older Kids' Shoe",
      'price': '26,295',
      'imageUrl':
          'https://static.nike.com/a/images/t_default/8a32b0da-59ec-4c1a-8bcc-d7e7136fdaf5/waffle-debut-vintage-womens-shoes-rfRkv2.png',
      'backgroundColor':
          Colors.orange, // Tambahkan warna latar belakang di sini
    },
    {
      'title': 'Nike Waffle One',
      'subtitle': "Men's Shoes",
      'price': '28,295',
      'imageUrl':
          'https://static.nike.com/a/images/t_default/8a32b0da-59ec-4c1a-8bcc-d7e7136fdaf5/waffle-debut-vintage-womens-shoes-rfRkv2.png',
      'backgroundColor':
          Colors.purple, // Tambahkan warna latar belakang di sini
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Shoes',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 30,
                color: Colors.black54),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://lh3.googleusercontent.com/a/ACg8ocJ-QOEqT9_po9KT--Eod8JF9J7SEfKuzv7RFDHk0b0LiG0CajE=s288-c-no',
              ),
              radius: 25,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView.builder(
          itemCount: shoes.length,
          itemBuilder: (context, index) {
            final shoe = shoes[index];
            return Column(
              children: [
                Card(
                  color: shoe['backgroundColor'],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        40), // Adjust the value for more curve
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              shoe['title']!,
                              style: const TextStyle(fontSize: 24),
                            ),
                            Text(
                              shoe['subtitle']!,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              shoe['price']!,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Positioned(
                          right: -20, 
                          top: 100,// Adjust the value to position the image
                          child: Transform.rotate(
                            angle: -25 * 3.1415926535 / 180,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                shoe['imageUrl']!,
                                width: 150,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16), // Tambahkan jarak di sini
              ],
            );
          },
        ),
      ),
    );
  }
}

class ShoeItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String imageUrl;

  const ShoeItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(40), // Adjust the value for more curve
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                  price,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(width: 16),
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 40,
            ),
          ],
        ),
      ),
    );
  }
}
