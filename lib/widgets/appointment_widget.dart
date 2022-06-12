import "package:flutter/material.dart";
import '../models/appointment.dart';
import '../screens/slot_screen.dart';

Widget appointmentWidget(BuildContext context, List<Appointment> appointments)
{
  return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: appointments.length,
      itemBuilder: (context, position){
        return Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(appointments[position].date!,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),),
                    elevation: 0,
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SlotScreen(appointment: appointments[position],)),
                    );
                  }, child: const Text("View"),),
              ],
            ),
          ),
        );

      });
}
