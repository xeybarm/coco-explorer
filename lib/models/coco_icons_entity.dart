class CocoIconsEntity {
  final String? supercategory;
  final int? id;
  final String? name;

  CocoIconsEntity({
    required this.supercategory,
    required this.id,
    required this.name,
  });

  factory CocoIconsEntity.fromJson(Map<String, dynamic> json) {
    return CocoIconsEntity(
      supercategory: json['supercategory'],
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['supercategory'] = supercategory;
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
