import 'package:dio/dio.dart';
import 'package:gold/constants/api_routes.dart';
import 'package:gold/models/metal.dart';
import 'package:gold/models/appointment.dart';
class ApiRepository
{
  final _dio = Dio();

  Future<List<Metal>> getMetals() async
  {
    Response response = await _dio.get(ApiRoutes.getPrices);
    final prices = response.data['prices'];
    List<Metal> metals = [];
    Metal metal;
    (prices as Map<String, dynamic>).forEach((key, value) {
      metal = Metal.fromJson(value);
      metal.name = key;
      metals.add(metal);
    });
    return metals;
  }

  Future<List<Appointment>> getAppointments() async
  {
    Response response = await _dio.get(ApiRoutes.getAppointments);
    List<Appointment> appointments  = [];
    response.data.forEach((appointment){
      appointments.add(Appointment.fromJson(appointment));
    });
    return appointments;
  }


}