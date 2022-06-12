part of 'metal_bloc.dart';

abstract class MetalState extends Equatable {
  const MetalState();

  @override
  List<Object> get props => [];
}

class MetalInitial extends MetalState {}

class MetalLoading extends MetalState {}

class MetalSuccess extends MetalState {
  final List<Metal> metals;
  const MetalSuccess(this.metals);
}
class MetalEmpty extends MetalState {
}

class MetalError extends MetalState {
}
