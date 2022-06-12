import 'package:flutter/material.dart';
import 'package:gold/models/appointment.dart';
class SlotScreen extends StatelessWidget {
  final Appointment? appointment;
  const SlotScreen({Key? key, this.appointment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appointment!.date!),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: appointment!.slots!.length,
        itemBuilder: (context, index){
          return Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Start Time : ${appointment!.slots![index].startTime!}"),
                      const SizedBox(height: 10,),
                      Text("End Time : ${appointment!.slots![index].endTime!}"),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),),
                      elevation: 0,
                    ),
                    onPressed: (){
                    //
                  }, child: const Text("Book"),),
                ],
              ),
            ),
          );
          // return ListTile(
          //   title: Text(slots![index].startTime!),
          // );
        },
      ),
    );
  }
}
