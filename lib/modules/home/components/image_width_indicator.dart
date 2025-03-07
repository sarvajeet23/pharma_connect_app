import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarouselWithIndicator extends StatefulWidget {
  final List<String>? images;
  const ImageCarouselWithIndicator({super.key, this.images});

  @override
  State<ImageCarouselWithIndicator> createState() =>
      _ImageCarouselWithIndicatorState();
}

class _ImageCarouselWithIndicatorState
    extends State<ImageCarouselWithIndicator> {
  final List<String> defaultImages = [
    'assets/images/Rectangle 15.png',
    'assets/images/Rectangle 15.png',
    'assets/images/Rectangle 15.png',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> imageList =
        (widget.images != null && widget.images!.isNotEmpty)
            ? widget.images!
            : defaultImages;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          items:
              imageList
                  .map(
                    (path) => ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        path,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  )
                  .toList(),
          options: CarouselOptions(
            height: 250,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              imageList.asMap().entries.map((entry) {
                int idx = entry.key;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 10,
                  width: _currentIndex == idx ? 20 : 10,
                  decoration: BoxDecoration(
                    color:
                        _currentIndex == idx ? Colors.blueAccent : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
