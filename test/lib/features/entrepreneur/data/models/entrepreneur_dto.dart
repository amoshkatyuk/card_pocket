class EntrepreneurDto {
  final String surname;
  final String name;
  final String patronymic;
  final String birthdate;

  EntrepreneurDto({
    required this.surname,
    required this.name,
    required this.patronymic,
    required this.birthdate,
});

  Map<String, dynamic> toJson() => {
    'surname' : surname,
    'name' : name,
    'patronymic' : patronymic,
    'birthdate' : birthdate,
  };
}