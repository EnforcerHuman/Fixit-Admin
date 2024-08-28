import 'package:fixit_admin/features/provider_verification/presentation/Screens/detail_screen.dart';
import 'package:fixit_admin/features/provider_verification/presentation/widgets/applocant_card.dart';
import 'package:fixit_admin/features/provider_verification/presentation/widgets/side_bar.dart';
import 'package:flutter/material.dart';

class ApplicationsGrid extends StatelessWidget {
  final bool isLargeScreen;
  final bool isMediumScreen;
  final List applications;
  final bool? isVerified;
  const ApplicationsGrid({
    super.key,
    required this.isLargeScreen,
    required this.isMediumScreen,
    required this.applications,
    this.isVerified,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount =
            _getCrossAxisCount(constraints, isLargeScreen, isMediumScreen);

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 1,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: applications.length,
          itemBuilder: (context, index) {
            final appData = applications[index];
            final data = appData.data() as Map<String, dynamic>;
            return ApplicationCard(
              name: data['name'] ?? '',
              service: data['serviceArea'] ?? '',
              imageUrl: data['profileImage'] ?? '',
              onTap: () => _navigateToDetailScreen(context, data, isVerified),
            );
          },
        );
      },
    );
  }

  int _getCrossAxisCount(
      BoxConstraints constraints, bool isLargeScreen, bool isMediumScreen) {
    if (isLargeScreen) {
      return constraints.maxWidth ~/ 250;
    } else if (isMediumScreen) {
      return constraints.maxWidth ~/ 200;
    } else {
      return 1;
    }
  }

  void _navigateToDetailScreen(
      BuildContext context, Map<String, dynamic> data, bool? isVerified) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Scaffold(
          appBar: AppBar(title: const Text('Application Details')),
          body: Row(
            children: [
              if (isLargeScreen) const SideBarWidget(),
              Expanded(
                  child: ApplicationDetailsScreen(
                providerData: data,
                isVerified: isVerified,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
