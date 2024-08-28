import 'package:fixit_admin/features/provider_verification/presentation/Screens/document_screen.dart';
import 'package:fixit_admin/features/provider_verification/presentation/bloc/provider_status_update/provider_status_bloc.dart';
import 'package:fixit_admin/features/provider_verification/presentation/widgets/profile_image.dart';
import 'package:fixit_admin/features/provider_verification/presentation/widgets/user_data_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> providerData;
  final bool? isVerified;
  const ApplicationDetailsScreen(
      {super.key, required this.providerData, this.isVerified});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProviderStatusBloc, ProviderStatusState>(
        listener: (context, state) {
          if (state is ProviderAccepted) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 800),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ProfileImage(
                                    profileImageUrl: providerData[
                                            'profileImage'] ??
                                        'https://firebasestorage.googleapis.com/v0/b/fixit-1b8b8.appspot.com/o/images%2F2024-07-19%2023%3A48%3A02.801167.jpg?alt=media&token=ef8a3de1-2283-48dc-a6df-27be3985c43c'),
                                const SizedBox(height: 16),
                                Text(
                                  providerData['serviceArea'] ??
                                      'Service Area Not Specified',
                                  style: const TextStyle(color: Colors.blue),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 32),
                                Wrap(
                                  spacing: 16,
                                  runSpacing: 16,
                                  children: [
                                    UseraDataField(
                                        label: 'name',
                                        value: providerData['name']),
                                    UseraDataField(
                                        label: 'Email',
                                        value: providerData['email']),
                                    UseraDataField(
                                        label: 'Phone Number',
                                        value: providerData['phoneNumber']),
                                    UseraDataField(
                                        label: 'Working From',
                                        value: providerData['workingFrom']),
                                    UseraDataField(
                                        label: 'Working To',
                                        value: providerData['workingTo']),
                                    UseraDataField(
                                        label: 'Service Type',
                                        value: providerData['serviceTypes']),
                                    UseraDataField(
                                        label: 'Experience',
                                        value: providerData['experience']),
                                    UseraDataField(
                                        label: 'Hourly Pay',
                                        value: providerData['hourlyPay']),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (ctx) =>
                                                      DocumentScreen(
                                                          imageUrl: providerData[
                                                              'certificate'])));
                                        },
                                        child: const Text('view cetificate')),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (ctx) =>
                                                      DocumentScreen(
                                                          imageUrl:
                                                              providerData[
                                                                  'license'])));
                                        },
                                        child: const Text('view License'))
                                  ],
                                ),
                                const SizedBox(height: 32),
                                isVerified == false
                                    ? Row(
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                // Implement accept functionality5

                                                context
                                                    .read<ProviderStatusBloc>()
                                                    .add(ProviderAccept(
                                                        providerData['id']));
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 16),
                                              ),
                                              child: const Text('Accept'),
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                // Implement reject functionality
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 16),
                                              ),
                                              child: const Text('Reject'),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Text(''),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
