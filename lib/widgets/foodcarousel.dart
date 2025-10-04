import 'package:flutter/material.dart';
import 'package:snackish/data/foodItems.dart';
import 'package:snackish/widgets/fooddetailview.dart';

class FoodCarousel extends StatelessWidget {
  const FoodCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: foodItems.length, // ← dynamisch
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final item = foodItems[index]; // ← Zugriff auf FoodItem

          return SingleFoodItem(item: item);
        },
      ),
    );
  }
}

class SingleFoodItem extends StatelessWidget {
  const SingleFoodItem({
    super.key,
    required this.item,
  });

  final FoodItem item;

  void _showOverlay(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FoodDetailView(item: item),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showOverlay(context),
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(255, 255, 255, 0.2),
              Color(0xFF908CF5),
              Color(0xFF8C5BEA),
            ],
            stops: [0.07, 0.61, 1.0],
          ),
          border: Border.all(
            color: Colors.white.withAlpha(128),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(22),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Image.asset(
                item.imageName ?? '',
                width: 160,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name ?? 'Kein Name definiert!',
                    style: const TextStyle(
                      fontFamily: 'SFPro',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    item.shortDescription ?? 'Kein Name definiert!',
                    style: const TextStyle(
                      fontFamily: 'SFPro',
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '􁑐 ${item.price?.toStringAsFixed(2) ?? '--'}',
                        style: const TextStyle(
                          fontFamily: 'SFPro',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 80),
                       Text(
                        '􀊴 ${item.rating ?? '--'}',
                        style: TextStyle(
                          fontFamily: 'SFPro',
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
