import 'package:flutter/material.dart';

class ThumbnailImage extends StatelessWidget {
  final String? url;
  final double width;
  final double height;
  final double borderRadius;

  const ThumbnailImage({
    super.key,
    required this.url,
    this.width = 100,
    this.height = 100,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: url != null && url!.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Image.network(
                url!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.broken_image,
                      size: 40,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            )
          : Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: const Icon(
                Icons.image_not_supported,
                size: 40,
                color: Colors.grey,
              ),
            ),
    );
  }
}
