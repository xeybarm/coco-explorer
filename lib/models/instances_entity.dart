class InstancesEntity {
  final int? categoryId;
  final int? imageId;
  final String segmentation;

  InstancesEntity({
    required this.categoryId,
    required this.imageId,
    required this.segmentation,
  });

  factory InstancesEntity.fromJson(Map<String, dynamic> json) {
    return InstancesEntity(
      categoryId: json['category_id'],
      imageId: json['image_id'],
      segmentation: json['segmentation'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['image_id'] = imageId;
    data['segmentation'] = segmentation;
    return data;
  }
}
