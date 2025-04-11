class TodoModel {
  final String id;
  final String username;
  final String description;
  final DateTime? dateTime;
  final String date;
  bool isTodo;

  TodoModel({
    required this.id,
    required this.username,
    required this.description,
    required this.dateTime,
    required this.date,
    this.isTodo = true,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      username: json['username'],
      description: json['description'],
      dateTime: json['datetime'] != null ? DateTime.tryParse(json['datetime']) : null,
      date: json['date'],
      isTodo: json['isTodo'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'description': description,
      'datetime': dateTime?.toIso8601String(),
      'date': date,
      'isTodo': isTodo,
    };
  }
}
