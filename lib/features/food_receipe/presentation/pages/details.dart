import 'package:flutter/material.dart';
import 'package:food_receipe/features/food_receipe/data/model/receipe_model.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipes.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: widget.recipes.id,
              child: Image.network(widget.recipes.image,
                  height: 254, width: double.infinity, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ingredients:",
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        widget.recipes.extendedIngredients.length, (index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                              value: isChecked[index],
                              onChanged: (value) {
                                setState(() {
                                  isChecked[index] = value;
                                });
                              }),
                          Expanded(
                            child: Text(
                              widget
                                  .recipes.extendedIngredients[index].original,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                  const SizedBox(height: 10),
                  Text("Steps:",
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        widget.recipes.analyzedInstructions.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(3),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${index + 1}) ",
                                style: Theme.of(context).textTheme.titleMedium),
                            Expanded(
                              child: Text(
                                  widget.recipes.analyzedInstructions[index]
                                      .steps,
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            ),
                          ],
                        ),
                      );
                    }),
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
