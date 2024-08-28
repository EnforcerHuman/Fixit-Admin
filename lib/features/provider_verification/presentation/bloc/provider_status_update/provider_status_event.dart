part of 'provider_status_bloc.dart';

@immutable
sealed class ProviderStatusEvent {}

class ProviderAccept extends ProviderStatusEvent {
  final String docId;

  ProviderAccept(this.docId);
}

class ProviderReject extends ProviderStatusEvent {}
