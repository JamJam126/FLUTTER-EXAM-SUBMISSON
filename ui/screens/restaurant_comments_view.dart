import 'package:final_exam/models/restaurant.dart';
import 'package:final_exam/ui/screens/restaurant_comments_form.dart';
import 'package:final_exam/ui/widgets/chip/restaurant_type_chip.dart';
import 'package:final_exam/ui/widgets/chip/stars_chip.dart';
import 'package:flutter/material.dart';

class RestaurantCommentsView extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantCommentsView({super.key, required this.restaurant});

  @override
  State<RestaurantCommentsView> createState() => _RestaurantCommentsViewState();
}

class _RestaurantCommentsViewState extends State<RestaurantCommentsView> {
  void onCloseModal(BuildContext context) {
    Navigator.pop(context);
  }

  void onAddComment(BuildContext context) async {
    final data = await showModalBottomSheet(
      isScrollControlled: false,
      context: context,
      builder: (c) => CommentForm()
    );

    if (data != null) {
      setState(() {
        widget.restaurant.comments.add(data);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(28),
            width: double.infinity,
            color: const Color(0xFF4BCDEF),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.restaurant.name, style: const TextStyle(fontSize: 32)),
                const SizedBox(height: 4),
                Text(widget.restaurant.address, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RestaurantTypeChip(label: widget.restaurant.type.name, color: widget.restaurant.type.color),
                    const SizedBox(width: 16),
                    StarsChip(rating: widget.restaurant.getRating())
                  ],
                )
              ],
            )
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: widget.restaurant.comments.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.restaurant.comments[index].feedbacks),
                          Text(widget.restaurant.comments[index].stars.toString()),
                        ],
                      )
                    ),
                  ),
                );
              }
            )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onAddComment(context);
        },
        backgroundColor: Color(0xFF4BCDEF),
        child: const Icon(Icons.add_rounded, color: Colors.white),
      ),
    );
  }
}