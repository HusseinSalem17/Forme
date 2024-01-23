class WorkoutCardModel {
  int id;
  String category;
  String typeCard, reviews, title, trainerName, price;
  bool isBestSeller;
  WorkoutCardModel({
    required this.id,
    required this.category,
    required this.typeCard,
    required this.reviews,
    required this.title,
    required this.trainerName,
    required this.price,
    this.isBestSeller = false,
  });
}

List<WorkoutCardModel> workoutCardData = [
  WorkoutCardModel(
    id: 0,
    category: 'Workout',
    typeCard: 'Yoga',
    reviews: '4.9 (17 Reviews)',
    title: 'Mindful Movement',
    trainerName: 'Hussein Salem',
    price: '\$150.00 ',
  ),
  WorkoutCardModel(
    id: 1,
    category: 'Workout',
    typeCard: 'Yoga',
    reviews: '4.9 (17 Reviews)',
    title: 'Mindful Movement',
    trainerName: 'Hussein Salem',
    price: '\$150.00 ',
  ),
  WorkoutCardModel(
    id: 2,
    category: 'Workout',
    typeCard: 'Yoga',
    reviews: '4.9 (17 Reviews)',
    title: 'Mindful Movement',
    trainerName: 'Hussein Salem',
    price: '\$150.00 ',
    isBestSeller: true,
  ),
  WorkoutCardModel(
    id: 3,
    category: 'Workout',
    typeCard: 'Yoga',
    reviews: '4.9 (17 Reviews)',
    title: 'Mindful Movement',
    trainerName: 'Hussein Salem',
    price: '\$150.00 ',
  ),
  WorkoutCardModel(
    id: 4,
    category: 'Workout',
    typeCard: 'Yoga',
    reviews: '4.9 (17 Reviews)',
    title: 'Mindful Movement',
    trainerName: 'Hussein Salem',
    price: '\$150.00 ',
    isBestSeller: true,
  ),
  WorkoutCardModel(
    id: 5,
    category: 'Workout',
    typeCard: 'Yoga',
    reviews: '4.9 (17 Reviews)',
    title: 'Mindful Movement',
    trainerName: 'Hussein Salem',
    price: '\$150.00 ',
  ),
  WorkoutCardModel(
    id: 6,
    category: 'Workout',
    typeCard: 'Yoga',
    reviews: '4.9 (17 Reviews)',
    title: 'Mindful Movement',
    trainerName: 'Hussein Salem',
    price: '\$150.00 ',
  ),
  WorkoutCardModel(
    id: 7,
    category: 'Workout',
    typeCard: 'Yoga',
    reviews: '4.9 (17 Reviews)',
    title: 'Mindful Movement',
    trainerName: 'Hussein Salem',
    price: '\$ 150.00 ',
  ),
];
