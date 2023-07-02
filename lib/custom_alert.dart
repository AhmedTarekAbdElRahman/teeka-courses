import 'package:flutter/material.dart';

void customAlert({required BuildContext context, required VoidCallback getGallery,required VoidCallback getCamera}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: const Text('Please choose media to select'),
          content: SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: getGallery,
                  child: const Row(
                    children: [
                      Icon(
                        Icons.image,
                      ),
                      Text(
                        'From Gallery',
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: getCamera,
                  child: const Row(
                    children: [
                      Icon(Icons.camera),
                      Text('From Camera'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
  //image
}