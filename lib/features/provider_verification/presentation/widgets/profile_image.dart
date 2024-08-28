import 'package:fixit_admin/features/provider_verification/data/data_sources/firebase_services.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String profileImageUrl;
  const ProfileImage({super.key, required this.profileImageUrl});

  @override
  Widget build(BuildContext context) {
    FirebaseServices services = FirebaseServices();

    return FutureBuilder<String>(
      future: services.getImageUrl(profileImageUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircleAvatar(
            radius: 50,
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError || !snapshot.hasData) {
          return CircleAvatar(
            radius: 50,
            child: Icon(Icons.person, size: 50, color: Colors.grey[400]),
          );
        } else {
          return CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(snapshot.data!),
            onBackgroundImageError: (exception, stackTrace) {
              print('Error loading image: $exception');
            },
          );
        }
      },
    );
  }
}
