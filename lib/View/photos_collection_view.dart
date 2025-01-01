import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhotosCollectionView extends StatefulWidget {
  const PhotosCollectionView({super.key});

  @override
  State<PhotosCollectionView> createState() => _PhotosCollectionViewState();
}

class _PhotosCollectionViewState extends State<PhotosCollectionView> {
  List collection = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo Collection"),
        centerTitle: true,
      ),
      // body: Text(collection.toString()),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: collection.length,
        itemBuilder: (context, i) {
          return Card(
            elevation: 10,
            child: Image.network(
              collection[i].toString(),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Icon(Icons.error, color: Colors.red),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
