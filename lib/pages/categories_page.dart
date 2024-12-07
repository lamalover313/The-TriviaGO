import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/widgets/category_card.dart';

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
            context.go('/home');
          },
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          if (index == 0) {
            return CategoryCard(
              text: 'Arte',
              color: Colors.red,
              imagePath: 'lib/assets/images/arte.png',
              onTap: () {},
              isExpanded: _expandedIndex == index,
              toggleExpansion: () => _toggleExpansion(index),
            );
          } else if (index == 1) {
            return CategoryCard(
              text: 'Ciencia',
              color: Colors.green,
              imagePath: 'lib/assets/images/ciencia.png',
              onTap: () {},
              isExpanded: _expandedIndex == index,
              toggleExpansion: () => _toggleExpansion(index),
            );
          } else if (index == 2) {
            return CategoryCard(
              text: 'Deportes',
              color: Colors.orange,
              imagePath: 'lib/assets/images/deporte.jpg',
              onTap: () {},
              isExpanded: _expandedIndex == index,
              toggleExpansion: () => _toggleExpansion(index),
            );
          } else if (index == 3) {
            return CategoryCard(
              text: 'Geografía',
              color: Colors.blue,
              imagePath: 'lib/assets/images/geografia.png',
              onTap: () {},
              isExpanded: _expandedIndex == index,
              toggleExpansion: () => _toggleExpansion(index),
            );
          } else {
            return CategoryCard(
              text: 'Historia',
              color: Colors.yellow,
              imagePath: 'lib/assets/images/historia.jpg',
              onTap: () {},
              isExpanded: _expandedIndex == index,
              toggleExpansion: () => _toggleExpansion(index),
            );
          }
        },
      ),
    );
  }
}
