import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puneri_paltan/View/single_photo_view.dart';

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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffF4AF23),
              Color(0xffF37F30),
              // Color(0xffFEA55E),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: collection.length,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => SinglePhotoView(),
                      arguments: collection[i].toString());
                },
                child: Card(
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
