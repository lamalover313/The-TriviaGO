import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/classes/models.dart';
import 'package:myapp/classes/providerArte.dart';

class ArtePage extends StatelessWidget {
  ArtePage({super.key});

  final afprovider = AFProvider();
  final amprovider = AMProvider();
  final ahprovider = AHProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Arte'),
          leading: IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              context.go('/home');
            },
          ),
        ),
        body: FutureBuilder(
            future: AFProvider().getProductsAsync(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Error al obtener los productos'),
                );
              }

              if (!snapshot.hasData) {
                return const Center(
                  child: Text('No hay productos'),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final api apppi = snapshot.data![index];
                  return ListTile(
                    title: Text(apppi.question),
                    //subtitle: Text(apppi.incorrectanswers),
                  );
                },
              );
            }));
  }
}
