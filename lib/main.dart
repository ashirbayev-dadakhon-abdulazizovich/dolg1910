import 'package:flutter/material.dart';

void main() {
  runApp(MotorcycleSaleApp());
}

class MotorcycleSaleApp extends StatefulWidget {
  @override
  _MotorcycleSaleAppState createState() => _MotorcycleSaleAppState();
}

class _MotorcycleSaleAppState extends State<MotorcycleSaleApp> {
  bool isFavorite = false;
  bool isDarkMode = false; // Variable to track dark mode
  final List<String> images = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light, // Set theme mode
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Back action
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : null,
              ),
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                // More options action
              },
            ),
            // Theme toggle button
            IconButton(
              icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.nights_stay),
              onPressed: () {
                setState(() {
                  isDarkMode = !isDarkMode; // Toggle dark mode
                });
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BMW S 1000 RR, 2023',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '2 900 000 ₽',
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
              SizedBox(height: 16),
              AspectRatio(
                aspectRatio: 1,
                child: PageView.builder(
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullScreenImage(image: images[index]),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Text('13 декабря, Москва', style: TextStyle(fontSize: 16)),
              SizedBox(height : 16),
              Text('Характеристики:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('Год выпуска: 2023 г.'),
              Text('Пробег: 4 000 км'),
              Text('Тип: Спорт-байк'),
              Text('Цвет: Черный'),
              Text('Двигатель: 999 см³ / 207 л.с. / Инжектор'),
              Text('Цилиндров: 4 / Рядное'),
              Text('Тактов: 4'),
              Text('ΚΠΠ: 6 передач'),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 8.0), // Отступ между кнопками
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // Скругление углов
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16), // Вертикальные отступы
                        ),
                        onPressed: () {
                          // Call action
                        },
                        child: Text('Позвонить'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 8.0), // Отступ между кнопками
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // Скругление углов
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16), // Вертикальные отступы
                        ),
                        onPressed: () {
                          // Chat action
                        },
                        child: Text('Чат'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String image;

  FullScreenImage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Image.asset(image, fit: BoxFit.contain),
      ),
    );
  }
}