import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class SinglePhotoView extends StatefulWidget {
  const SinglePhotoView({super.key});

  @override
  State<SinglePhotoView> createState() => _SinglePhotoViewState();
}

class _SinglePhotoViewState extends State<SinglePhotoView> {
  String collection = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: PhotoView(
          imageProvider: NetworkImage(
            collection,
          ),
          minScale: PhotoViewComputedScale.contained,
        ),
      ),
    );
  }
}
