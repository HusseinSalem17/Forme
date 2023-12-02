class TraineesIconModel {
  String icon, number, type;

  TraineesIconModel(
      {required this.icon, required this.number, required this.type});
}

List<TraineesIconModel> traineesIconData = [
  TraineesIconModel(icon: 'trainees', number: '7500+', type: 'Trainees'),
  TraineesIconModel(icon: 'yearExp', number: '10+', type: 'Years Exp'),
  TraineesIconModel(icon: 'rating', number: '4.9+', type: 'Rating'),
  TraineesIconModel(icon: 'review', number: '4,956', type: 'Review'),
];
