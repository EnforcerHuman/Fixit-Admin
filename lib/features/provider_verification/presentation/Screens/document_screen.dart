import 'package:flutter/material.dart';

class DocumentScreen extends StatelessWidget {
  final String? imageUrl;
  const DocumentScreen({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Document'),
      ),
      body: Center(
        child: (imageUrl == null || imageUrl!.isEmpty)
            ? Text('No document uploaded', style: TextStyle(fontSize: 18))
            : Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.network(imageUrl!),
              ),
      ),
    );
  }
}
