import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/classes/models.dart';
import 'package:myapp/classes/providerArte.dart';

class HistoriaPage extends StatelessWidget {
  final heprovider = HEProvider();
  final hmprovider = HMProvider();
  final hhprovider = HHProvider();
  HistoriaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Historia'),
          leading: IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              context.go('/home');
            },
          ),
        ),
        body: FutureBuilder(
            future: HEProvider().getProductsAsync(),
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
                  return Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text(apppi.question),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(apppi.correctanswer)),
                            TextButton(
                                onPressed: () {},
                                child: Text(apppi.incorrectanswer1)),
                            TextButton(
                                onPressed: () {},
                                child: Text(apppi.incorrectanswer2)),
                            TextButton(
                                onPressed: () {},
                                child: Text(apppi.incorrectanswer3)),
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            }));
  }
}
