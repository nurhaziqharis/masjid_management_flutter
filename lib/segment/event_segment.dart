import 'package:flutter/material.dart';
import 'package:masjid_management_flutter/enums/enums.dart';
import 'package:masjid_management_flutter/models/event.dart';
import 'package:masjid_management_flutter/pages/popup/event_popup_new_edit.dart';

import '../styles/masjid_button_style.dart';

class EventSegment extends StatefulWidget {
  const EventSegment({super.key});

  @override
  State<EventSegment> createState() => _EventSegmentState();
}

class _EventSegmentState extends State<EventSegment> {

  //final customButtonStyle = MasjidButtonStyle.greenButtonMasjid;

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: [_taskTop(context)]));
  }

  Widget _taskTop(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
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
                _showAddEventDialog(context);
              },
              child: Text('Add Event'),
              style: MasjidButtonStyle.greenButtonMasjid,
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 6),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Import Data'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xFF10B981),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
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
                  child: Icon(Icons.person, color: Colors.white),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(64),
                    color: Colors.green,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Haziq Haris',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('haziq.haris@gmail.com'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showAddEventDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Add Event",
      barrierColor: Colors.black54, // background dim
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Material(
            color: Colors.transparent, // keep background transparent
            child: EventFormDialog(), // your form widget
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        ));

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}

