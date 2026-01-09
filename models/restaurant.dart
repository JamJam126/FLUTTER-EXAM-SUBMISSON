import 'package:final_exam/models/restaurant_comment.dart';

import 'restaurant_type.dart';

class Restaurant {
  final String name;
  final String address;
  final RestaurantType type;
  List<RestaurantComment> comments = [];

  Restaurant({
    required this.name, 
    required this.address, 
    required this.type,
    List<RestaurantComment>? comments
  }): comments = comments ?? [];

  double getRating () {
    if (comments.isEmpty) return 0.0;

    int totalRating = 0;
    for (int i = 0; i < comments.length; i++) {
      totalRating += comments[i].stars;
    }
    
    return totalRating / comments.length;
  }
}
