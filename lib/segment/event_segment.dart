import 'package:flutter/material.dart';
import 'package:masjid_management_flutter/enums/enums.dart';
import 'package:masjid_management_flutter/models/event.dart';

class EventSegment extends StatelessWidget {
  const EventSegment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: [_taskTop(context)]));
  }
}

Widget _taskTop(BuildContext context) {
  return Container(
    //color: Colors.redAccent,
    child: Row(
      children: [
        Expanded(
          child: Container(
            //color: Colors.blueAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Event',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Manage your event here',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ),

        //Add event button
        Container(
          child: ElevatedButton(
            onPressed: () {
              Event event = Event(category: Category.EMPTY, description: '', startTime: null, endTime: null, location: '', name: '');
              showDialog(context: context, builder: (BuildContext context){
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  title: const Text("Add Event"),
                  content: const Text("Do you want to create a new event?"),
                );
              });
            },
            child: Text('Add Project', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF10B981),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  8,
                ), // Adjust the radius as needed
              ),
            ),
          ),
        ),
        Container(
          //color: Colors.yellowAccent,
          child: Padding(
            padding: const EdgeInsets.only(left: 6),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Import Data'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Color(0xFF10B981),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    8,
                  ), // Adjust the radius as needed
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 8),
          child: Row(
            children: [
              Container(
                child: Icon(Icons.person, color: Colors.white,),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(64),
                  color: Colors.green
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('Haziq Haris', style: TextStyle(fontWeight: FontWeight.bold),), Text('haziq.haris@gmail.com')],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
