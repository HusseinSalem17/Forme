class WorkoutSearchCardModel {
  int id;
  String category;
  String typeCard, reviews, title, trainerName, price;
  bool isBestSeller;
  WorkoutSearchCardModel({
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

List<WorkoutSearchCardModel> workoutSearchCardModel = [
  WorkoutSearchCardModel(
    id: 0,
    category: 'Workout',
    typeCard: 'Yoga',
    reviews: '4.9 (17 Reviews)',
    title: 'Mindful Movement',
    trainerName: 'Hussein Salem',
    price: '\$150.00 ',
  ),
  WorkoutSearchCardModel(
    id: 1,
    category: 'Workout',
    typeCard: 'Yoga',
    reviews: '4.9 (17 Reviews)',
    title: 'Mindful Movement',
    trainerName: 'Hussein Salem',
    price: '\$150.00 ',
  ),
  WorkoutSearchCardModel(
    id: 2,
    category: 'Workout',
    typeCard: 'Yoga',
    reviews: '4.9 (17 Reviews)',
    title: 'Mindful Movement',
    trainerName: 'Hussein Salem',
    price: '\$150.00 ',
    isBestSeller: true,
  ),
  WorkoutSearchCardModel(
    id: 3,
    category: 'Workout',
    typeCard: 'Yoga',
    reviews: '4.9 (17 Reviews)',
    title: 'Mindful Movement',
    trainerName: 'Hussein Salem',
    price: '\$150.00 ',
  ),
  WorkoutSearchCardModel(
    id: 4,
    category: 'Workout',
    typeCard: 'Yoga',
    reviews: '4.9 (17 Reviews)',
    title: 'Mindful Movement',
    trainerName: 'Hussein Salem',
    price: '\$150.00 ',
    isBestSeller: true,
  ),
  WorkoutSearchCardModel(
    id: 5,
    category: 'Workout',
    typeCard: 'Yoga',
    reviews: '4.9 (17 Reviews)',
    title: 'Mindful Movement',
    trainerName: 'Hussein Salem',
    price: '\$150.00 ',
  ),
  WorkoutSearchCardModel(
    id: 6,
    category: 'Workout',
    typeCard: 'Yoga',
    reviews: '4.9 (17 Reviews)',
    title: 'Mindful Movement',
    trainerName: 'Hussein Salem',
    price: '\$150.00 ',
  ),
  WorkoutSearchCardModel(
    id: 7,
    category: 'Workout',
    typeCard: 'Yoga',
    reviews: '4.9 (17 Reviews)',
    title: 'Mindful Movement',
    trainerName: 'Hussein Salem',
    price: '\$ 150.00 ',
  ),
];
