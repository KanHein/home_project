import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../api_repository/api_repository.dart';
import '../../models/metal.dart';

part 'metal_event.dart';
part 'metal_state.dart';

class MetalBloc extends Bloc<MetalEvent, MetalState> {
  MetalBloc() : super(MetalInitial()) {
    final ApiRepository apiRepository = ApiRepository();
      on<GetMetalList>((event, emit) async {
        try {
          emit(MetalLoading());
          final metalList = await apiRepository.getMetals();
          emit(MetalSuccess(metalList));
          if (metalList.isEmpty) {
            emit(MetalEmpty());
          }
        } catch(e) {
          emit(MetalError());
        }
      });
    }
}