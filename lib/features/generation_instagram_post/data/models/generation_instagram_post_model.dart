import 'dart:convert';
import '../../domain/entities/generation_instagram_post_entity.dart';

class GenerationInstagramPostModel extends GenerationInstagramPostEntity {
  String imageUrl;
  String description;
  String hashtags;
  GenerationInstagramPostModel({
    required this.imageUrl,
    required this.description,
    required this.hashtags,
  }) : super(
            postImage: imageUrl,
            postDescription: description,
            postHashtags: hashtags);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageUrl': imageUrl,
      'description': description,
      'hashtags': hashtags,
    };
  }

  factory GenerationInstagramPostModel.fromMap(Map<String, dynamic> map) {
    return GenerationInstagramPostModel(
      imageUrl: map['imageUrl'] as String,
      description: map['description'] as String,
      hashtags: map['hashtags'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GenerationInstagramPostModel.fromJson(String source) =>
      GenerationInstagramPostModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
