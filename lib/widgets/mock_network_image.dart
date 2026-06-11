import 'package:flutter/material.dart';

class MockNetworkImage extends StatelessWidget {
  const MockNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.borderRadius,
  });

  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final image = Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const _ImagePlaceholder(icon: Icons.image_outlined);
      },
      errorBuilder: (context, error, stackTrace) {
        return const _ImagePlaceholder(icon: Icons.broken_image_outlined);
      },
    );

    if (borderRadius == null) {
      return image;
    }

    return ClipRRect(
      borderRadius: borderRadius!,
      child: image,
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF141B2E),
      alignment: Alignment.center,
      child: Icon(icon, color: Colors.white70, size: 32),
    );
  }
}
