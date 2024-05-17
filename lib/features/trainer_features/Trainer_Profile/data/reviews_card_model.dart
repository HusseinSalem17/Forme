class ReviewsCardModel {
  String name;
  String reviewDescription;
  double rating;
  String date;
  String image;

  ReviewsCardModel(
      {required this.name,
      required this.reviewDescription,
      required this.rating,
      required this.date,
      required this.image});
}

List<ReviewsCardModel> reviewsCardModel = [
  ReviewsCardModel(
    name: 'Hussein Salem',
    reviewDescription:
        'Lorem ipsum dolor sit amet consectetur. Id elit nulla consectetur hendrerit eleifend at.',
    rating: 3.5,
    date: '11 months ago',
    image: 'assets/image/workout_image.jpg',
  ),
  ReviewsCardModel(
    name: 'Kareem Mohamed',
    reviewDescription:
        'Lorem ipsum dolor sit amet consectetur. Id elit nulla consectetur hendrerit eleifend at.',
    rating: 4.5,
    date: '12 months ago',
    image: 'assets/image/workout_image.jpg',
  ),
  ReviewsCardModel(
    name: 'Ahmed Ramy',
    reviewDescription:
        'Lorem ipsum dolor sit amet consectetur. Id elit nulla consectetur hendrerit eleifend at.',
    rating: 2,
    date: '6 months ago',
    image: 'assets/image/workout_image.jpg',
  ),
  ReviewsCardModel(
    name: 'Abrar Hosny',
    reviewDescription:
        'Lorem ipsum dolor sit amet consectetur. Id elit nulla consectetur hendrerit eleifend at.',
    rating: 4.5,
    date: '5 months ago',
    image: 'assets/image/workout_image.jpg',
  ),
  ReviewsCardModel(
    name: 'Alyaa Hussein',
    reviewDescription:
        'Lorem ipsum dolor sit amet consectetur. Id elit nulla consectetur hendrerit eleifend at.',
    rating: 4,
    date: '8 months ago',
    image: 'assets/image/workout_image.jpg',
  ),
  ReviewsCardModel(
    name: 'Ahmed Atef',
    reviewDescription:
        'Lorem ipsum dolor sit amet consectetur. Id elit nulla consectetur hendrerit eleifend at.',
    rating: 3,
    date: '11 months ago',
    image: 'assets/image/workout_image.jpg',
  ),
  ReviewsCardModel(
    name: 'Ahmed Awad',
    reviewDescription:
        'Lorem ipsum dolor sit amet consectetur. Id elit nulla consectetur hendrerit eleifend at.',
    rating: 2.5,
    date: '11 months ago',
    image: 'assets/image/workout_image.jpg',
  ),
  ReviewsCardModel(
    name: 'Nada El-Torgoman',
    reviewDescription:
        'Lorem ipsum dolor sit amet consectetur. Id elit nulla consectetur hendrerit eleifend at.',
    rating: 3.5,
    date: '10 months ago',
    image: 'assets/image/workout_image.jpg',
  ),
];
