class Program {
  final int id;
  final String title;
  final String picture;
  final String description;
  final String type;
  final int currentTraineesCount;
  final int? programCapacity;
  final List<dynamic>? programPlans;
  final double avgRatings;
  final int numberOfRatings;
  final DateTime createdAt;
  final DateTime updatedAt;

  Program({
    required this.id,
    required this.title,
    required this.picture,
    required this.description,
    required this.type,
    required this.currentTraineesCount,
    this.programCapacity,
    this.programPlans,
    required this.avgRatings,
    required this.numberOfRatings,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      id: json['id'],
      title: json['title'],
      picture: json['picture'],
      description: json['description'],
      type: json['type'],
      currentTraineesCount: json['current_trainees_count'],
      programCapacity: json['program_capacity'],
      programPlans: json['program_plans'],
      avgRatings: json['avg_ratings'],
      numberOfRatings: json['number_of_ratings'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'picture': picture,
      'description': description,
      'type': type,
      'current_trainees_count': currentTraineesCount,
      'program_capacity': programCapacity,
      'program_plans': programPlans,
      'avg_ratings': avgRatings,
      'number_of_ratings': numberOfRatings,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
