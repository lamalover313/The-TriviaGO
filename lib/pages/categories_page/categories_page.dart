import 'package:flutter/material.dart';
import 'package:myapp/classes/providerCategory.dart';
import 'package:myapp/widgets/cards/category_card.dart';

const List<String> difficulties = ['easy', 'medium', 'hard'];

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final QuestionProvider _questionProvider = QuestionProvider();
  final CategoryProvider _categoryProvider = CategoryProvider();

  bool _isLoading = false;
  List<String> _categories = [];
  List<Map<String, dynamic>> _questions = [];
  int _expandedIndex = -1;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    setState(() => _isLoading = true);
    try {
      final categories = await _categoryProvider.fetchCategories();
      // Exclude "art" category from the list entirely
      setState(() {
        _categories = categories.where((category) => category != 'art').toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cargar categorías: $e')),
      );
    }
  }

  void _loadQuestions(String category, String difficulty) async {
    setState(() => _isLoading = true);
    try {
      final questions = await _questionProvider.fetchQuestions(
        category: category,
        difficulty: difficulty,
      );
      setState(() {
        _questions = questions;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cargar preguntas: $e')),
      );
    }
  }

  void _selectCategory(String category) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: difficulties.map((difficulty) {
            return ListTile(
              title: Text(difficulty.toUpperCase()),
              onTap: () {
                Navigator.pop(context);
                _loadQuestions(category, difficulty);
              },
            );
          }).toList(),
        );
      },
    );
  }

  void _toggleExpansion(int index) {
    setState(() {
      _expandedIndex = _expandedIndex == index ? -1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categorías')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                return GestureDetector(
                  onTap: () => _selectCategory(category),
                  child: CategoryCard(
                    text: category,
                    color: Colors.primaries[index % Colors.primaries.length],
                    imagePath: 'lib/assets/images/${category.toLowerCase()}.png',
                    isExpanded: _expandedIndex == index,
                    toggleExpansion: () => _toggleExpansion(index),
                  ),
                );
              },
            ),
    );
  }
}