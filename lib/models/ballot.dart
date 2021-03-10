class Ballot {
  final String id;
  final String selected;

  Ballot({this.id, this.selected});
  Ballot.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        selected = json['selected'];

  Map<String, dynamic> toJson() =>
      {
        '_id': id,
        'selected': selected,
      };
}