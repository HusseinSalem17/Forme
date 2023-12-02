class ReviewModel {
  String name, imageUrl, timeAgo, review;
  double rating;
  ReviewModel(
      {required this.imageUrl,
      required this.name,
      required this.rating,
      required this.review,
      required this.timeAgo});
}

List<ReviewModel> reviewData = [
  ReviewModel(
      imageUrl: 'assets/image/m.jpg',
      name: 'ahmed Ramy',
      timeAgo: '11 months',
      review:
          'Lorem ipsum dolor sit amet consectetur. Id elit nulla consectetur hendrerit eleifend at.',
      rating: 3.5),
  ReviewModel(
      imageUrl: 'assets/image/m.jpg',
      name: 'ahmed Ramy',
      timeAgo: '11 months',
      review:
          'Lorem ipsum dolor sit amet consectetur. Id elit nulla consectetur hendrerit eleifend at.',
      rating: 3.5),
  ReviewModel(
      imageUrl: 'assets/image/m.jpg',
      name: 'ahmed Ramy',
      timeAgo: '11 months',
      review:
          'Lorem ipsum dolor sit amet consectetur. Id elit nulla consectetur hendrerit eleifend at.',
      rating: 3.5),
  ReviewModel(
      imageUrl: 'assets/image/m.jpg',
      name: 'ahmed Ramy',
      timeAgo: '11 months',
      review:
          'Lorem ipsum dolor sit amet consectetur. Id elit nulla consectetur hendrerit eleifend at.',
      rating: 3.5),
];
