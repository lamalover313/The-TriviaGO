import 'package:flutter/material.dart';
import 'package:myapp/classes/models.dart';
import 'package:myapp/classes/providerCategory.dart';
import 'package:myapp/widgets/custom/custom_app_bar.dart';

class ArtePage extends StatelessWidget {
  ArtePage({super.key});

  final afprovider = AFProvider();
  final amprovider = AMProvider();
  final ahprovider = AHProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Arte'),
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
            }
          ),
        );
  }
}