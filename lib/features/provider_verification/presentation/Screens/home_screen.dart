import 'package:fixit_admin/features/provider_verification/data/data_sources/firebase_services.dart';
import 'package:fixit_admin/features/provider_verification/presentation/bloc/application_bloc/application_bloc.dart';
import 'package:fixit_admin/features/provider_verification/presentation/bloc/application_bloc/application_event.dart';
import 'package:fixit_admin/features/provider_verification/presentation/Screens/application_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationsScreen extends StatelessWidget {
  const ApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ApplicationsBloc(firebaseServices: FirebaseServices())
            ..add(LoadApplications(showPending: true)),
      child: const ApplicationsView(),
    );
  }
}
