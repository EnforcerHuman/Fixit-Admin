import 'package:bloc/bloc.dart';
import 'package:fixit_admin/features/provider_verification/data/data_sources/firebase_services.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'provider_status_event.dart';
part 'provider_status_state.dart';

class ProviderStatusBloc
    extends Bloc<ProviderStatusEvent, ProviderStatusState> {
  FirebaseServices firebaseServices = FirebaseServices();
  ProviderStatusBloc() : super(ProviderStatusInitial()) {
    on<ProviderStatusEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<ProviderAccept>((event, emit) {
      emit(ProviderStatusUpdating());
      try {
        firebaseServices.updateIsVerified(event.docId, true);
        emit(ProviderAccepted());
      } catch (e) {
        emit(ProviderStatusUpdateFailed(e.toString()));
      }
    });
  }
}
