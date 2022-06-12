import 'slot.dart';

class Appointment
{
  String? date;
  List<Slot>? slots;

  Appointment({this.date, this.slots});
  Appointment.fromJson(Map<String, dynamic> jsonData)
  {
    date = jsonData['date'];
    if(jsonData['slots'] != null){
      slots = [];
      jsonData['slots'].forEach((slot){
        slots!.add(Slot.fromJson(slot));
      });
    }
  }
}