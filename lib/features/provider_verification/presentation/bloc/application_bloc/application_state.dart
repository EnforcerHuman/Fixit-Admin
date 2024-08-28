import 'package:cloud_firestore/cloud_firestore.dart';

class ApplicationsState {}

class ApplicationsLoading extends ApplicationsState {}

class ApplicationsLoaded extends ApplicationsState {
  final List<QueryDocumentSnapshot> applications;
  final bool showPending;

  ApplicationsLoaded({required this.applications, required this.showPending});
}

class ApplicationsEmpty extends ApplicationsState {
  final bool showPending;

  ApplicationsEmpty({required this.showPending});
}

class ApplicationsError extends ApplicationsState {
  final String message;

  ApplicationsError(this.message);
}
