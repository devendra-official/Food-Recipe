import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_receipe/features/random_food_receipe/data/model/receipe_model.dart';
import 'package:food_receipe/features/random_food_receipe/presentation/cubit/receipe_cubit.dart';
import 'package:food_receipe/features/random_food_receipe/presentation/pages/details.dart';
import 'package:food_receipe/features/random_food_receipe/presentation/utils/widgets/widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text("Categories",
            //     style: Theme.of(context)
            //         .textTheme
            //         .headlineSmall!
            //         .copyWith(fontWeight: FontWeight.bold)),
            // const SizedBox(height: 10),
            // const Categories(),
            BlocConsumer<ReceipeCubit, ReceipeState>(
              listener: (context, state) {
                if (state is ReceipeFailure) {}
              },
              builder: (context, state) {
                if (state is ReceipeSucess) {
                  List<Recipes> recipe = state.receipeModel.recipes;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: recipe.length,
                      itemBuilder: (context, index) {
                        return RecipeCard(
                          tag: recipe[index].id,
                          onTap: () => {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return Details(recipes: recipe[index]);
                            }))
                          },
                          image: recipe[index].image,
                          title: recipe[index].title,
                          id: recipe[index].id,
                          minutes: recipe[index].minutes.toString(),
                        );
                      },
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
