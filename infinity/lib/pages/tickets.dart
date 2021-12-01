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

    final String currentUserID = Authentication().getCurrentUserID;

    return StreamBuilder<QuerySnapshot>(
        stream: FirestoreService.ticketsCollection
        .doc(currentUserID)
          .collection('tickets')
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
                 return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                    child: Card(
                      child: ListTile(
                        leading: Image.asset('assets/infinity1.jpg'),
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Name: Darius'),
                            Text('Destination: Sunyani'),
                            Text('Departure: 27/11/21'),
                            Text('PickUp: Athletic'),
                            Text('TicketID:  5322145'),
                            Text('SeatNumber: 20')
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
                ),
                 );
              });
        });
  }
}
