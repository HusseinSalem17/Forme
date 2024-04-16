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
    imageUrl: 'assets/image/andro.jpg',
    isExpert: true,
  ),
  TopTrainersModel(
    name: 'informa',
    imageUrl: 'assets/image/informa.jpg',
    isExpert: false,
  ),
  TopTrainersModel(
    name: 'momen',
    imageUrl: 'assets/image/momen.jpg',
    isExpert: true,
  ),
  TopTrainersModel(
    name: 'Mo Salah',
    imageUrl: 'assets/image/m.jpg',
    isExpert: false,
  ),
  TopTrainersModel(
    name: 'Cristiano',
    imageUrl: 'assets/image/th.jpg',
    isExpert: true,
  ),

  TopTrainersModel(
    name: 'youssef',
    imageUrl: 'assets/image/youssef.jpg',
    isExpert: false,
  ),
  TopTrainersModel(
    name: 'Mo Salah',
    imageUrl: 'assets/image/m.jpg',
    isExpert: true,
  ),
  TopTrainersModel(
    name: 'Cristiano',
    imageUrl: 'assets/image/th.jpg',
    isExpert: true,
  ),
  TopTrainersModel(
    name: 'andro',
    imageUrl: 'assets/image/andro.jpg',
    isExpert: false,
  ),
  TopTrainersModel(
    name: 'informa',
    imageUrl: 'assets/image/informa.jpg',
    isExpert: false,
  ),
  TopTrainersModel(
    name: 'momen',
    imageUrl: 'assets/image/momen.jpg',
    isExpert: true,
  ),
  TopTrainersModel(
    name: 'youssef',
    imageUrl: 'assets/image/youssef.jpg',
    isExpert: false,
  ),
  // Add more trainers as needed with isExpert set to true or false
];
