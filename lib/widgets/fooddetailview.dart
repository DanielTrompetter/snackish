import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:snackish/data/foodItems.dart';
import 'package:snackish/helpers/texthelper.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodDetailView extends StatelessWidget {
  final FoodItem item;

  const FoodDetailView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.93,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Hintergrund-Container (optional)
          Container(
            margin: const EdgeInsets.only(top: 100),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            padding: const EdgeInsets.fromLTRB(24, 100, 24, 24),
          ),

          // Close-Button oben rechts
          Transform.translate(
            offset: const Offset(360, 100),
            child: IconButton(
              icon: const Icon(Icons.close),
              color: Colors.white,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),

          // Bild überlappend, pointer-durchlässig
          IgnorePointer(
            child: Transform.translate(
              offset: const Offset(0, -270),
              child: Center(
                child: Image.asset(
                  item.imageName ?? '',
                  width: 400,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Blur-Box mit Inhalt, zentriert und mit Padding
          Padding(
            padding: const EdgeInsets.only(top: 260, left: 30, right: 30),
            child: Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    height: 660,
                    color: Colors.black.withAlpha(3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SFText(
                              text: '􀊴 ${item.rating ?? '--'}',
                              weight: FontWeight.w900,
                              size: 12,
                              color: Colors.white,
                              align: TextAlign.center
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        InterText(
                          text: item.name ?? 'Kein Name',
                          weight: FontWeight.w900,
                          size: 28,
                          color: Colors.white,
                          align: TextAlign.center
                        ),
                        const SizedBox(height: 12),
                        InterText(
                          text: item.longDescription ?? 'Keine Beschreibung',
                          weight: FontWeight.normal,
                          size: 14,
                          color: Colors.white,
                          align: TextAlign.center
                        ),
                        const SizedBox(height: 20),
                        SFText(
                          text: '􁑐 ${item.price?.toStringAsFixed(2) ?? '--'}',
                          weight: FontWeight.bold,
                          size: 20,
                          color: Colors.white,
                          align: TextAlign.center
                        ),
                        const SizedBox(height: 20),
                        IngredientsAndRatingBox(item: item),
                        const SizedBox(height: 20),
                        OrderFooterBar(item: item),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IngredientsAndRatingBox extends StatelessWidget {
  final FoodItem item;

  const IngredientsAndRatingBox({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 90,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFFFFFF), // Helle Kante oben
            Color(0x00000000), // Hauptfarbe
          ],
          stops: [0.0, 0.02],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: SFText(
                  text: 'Ingredients',
                  weight: FontWeight.w200,
                  size: 16,
                  color: Colors.white.withAlpha(192),
                  align: TextAlign.left,
                ),
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 8,
                  children: const [
                    SmallIcon(assetPath: 'assets/icons/Glutenfree.svg'),
                    SmallIcon(assetPath: 'assets/icons/Sugar.svg'),
                    SmallIcon(assetPath: 'assets/icons/LowFat.svg'),
                    SmallIcon(assetPath: 'assets/icons/Kcal.svg'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(width: 60),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: SFText(
                  text: 'Reviews',
                  weight: FontWeight.w200,
                  size: 16,
                  color: Colors.white.withAlpha(192),
                  align: TextAlign.left,
                ),
              ),
              const SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 4,
                  children: [
                    StarIcon(assetPath: item.stars! >=1 ? 'assets/icons/StarFilled.svg':'assets/icons/StarEmpty.svg'),
                    StarIcon(assetPath: item.stars! >=2 ? 'assets/icons/StarFilled.svg':'assets/icons/StarEmpty.svg'),
                    StarIcon(assetPath: item.stars! >=3 ? 'assets/icons/StarFilled.svg':'assets/icons/StarEmpty.svg'),
                    StarIcon(assetPath: item.stars! >=4 ? 'assets/icons/StarFilled.svg':'assets/icons/StarEmpty.svg'),
                    StarIcon(assetPath: item.stars! >=5 ? 'assets/icons/StarFilled.svg':'assets/icons/StarEmpty.svg'),
                    SFText(
                      text: '${item.averageReview ?? '--'}',
                      weight: FontWeight.w200,
                      size: 16,
                      color: Colors.white.withAlpha(192),
                      align: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SmallIcon extends StatelessWidget {
  final String assetPath;

  const SmallIcon({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      height: 16,
      child: SvgPicture.asset(
        assetPath,
        fit: BoxFit.contain,
      ),
    );
  }
}

class StarIcon extends StatelessWidget {
  final String assetPath;

  const StarIcon({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 12,
      height: 12,
      child: SvgPicture.asset(
        assetPath,
        fit: BoxFit.contain,
      ),
    );
  }
}

class OrderFooterBar extends StatefulWidget {
  final FoodItem item;
  const OrderFooterBar({super.key, required this.item});

  @override
  State<OrderFooterBar> createState() => _OrderFooterBarState();
}

class _OrderFooterBarState extends State<OrderFooterBar> {
  int count = 1;
  String selectedSize = 'Large';

  void _changeCount(int delta) {
    setState(() {
      count = (count + delta).clamp(1, 9); // Maximal 9 für den größten Hunger 😄
    });
  }

  void _selectSize(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice = (widget.item.price! * count).toStringAsFixed(2);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // SizeChooser + Counter nebeneinander
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // SizeChooser links
              Container(
                padding: const EdgeInsets.all(4), // Optional: etwas Innenabstand
                decoration: BoxDecoration(
                  color: Colors.grey[850], // Dunkelgrau
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Row(
                  children: ['Small', 'Medium', 'Large'].map((size) {
                    final isSelected = selectedSize == size;
                    return ChoiceChip(
                      label: Text(size),
                      selected: isSelected,
                      onSelected: (_) => _selectSize(size),
                      selectedColor: const Color(0xFF636366),
                      backgroundColor: Colors.grey[850],
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey[300],
                        fontWeight: FontWeight.w600,
                      ),
                      visualDensity: const VisualDensity(horizontal: -4, vertical: -1),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: isSelected ? BorderRadius.circular(7) : BorderRadius.zero,
                        side: BorderSide(color: Colors.transparent, width: 0),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Spacer(),
              // Counter rechts
              Row(
                children: [
                  SizedBox(
                    width: 32,
                    height: 32,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.remove, size: 16, color: Colors.white),
                        onPressed: () => _changeCount(-1),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(), // entfernt Standardgröße
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  SFText(
                    text: '$count',
                    size: 18,
                    color: Colors.white,
                    weight: FontWeight.bold,
                    align: TextAlign.center,
                  ),
                  SizedBox(width: 8),
                  SizedBox(
                    width: 32,
                    height: 32,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.add, size: 16, color: Colors.white),
                        onPressed: () => _changeCount(1),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(), // entfernt Standardgröße
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          // Preisbutton unten
          SizedBox(
            width: double.infinity,
            height: 56, // ← Wichtig! Sonst bleibt alles unsichtbar
            child: Stack(
              children: [
                // Hintergrundgradient
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFE970C4),
                        Color(0xFFF69EA3),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                // Button
                Positioned.fill(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.zero, // ← Padding ist schon durch height abgedeckt
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      'Add to order for ₳$totalPrice',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
