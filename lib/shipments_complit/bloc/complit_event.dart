import 'package:equatable/equatable.dart';

abstract class ComplitShEvent extends Equatable {
  const ComplitShEvent();

  @override
  List<Object> get props => [];
}

class ComplitShipmentsGet extends ComplitShEvent {
  const ComplitShipmentsGet();
}
