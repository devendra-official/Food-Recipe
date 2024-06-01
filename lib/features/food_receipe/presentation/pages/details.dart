import 'package:flutter/material.dart';
import 'package:food_receipe/features/food_receipe/data/model/receipe_model.dart';
import 'package:food_receipe/features/food_receipe/presentation/utils/widgets/widget.dart';

class Details extends StatefulWidget {
  const Details({required this.recipes, super.key});

  final Recipes recipes;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late List<bool?> isChecked = List.generate(
      widget.recipes.extendedIngredients.length, (index) => false);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Hero(
                  tag: widget.recipes.id,
                  child: Image.asset(
                    "assets/images/goku.png",
                    // widget.recipes.image,
                    height: size.height / 2,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                IconButton(
                  onPressed: () {
                  Navigator.of(context).pop();
                }, icon: const Icon(Icons.arrow_back_ios_new)),
                Positioned(
                  bottom: -50,
                  left: size.width / 20,
                  right: size.width / 20,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 6,
                          blurStyle: BlurStyle.outer,
                          spreadRadius: 0.5,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomColumn(
                          icon: Icons.health_and_safety_outlined,
                          value: widget.recipes.healthScore.toString(),
                        ),
                        CustomColumn(
                          icon: Icons.favorite_outline,
                          value: widget.recipes.aggregateLikes.toString(),
                        ),
                        CustomColumn(
                          icon: Icons.timelapse_outlined,
                          value: "${widget.recipes.minutes}min",
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 70),
            // Column(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(8),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text("Ingredients:",
            //               style: Theme.of(context).textTheme.headlineSmall),
            //           const SizedBox(height: 10),
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: List.generate(
            //                 widget.recipes.extendedIngredients.length, (index) {
            //               return Row(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Checkbox(
            //                       value: isChecked[index],
            //                       onChanged: (value) {
            //                         setState(() {
            //                           isChecked[index] = value;
            //                         });
            //                       }),
            //                   Expanded(
            //                     child: Text(
            //                       widget.recipes.extendedIngredients[index]
            //                           .original,
            //                       style:
            //                           Theme.of(context).textTheme.titleMedium,
            //                     ),
            //                   ),
            //                 ],
            //               );
            //             }),
            //           ),
            //           const SizedBox(height: 10),
            //           Text("Steps:",
            //               style: Theme.of(context).textTheme.headlineSmall),
            //           const SizedBox(height: 10),
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: List.generate(
            //                 widget.recipes.analyzedInstructions.length,
            //                 (index) {
            //               return Padding(
            //                 padding: const EdgeInsets.all(3),
            //                 child: Row(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Text("${index + 1}) ",
            //                         style: Theme.of(context)
            //                             .textTheme
            //                             .titleMedium),
            //                     Expanded(
            //                       child: Text(
            //                           widget.recipes.analyzedInstructions[index]
            //                               .steps,
            //                           style: Theme.of(context)
            //                               .textTheme
            //                               .titleMedium),
            //                     ),
            //                   ],
            //                 ),
            //               );
            //             }),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
