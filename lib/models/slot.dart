class Slot
{
  String? startTime, endTime;
  bool? available;
  Slot({this.startTime, this.endTime, this.available});
  Slot.fromJson(Map<String, dynamic> jsonData)
  {
    startTime = jsonData['start_time'];
    endTime = jsonData['end_time'];
    available = jsonData['available'];
  }
}