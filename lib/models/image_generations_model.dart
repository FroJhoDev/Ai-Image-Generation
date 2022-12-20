import 'dart:convert';

class ImageGenerationsModel {
  String? url;

  ImageGenerationsModel({
    this.url,
  });

  ImageGenerationsModel copyWith({
    String? url,
  }) {
    return ImageGenerationsModel(
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
    };
  }

  factory ImageGenerationsModel.fromMap(Map<String, dynamic> map) {
    return ImageGenerationsModel(
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageGenerationsModel.fromJson(String source) => ImageGenerationsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ImageGenerationsModel(url: $url)';

  @override
  bool operator ==(covariant ImageGenerationsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.url == url;
  }

  @override
  int get hashCode => url.hashCode;
}
