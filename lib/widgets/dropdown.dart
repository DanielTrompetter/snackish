import 'dart:ui';
import 'package:flutter/material.dart';

class SnackCategoryDropdown extends StatelessWidget {
  SnackCategoryDropdown({super.key});

  final List<Map<String, bool>> categories = [
    {'Salty': true},
    {'Sweet': false},
    {'Drinks': false},
    {'Frozen': false},
    {'Hot': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Fixer Button links
        CatSelector(),

        // Scrollbare Kategorie-Liste rechts
        Expanded(
          child: SizedBox(
            height: 50,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final entry = categories[index].entries.first;
                return SingleCatButton(
                  title: entry.key,
                  isSelected: entry.value,
                  onTap: () {
                    // Alles nur Dummy-Logik!!!
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 12),
            ),
          ),
        ),
      ],
    );
  }
}


class CatSelector extends StatelessWidget {
  const CatSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Hintergrund-Blur
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: -80, sigmaY: 80),
              child: Container(
                width: 160,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(10), 
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withAlpha(127),
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          // Inhalt darüber
          Container(
            width: 160,
            height: 50,
            padding: const EdgeInsets.only(left: 10),
            
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '􀻐 All categories',
                  style: TextStyle(
                    fontFamily: 'SFPro',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, color: Colors.grey[700]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SingleCatButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const SingleCatButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isSelected
        ? Colors.white.withAlpha(140)
        : Colors.white.withAlpha(15);

    final borderColor = isSelected
        ? Colors.white
        : Colors.white.withAlpha(30);

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: Alignment.center,
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
              child: Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: borderColor, width: 1),
                ),
              ),
            ),
            Container(
              width: 100,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'SFPro',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
