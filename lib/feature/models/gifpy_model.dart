class GifModel {
  final String id;
  final String url;

  GifModel({
    required this.id,
    required this.url,
  });

  factory GifModel.fromJson(Map<String, dynamic> json) {
    return GifModel(
      id: json['id'],
      url: json['images']['downsized']['url'],
    );
  }
}
