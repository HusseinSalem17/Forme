class ClubCardModel {
  String plan, time, price, offer;

  ClubCardModel({
    required this.plan,
    required this.time,
    required this.price,
    this.offer = '',
  });
}

List<ClubCardModel> clubCardData = [
  ClubCardModel(
      plan: 'Workout Plan', time: '3 months', price: '10', offer: '10\$'),
  ClubCardModel(
    plan: 'Fitness Plan',
    time: '1 months',
    price: '10',
  ),
  ClubCardModel(
      plan: 'Workout Plan', time: '2 months', price: '10', offer: '10\$'),
  ClubCardModel(
    plan: 'Workout Plan',
    time: '4 months',
    price: '10',
  ),
  ClubCardModel(
      plan: 'Workout Plan', time: '1 year', price: '10', offer: '10\$'),
  ClubCardModel(
    plan: 'Workout Plan',
    time: '3 months',
    price: '10',
  ),
  ClubCardModel(
    plan: 'Workout Plan',
    time: '3 months',
    price: '10',
  ),
  ClubCardModel(
      plan: 'Workout Plan', time: '3 months', price: '10', offer: '10\$'),
];
