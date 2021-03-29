class Choices {
  final List choices;

  Choices(this.choices);

  Choices.fromJson(Map<String, dynamic> json)
      : choices = json['choices'];

  Map<String, dynamic> toJson() =>
      {
        'choices': choices,
      };
}