// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class InstagramGeneration {
  String? imageUrl;
  String? description;
  String? hashtags;
  InstagramGeneration({
    this.imageUrl,
    this.description,
    this.hashtags,
  });

  InstagramGeneration copyWith({
    String? imageUrl,
    String? description,
    String? hashtags,
  }) {
    return InstagramGeneration(
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      hashtags: hashtags ?? this.hashtags,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageUrl': imageUrl,
      'description': description,
      'hashtags': hashtags,
    };
  }

  factory InstagramGeneration.fromMap(Map<String, dynamic> map) {
    return InstagramGeneration(
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      hashtags: map['hashtags'] != null ? map['hashtags'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory InstagramGeneration.fromJson(String source) => InstagramGeneration.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'InstagramGeneration(imageUrl: $imageUrl, description: $description, hashtags: $hashtags)';

  @override
  bool operator ==(covariant InstagramGeneration other) {
    if (identical(this, other)) return true;
  
    return 
      other.imageUrl == imageUrl &&
      other.description == description &&
      other.hashtags == hashtags;
  }

  @override
  int get hashCode => imageUrl.hashCode ^ description.hashCode ^ hashtags.hashCode;
}
