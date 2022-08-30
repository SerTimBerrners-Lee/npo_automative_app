import 'package:npo_automative_app/packages/complet_sh_repository/lib/src/complet_sh_model.dart';
import 'package:equatable/equatable.dart';

class ComplitShState extends Equatable {
  const ComplitShState({
    this.complits = const [],
    this.status = false
  });

  final List<ComplitSh> complits;
  final bool status;

  ComplitShState copyWith({
    List<ComplitSh>? ships 
  }) {
    return ComplitShState(
      complits: ships ?? complits,
      status: true | status
    );
  }

  @override
  List<ComplitSh> get props => complits;
}