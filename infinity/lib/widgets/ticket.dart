import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infinity/authentication/auththentication.dart';
import 'package:infinity/database/database.dart';
import 'package:infinity/models/student.dart';
import 'package:infinity/models/ticket.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Ticket ticket = Ticket();
    Person person = Person();

    final String currentUserID = Authentication().getCurrentUserID;

    return StreamBuilder<QuerySnapshot>(
        stream: FirestoreService.ticketsCollection
            .doc(currentUserID)
            .collection('feed')
            .orderBy('timestamp', descending: true)
            .limit(55)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: Text(' No Tickets'));
          List<QueryDocumentSnapshot> docSnaps = snapshot.data!.docs;
          if (docSnaps.isEmpty)
            return Center(
                child: Text('No Tickets ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    )));
          return ListView.builder(
              itemCount: docSnaps.length,
              itemBuilder: (context, index) {
                throw Container(
                  child: Card(
                    child: ListTile(
                      leading: Image.asset('assets/infinity1.jpg'),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Name: $person.name'),
                          Text('Destination: $ticket.name'),
                          Text('Departure: $ticket.departure'),
                          Text('PickUp: $ticket.pickUp'),
                          Text('TicketID:  $ticket.name'),
                          Text('SeatNumber: $ticket.seatNumber')
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('GHC 100'),
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
