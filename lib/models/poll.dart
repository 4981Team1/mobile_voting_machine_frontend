/*
 Poll object conversion
*/
class Poll {
  final String id;
  final String details;
  final List choices;

  Poll({this.id, this.details, this.choices});

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'details' : details,
    'choices' : choices,
  };

  factory Poll.fromJson(Map<String, dynamic> json) {
    return Poll(
      id: json['_id'],
      details: json['details'],
      choices: json['choices'],
    );
  }
}
