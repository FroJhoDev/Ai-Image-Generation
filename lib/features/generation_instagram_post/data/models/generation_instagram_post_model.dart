import 'dart:convert';
import 'package:ai_image_generetor/features/generation_instagram_post/domain/entities/generation_instagram_post_entity.dart';

class GenerationInstagramPostModel extends GenerationInstagramPostEntity {
  String? imageUrl;
  String? description;
  String? hashtags;
  GenerationInstagramPostModel({
    this.imageUrl,
    this.description,
    this.hashtags,
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
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      hashtags: map['hashtags'] != null ? map['hashtags'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GenerationInstagramPostModel.fromJson(String source) => GenerationInstagramPostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
