import 'package:flutter/material.dart';
import 'package:myapp/classes/providerCategory.dart';
import 'package:myapp/widgets/cards/category_card.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final CategoryProvider _categoryProvider = CategoryProvider();
  List<String> _categories = [];
  bool _isLoading = true;
  int _expandedIndex = -1;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    try {
      final categories = await _categoryProvider.fetchCategories();
      setState(() {
        _categories = categories;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cargar categorías: $e')),
      );
    }
  }

  void _toggleExpansion(int index) {
    setState(() {
      _expandedIndex = _expandedIndex == index ? -1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Categorías'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];

                final imagePath = 'lib/assets/images/${category.toLowerCase()}.png';

                return CategoryCard(
                  text: category,
                  color: Colors.primaries[index % Colors.primaries.length],
                  imagePath: imagePath,
                  isExpanded: _expandedIndex == index,
                  toggleExpansion: () => _toggleExpansion(index),
                );
              },
            ),
    );
  }
}