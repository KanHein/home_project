part of 'metal_bloc.dart';

abstract class MetalEvent extends Equatable {
  const MetalEvent();

  @override
  List<Object> get props => [];
}

class GetMetalList extends MetalEvent {}