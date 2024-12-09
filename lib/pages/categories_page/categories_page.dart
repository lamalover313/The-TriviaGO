import 'package:flutter/material.dart';
import 'package:myapp/widgets/cards/category_card.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  CategoriesPageState createState() => CategoriesPageState();
}

class CategoriesPageState extends State<CategoriesPage> {
  int? _expandedIndex;

  void _toggleExpansion(int index) {
    setState(() {
      if (_expandedIndex == index) {
        _expandedIndex = null;
      } else {
        _expandedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Categorías',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color(0xFF0A0E21),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          if (index == 0) {
            return CategoryCard(
              text: 'Arte',
              color: Colors.red,
              imagePath: 'lib/assets/images/arte.png',
              isExpanded: _expandedIndex == index,
              toggleExpansion: () => _toggleExpansion(index),
            );
          } else if (index == 1) {
            return CategoryCard(
              text: 'Ciencia',
              color: Colors.green,
              imagePath: 'lib/assets/images/ciencia.png',
              isExpanded: _expandedIndex == index,
              toggleExpansion: () => _toggleExpansion(index),
            );
          } else if (index == 2) {
            return CategoryCard(
              text: 'Deportes',
              color: Colors.orange,
              imagePath: 'lib/assets/images/deporte.jpg',
              isExpanded: _expandedIndex == index,
              toggleExpansion: () => _toggleExpansion(index),
            );
          } else if (index == 3) {
            return CategoryCard(
              text: 'Geografía',
              color: Colors.blue,
              imagePath: 'lib/assets/images/geografia.png',
              isExpanded: _expandedIndex == index,
              toggleExpansion: () => _toggleExpansion(index),
            );
          } else {
            return CategoryCard(
              text: 'Historia',
              color: Colors.yellow,
              imagePath: 'lib/assets/images/historia.jpg',
              isExpanded: _expandedIndex == index,
              toggleExpansion: () => _toggleExpansion(index),
            );
          }
        },
      ),
    );
  }
}