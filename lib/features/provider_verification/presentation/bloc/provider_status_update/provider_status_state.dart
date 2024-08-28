part of 'provider_status_bloc.dart';

@immutable
sealed class ProviderStatusState {}

final class ProviderStatusInitial extends ProviderStatusState {}

class ProviderAccepted extends ProviderStatusState {}

class ProviderRejected extends ProviderStatusState {}

class ProviderStatusUpdating extends ProviderStatusState {}

class ProviderStatusUpdateFailed extends ProviderStatusState {
  final String errorMessage;

  ProviderStatusUpdateFailed(this.errorMessage);
}
