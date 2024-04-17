class TrainerCardModel {
  String name, reviews;
  double rating;
  int id;
  String category;
  TrainerCardModel({
    required this.id,
    required this.category,
    required this.name,
    required this.rating,
    required this.reviews,
  });
}

List<TrainerCardModel> trainerCardModel = [
  TrainerCardModel(
    id: 0,
    category: 'Trainer',
    name: 'Hussein Salem',
    rating: 4.5,
    reviews: '60 Reviews',
  ),
  TrainerCardModel(
    id: 1,
    category: 'Trainer',
    name: 'Hussein Salem',
    rating: 4.5,
    reviews: '100 Reviews',
  ),
  TrainerCardModel(
    id: 2,
    category: 'Trainer',
    name: 'Hussein Salem',
    rating: 3.5,
    reviews: '200 Reviews',
  ),
  TrainerCardModel(
    id: 3,
    category: 'Trainer',
    name: 'Hussein Salem',
    rating: 3,
    reviews: '50 Reviews',
  ),
  TrainerCardModel(
    id: 4,
    category: 'Trainer',
    name: 'Hussein Salem',
    rating: 3.9,
    reviews: '100 Reviews',
  ),
  TrainerCardModel(
    id: 5,
    category: 'Trainer',
    name: 'Hussein Salem',
    rating: 4.8,
    reviews: '100 Reviews',
  ),
  TrainerCardModel(
    id: 6,
    category: 'Trainer',
    name: 'Hussein Salem',
    rating: 4,
    reviews: '150 Reviews',
  ),
  TrainerCardModel(
    id: 7,
    category: 'Trainer',
    name: 'Hussein Salem',
    rating: 4.5,
    reviews: '190 Reviews',
  ),
];
