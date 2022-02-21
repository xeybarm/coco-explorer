class ImagesEntity {
  final int? id;
  final String? cocoUrl;
  final String? flickrUrl;

  ImagesEntity({
    required this.id,
    required this.cocoUrl,
    required this.flickrUrl,
  });

  factory ImagesEntity.fromJson(Map<String, dynamic> json) {
    return ImagesEntity(
      id: json['id'],
      cocoUrl: json['coco_url'],
      flickrUrl: json['flickr_url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['coco_url'] = cocoUrl;
    data['flickr_url'] = flickrUrl;
    return data;
  }
}
