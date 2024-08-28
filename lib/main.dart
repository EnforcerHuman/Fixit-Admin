import 'package:firebase_core/firebase_core.dart';
import 'package:fixit_admin/features/provider_verification/presentation/Screens/home_screen.dart';
import 'package:fixit_admin/features/provider_verification/data/data_sources/firebase_services.dart';
import 'package:fixit_admin/features/provider_verification/presentation/bloc/application_bloc/application_bloc.dart';
import 'package:fixit_admin/features/provider_verification/presentation/bloc/provider_status_update/provider_status_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAguNeSxcKg3Sjj5ThwOQi_qEJmL4pg5Ds",
          authDomain: "fixit-1b8b8.firebaseapp.com",
          projectId: "fixit-1b8b8",
          storageBucket: "fixit-1b8b8.appspot.com",
          messagingSenderId: "697886710494",
          appId: "1:697886710494:web:c6e7a1ef66f370adc3004f"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ApplicationsBloc(firebaseServices: FirebaseServices()),
        ),
        BlocProvider(create: (context) => ProviderStatusBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ApplicationsScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
