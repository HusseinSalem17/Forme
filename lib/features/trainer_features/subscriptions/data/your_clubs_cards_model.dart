class YourClubsCardsModel {
  String title, address, category;
  int id, numClients;

  YourClubsCardsModel({
    required this.id,
    required this.category,
    required this.title,
    required this.address,
    required this.numClients,
  });
}

List<YourClubsCardsModel> yourClubsCardsModel = [
  YourClubsCardsModel(
    id: 0,
    category: 'your Clubs',
    title: 'Pulse Fitness Center',
    address: 'Port Said, EGY',
    numClients: 230,
  ),
  YourClubsCardsModel(
    id: 1,
    category: 'Your Clubs',
    title: 'Pulse Fitness Center',
    address: 'Cairo, EGY',
    numClients: 150,
  ),
  YourClubsCardsModel(
    id: 2,
    category: 'Your Clubs',
    title: 'Pulse Fitness Center',
    address: 'Port Said, EGY',
    numClients: 150,
  ),
  YourClubsCardsModel(
    id: 3,
    category: 'Your Clubs',
    title: 'Pulse Fitness Center',
    address: 'Cairo, EGY',
    numClients: 120,
  ),
  YourClubsCardsModel(
    id: 4,
    category: 'Your Clubs',
    title: 'Pulse Fitness Center',
    address: 'Cairo, EGY',
    numClients: 140,
  ),
  YourClubsCardsModel(
    id: 5,
    category: 'Your Clubs',
    title: 'Pulse Fitness Center',
    address: 'Port Said, EGY',
    numClients: 150,
  ),
  YourClubsCardsModel(
    id: 6,
    category: 'Your Clubs',
    title: 'Pulse Fitness Center',
    address: 'Cairo, EGY',
    numClients: 100,
  ),
];
