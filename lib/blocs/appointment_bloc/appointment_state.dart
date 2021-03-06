part of 'appointment_bloc.dart';

abstract class AppointmentState extends Equatable {
  const AppointmentState();

  @override
  List<Object?> get props => [];
}

class AppointmentInitial extends AppointmentState {}

class AppointmentLoading extends AppointmentState {}

class AppointmentSuccess extends AppointmentState {
  final List<Appointment> appointments;
  const AppointmentSuccess(this.appointments);
}

class AppointmentEmpty extends AppointmentState {
}

class AppointmentError extends AppointmentState {
}
