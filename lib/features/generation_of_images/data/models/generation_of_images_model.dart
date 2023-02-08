import 'dart:convert';
import '../../domain/entities/generation_of_images_entity.dart';

class GenerationOfImagesModel extends GenerationOfImagesEntity {
  String url;
  GenerationOfImagesModel({
    required this.url,
  }) : super(imageUrl: url);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
    };
  }

  factory GenerationOfImagesModel.fromMap(Map<String, dynamic> map) {
    return GenerationOfImagesModel(
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GenerationOfImagesModel.fromJson(String source) =>
      GenerationOfImagesModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
