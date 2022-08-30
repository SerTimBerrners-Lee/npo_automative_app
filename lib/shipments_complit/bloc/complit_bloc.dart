
import 'package:npo_automative_app/packages/complet_sh_repository/lib/complet_sh_repository.dart';
import 'package:npo_automative_app/shipments_complit/bloc/complit_event.dart';
import 'package:npo_automative_app/shipments_complit/bloc/complit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplitShBloc extends Bloc<ComplitShEvent, ComplitShState> {
  ComplitShBloc({
    required ComplectShRepository complectRepository,
  })  : _complectRepository = complectRepository,
        super(const ComplitShState()) {
    on<ComplitShipmentsGet>(_onShipmentsGet);
  }

  final ComplectShRepository _complectRepository;

  Future<void> _onShipmentsGet(
    ComplitShipmentsGet event,
    Emitter<ComplitShState> emit,
  ) async {
    final shipments = await _complectRepository.getComplitSh();
    emit(
      state.copyWith(
        ships: shipments
      ),
    );
  }
}