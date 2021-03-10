class Ballot {
  final String _id;
  final String selected;

  Ballot(this._id, this.selected);
  Ballot.fromJson(Map<String, dynamic> json)
      : _id = json['_id'],
        selected = json['selected'];

  Map<String, dynamic> toJson() =>
      {
        '_id': _id,
        'selected': selected,
      };
}