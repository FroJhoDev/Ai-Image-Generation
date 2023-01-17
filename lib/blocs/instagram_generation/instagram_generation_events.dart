abstract class InstagramGenerationEvents {}

class GenerateInstagramPost extends InstagramGenerationEvents {
  String imageText;
  String descriptionText;
  String hashtagsText;

  GenerateInstagramPost(
      {required this.imageText,
      required this.descriptionText,
      required this.hashtagsText});
}

class ClearInstagramPostsResults extends InstagramGenerationEvents {}
