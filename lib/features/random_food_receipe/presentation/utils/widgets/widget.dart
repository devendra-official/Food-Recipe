import 'package:flutter/material.dart';
import 'package:food_receipe/core/theme/app_pallete.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 0.6),
      child: Chip(
        side: BorderSide.none,
        label: Text(text),
        backgroundColor: AppPallete.chipBgColor,
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CustomChip(text: "Pizza"),
          CustomChip(text: "Ice-cream"),
          CustomChip(text: "Chocolate"),
          CustomChip(text: "Drinks"),
          CustomChip(text: "Burger"),
          CustomChip(text: "Cheese"),
          CustomChip(text: "Rice"),
          CustomChip(text: "Gobi"),
        ],
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.image,
    required this.title,
    required this.id,
    required this.minutes,
    required this.onTap,
    required this.tag,
  });

  final String image;
  final String title;
  final int id;
  final String minutes;
  final Function onTap;
  final int tag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: 320,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppPallete.recipeBox),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
              tag: tag,
              child: Image.network(
                image,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ID: ${id.toString()}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.timelapse_outlined),
                      Text(
                        "${minutes}min",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomColumn extends StatelessWidget {
  const CustomColumn({super.key, required this.icon, required this.value});

  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(icon, size: 36),
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
