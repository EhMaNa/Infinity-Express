class Ticket {
  final String? ticketID, pickUp, destination, name, seatNumber, lagguage, departure;
  Ticket({
    this.destination,
    this.name,
    this.pickUp,
    this.ticketID,
    this.seatNumber,
    this.lagguage,
    this.departure
  });

  static Ticket fromMap(Map<String, dynamic> map) {
    return Ticket(
        name: map['name'],
        destination: map['destination'],
        pickUp: map['pickUp'],
        seatNumber: map['seatNumber'],
        ticketID: map['ticketID'],
        lagguage: map['lagguage'],
        departure: map['departure']);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'destination': destination,
      'name': name,
      'pickUp': pickUp,
      'seatNumber': seatNumber,
      'ticketID': ticketID,
      'lagguage': lagguage,
        'departure': departure,

    };
    return map;
  }
}
