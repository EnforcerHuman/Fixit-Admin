class ApplicationsEvent {}

class LoadApplications extends ApplicationsEvent {
  final bool showPending;

  LoadApplications({required this.showPending});
}

class ToggleApplicationsView extends ApplicationsEvent {
  final bool showPending;

  ToggleApplicationsView({required this.showPending});
}
