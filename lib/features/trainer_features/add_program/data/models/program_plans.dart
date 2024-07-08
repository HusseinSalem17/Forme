// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProgramPlansModel {
  final int duration;
  final String price;
  final bool? isOffer;
  final String? offerPrice;
  final String? maxTrainees;

  ProgramPlansModel({
    required this.duration,
    required this.price,
    this.isOffer,
    this.offerPrice,
    this.maxTrainees,
  });

  Map<String, dynamic> toJson() {
    return {
      "duration_in_weeks": duration,
      "price": price,
      "is_offer": isOffer,
      "offer_price": offerPrice,
      "max_trainees": maxTrainees,
    };
  }

  factory ProgramPlansModel.fromJson(Map<String, dynamic> json) {
    return ProgramPlansModel(
      duration: json["duration_in_weeks"],
      price: json["price"],
      isOffer: json["is_offer"],
      offerPrice: json["offer_price"],
      maxTrainees: json["max_trainees"],
    );
  }
}
