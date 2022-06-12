import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../api_repository/api_repository.dart';
import '../../models/appointment.dart';

part 'appointment_event.dart';
part 'appointment_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  AppointmentBloc() : super(AppointmentInitial()) {
    final ApiRepository apiRepository = ApiRepository();
    on<GetAppointmentList>((event, emit) async {
      try {
        emit(AppointmentLoading());
        final appointmentList = await apiRepository.getAppointments();
        emit(AppointmentSuccess(appointmentList));
        if (appointmentList.isEmpty) {
          emit(AppointmentEmpty());
        }
      } catch(e) {
        emit(AppointmentError());
      }
    });
  }
}