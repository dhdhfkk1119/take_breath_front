class CounselorModel {
  final int id;
  final String name;
  final String specialty;
  final String description;
  final int consultFee;
  final int reviewFee;
  final String badge;
  final String imageUrl;
  final bool isFavorite;

  CounselorModel({
    required this.id,
    required this.name,
    required this.specialty,
    required this.description,
    required this.consultFee,
    required this.reviewFee,
    required this.badge,
    required this.imageUrl,
    this.isFavorite = false,
  });
}
