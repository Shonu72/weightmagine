class WeightModel {
  int id;
  String date;
  double weight;

  WeightModel({required this.id, required this.date, required this.weight});

  Map<String, dynamic> toMap() {
    return {'id': id, 'date': date, 'weight': weight};
  }

  static WeightModel fromMap(Map<String, dynamic> map) {
    return WeightModel(id: map['id'], date: map['date'], weight: map['weight']);
  }
}
