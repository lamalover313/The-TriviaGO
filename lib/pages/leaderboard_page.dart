import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  String? selectedCategory;
  String? selectedMode;

  Stream<QuerySnapshot> getScoresStream() {
    CollectionReference scoresRef = FirebaseFirestore.instance.collection('scores');

    Query query = scoresRef.orderBy('score', descending: true);

    if (selectedCategory != null && selectedCategory != 'Todos') {
      query = query.where('category', isEqualTo: selectedCategory);
    }
    if (selectedMode != null && selectedMode != 'Todos') {
      query = query.where('mode', isEqualTo: selectedMode);
    }

    return query.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A2E),
        title: const Text('Tabla de Posiciones'),
      ),
      backgroundColor: const Color(0xFF1A1A2E),
      body: Column(
        children: [
          _buildFilters(),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: getScoresStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      'No hay puntuaciones aún.',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }

                final docs = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index].data() as Map<String, dynamic>;
                    return Card(
                      color: Colors.grey[850],
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.orange,
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(
                          data['email'] ?? 'Invitado',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '${data['mode'] == 'random' ? 'Trivia Aleatoria' : data['category'] ?? 'Sin categoría'}',
                          style: const TextStyle(color: Colors.white70),
                        ),
                        trailing: Text(
                          '${data['score']}%',
                          style: const TextStyle(color: Colors.greenAccent, fontSize: 18),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DropdownButton<String>(
            value: selectedCategory ?? 'Todos',
            dropdownColor: Colors.grey[900],
            style: const TextStyle(color: Colors.white),
            items: ['Todos', 'Arte', 'Ciencia', 'Deportes', 'Geografía', 'Historia']
                .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedCategory = value == 'Todos' ? null : value;
              });
            },
          ),
          DropdownButton<String>(
            value: selectedMode ?? 'Todos',
            dropdownColor: Colors.grey[900],
            style: const TextStyle(color: Colors.white),
            items: ['Todos', 'random', 'categoria']
                .map((mode) => DropdownMenuItem(value: mode, child: Text(mode)))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedMode = value == 'Todos' ? null : value;
              });
            },
          ),
        ],
      ),
    );
  }
}
