import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixit_admin/features/provider_verification/data/data_sources/firebase_services.dart';
import 'package:fixit_admin/features/provider_verification/presentation/bloc/application_bloc/application_event.dart';
import 'package:fixit_admin/features/provider_verification/presentation/bloc/application_bloc/application_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationsBloc extends Bloc<ApplicationsEvent, ApplicationsState> {
  final FirebaseServices firebaseServices;

  ApplicationsBloc({required this.firebaseServices})
      : super(ApplicationsLoading()) {
    on<LoadApplications>(_onLoadApplications);
    on<ToggleApplicationsView>(_onToggleApplicationsView);
  }

  void _onLoadApplications(
      LoadApplications event, Emitter<ApplicationsState> emit) async {
    emit(ApplicationsLoading());

    try {
      Stream<QuerySnapshot> stream = event.showPending
          ? firebaseServices.getUnverifiedServiceProviders()
          : firebaseServices.getVerifiedServiceProviders();

      await emit.forEach<QuerySnapshot>(
        stream,
        onData: (snapshot) {
          if (snapshot.docs.isEmpty) {
            return ApplicationsEmpty(showPending: event.showPending);
          }
          return ApplicationsLoaded(
            applications: snapshot.docs,
            showPending: event.showPending,
          );
        },
        onError: (error, stackTrace) => ApplicationsError(error.toString()),
      );
    } catch (e) {
      emit(ApplicationsError(e.toString()));
    }
  }

  void _onToggleApplicationsView(
      ToggleApplicationsView event, Emitter<ApplicationsState> emit) {
    add(LoadApplications(showPending: event.showPending));
  }
}
