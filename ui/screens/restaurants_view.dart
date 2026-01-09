import 'package:final_exam/models/restaurant_type.dart';
import 'package:final_exam/ui/screens/restaurant_comments_view.dart';
import 'package:final_exam/ui/widgets/chip/restaurant_type_chip.dart';
import 'package:final_exam/ui/widgets/chip/stars_chip.dart';
import 'package:flutter/material.dart';

import '../../models/restaurant.dart';
import '../theme.dart';

class RestaurantsView extends StatefulWidget {
  const RestaurantsView({super.key, required this.restaurants});

  final List<Restaurant> restaurants;

  @override
  State<RestaurantsView> createState() => _RestaurantsViewState();
}

class _RestaurantsViewState extends State<RestaurantsView> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        title: const Text('Miam'),
      ),

      body: Column(
        children: [
          Row(
            children: [
              Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
              Text("Only Khmer food"),
            ],
          ),
          Expanded(
            child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
              itemCount: widget.restaurants.length,
              itemBuilder: (context, index) {
                Restaurant restaurant = widget.restaurants[index];
                if (isChecked && restaurant.type != RestaurantType.khmer) {
                  return SizedBox.shrink();
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                  child: RestaurantCard(restaurant: widget.restaurants[index]),
                );
              }
            ),
          ),
          )
        ],
      )
    );
  }
}

class RestaurantCard extends StatefulWidget {
  final Restaurant restaurant;
  
  const RestaurantCard({
    super.key,
    required this.restaurant
  });

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.restaurant.name,
              style: const TextStyle(
                fontSize: 20
              ),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StarsChip(rating: widget.restaurant.getRating()),
                const SizedBox(width: 16),
                RestaurantTypeChip(
                  label: widget.restaurant.type.name, 
                  color: widget.restaurant.type.color
                )
              ],
            )
          ],
        ),
      ),
      onTap: () async {
        await Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (_) => RestaurantCommentsView(restaurant: widget.restaurant)
          ),
        );
        setState(() {});
      },
    );
    
  }
}

