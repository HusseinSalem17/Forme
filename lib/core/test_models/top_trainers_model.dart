class TopTrainersModel {
  String name;
  String imageUrl;
  bool isExpert; // New field to indicate if the trainer is an expert

  TopTrainersModel({
    required this.name,
    required this.imageUrl,
    this.isExpert = false, // Default value is false
  });
}

List<TopTrainersModel> topTrainersData = [
  TopTrainersModel(
    name: 'andro',
    imageUrl: 'assets/image/1 (1).jpg',
    isExpert: true,
  ),
  TopTrainersModel(
    name: 'informa',
    imageUrl: 'assets/image/1 (2).jpg',
    isExpert: false,
  ),
  TopTrainersModel(
    name: 'momen',
    imageUrl: 'assets/image/1 (3).jpg',
    isExpert: true,
  ),
  TopTrainersModel(
    name: 'Mo Salah',
    imageUrl: 'assets/image/1 (4).jpg',
    isExpert: false,
  ),


  // Add more trainers as needed with isExpert set to true or false
];
