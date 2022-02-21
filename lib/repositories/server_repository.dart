import 'dart:convert';
import 'package:coco_app/constants/urls.dart';
import 'package:coco_app/models/images_entity.dart';
import 'package:http/http.dart';
import '../models/instances_entity.dart';

class ServerRepository {
  final cl = Client();

  Future<List<dynamic>> getImagesByCats(int categoryId) async {
    final _bodyMap = {
      'category_ids': [categoryId],
      'querytype': 'getImagesByCats',
    };

    final _json = jsonEncode(_bodyMap);

    final _response = await cl.post(
        Uri.parse(
            'https://us-central1-open-images-dataset.cloudfunctions.net/coco-dataset-bigquery'),
        body: _json,
        headers: Map.from(AppURLs.headersImage));

    List<dynamic> _imageByCatsList = (jsonDecode(_response.body)).toList()
      ..shuffle();

    return _imageByCatsList;
  }

  Future<List<ImagesEntity?>> getImages(List<dynamic> imageByCatsList) async {
    final _bodyMap = {
      'image_ids': [
        imageByCatsList[0],
        imageByCatsList[1],
        imageByCatsList[2],
        imageByCatsList[3],
        imageByCatsList[4]
      ],
      'querytype': 'getImages',
    };

    final _json = jsonEncode(_bodyMap);

    final _response = await cl.post(
        Uri.parse(
            'https://us-central1-open-images-dataset.cloudfunctions.net/coco-dataset-bigquery'),
        body: _json,
        headers: Map.from(AppURLs.headersImage));

    List<ImagesEntity?>? _imageList = (jsonDecode(_response.body) as List)
        .map((e) =>
            e == null ? null : ImagesEntity.fromJson(e as Map<String, dynamic>))
        .toList();

    _imageList.removeWhere((e) => e == null);

    return _imageList;
  }

  Future<List<InstancesEntity?>?> getInstances(
      List<dynamic> imageByCatsList) async {
    final _bodyMap = {
      'image_ids': [
        imageByCatsList[0],
        imageByCatsList[1],
        imageByCatsList[2],
        imageByCatsList[3],
        imageByCatsList[4]
      ],
      'querytype': 'getInstances',
    };

    final _json = jsonEncode(_bodyMap);

    final _response = await cl.post(
        Uri.parse(
            'https://us-central1-open-images-dataset.cloudfunctions.net/coco-dataset-bigquery'),
        body: _json,
        headers: Map.from(AppURLs.headersImage));

    if (_response.successResponse) {
      List<InstancesEntity?>? _instanceList =
          (jsonDecode(_response.body) as List)
              .map((e) => e == null
                  ? null
                  : InstancesEntity.fromJson(e as Map<String, dynamic>))
              .toList();

      _instanceList.removeWhere((e) => e == null);

      return _instanceList;
    }
    return null;
  }
}

extension DioResponseExtension on Response {
  bool get successResponse => statusCode >= 200 && statusCode < 400;
}
