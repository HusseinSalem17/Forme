class ClientsSubscriptionsCardsModel {
  String id;
  String clientName;
  String subscriptionType;
  String subscriptionDate;

  ClientsSubscriptionsCardsModel({
    required this.id,
    required this.clientName,
    required this.subscriptionType,
    required this.subscriptionDate,
  });
}

List<ClientsSubscriptionsCardsModel> clientsSubscriptionsCardsModel = [
  ClientsSubscriptionsCardsModel(
    id: '0',
    clientName: 'Hussein Salem',
    subscriptionType: 'Gym',
    subscriptionDate: '1 months',
  ),
  ClientsSubscriptionsCardsModel(
    id: '1',
    clientName: 'Ahmed Ramy',
    subscriptionType: 'Swimming',
    subscriptionDate: '2 months',
  ),
  ClientsSubscriptionsCardsModel(
    id: '2',
    clientName: 'Kareem mohamed',
    subscriptionType: 'Running',
    subscriptionDate: '6 months',
  ),
  ClientsSubscriptionsCardsModel(
    id: '3',
    clientName: 'Ahmed Atef',
    subscriptionType: 'Boxing',
    subscriptionDate: '2 months',
  ),
  ClientsSubscriptionsCardsModel(
    id: '4',
    clientName: 'Ahmed Awad',
    subscriptionType: 'Yoga',
    subscriptionDate: '12 months',
  ),
  ClientsSubscriptionsCardsModel(
    id: '5',
    clientName: 'Nada El-Torgoman',
    subscriptionType: 'Tennis',
    subscriptionDate: '9 months',
  ),
  ClientsSubscriptionsCardsModel(
    id: '6',
    clientName: 'Abrar Hossny',
    subscriptionType: 'Gym',
    subscriptionDate: '6 months',
  ),
  ClientsSubscriptionsCardsModel(
    id: '7',
    clientName: 'Alyaa Hussein',
    subscriptionType: 'Yoga',
    subscriptionDate: '3 months',
  ),

];
