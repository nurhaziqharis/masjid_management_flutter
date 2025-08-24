import 'package:flutter/material.dart';

class EventSegment extends StatelessWidget {
  const EventSegment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: [_taskTop()]));
  }
}

Widget _taskTop() {
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
                Text('Task', style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),),
                Text('Manage your task here', style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic
                ),),
              ],
            ),
          ),
        ),

        //Add project button
        Container(
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Add Project',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF10B981),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Adjust the radius as needed
              ),
            ),
          ),
        ),
        Container(
          //color: Colors.yellowAccent,
          child: ElevatedButton(onPressed: (){}, child: Text('Import Data')),
        ),
        Container(
          child: Row(
            children: [
              Icon(Icons.person),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Haziq Haris'),
                  Text('haziq.haris@gmail.com'),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}
