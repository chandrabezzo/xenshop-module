import '../../domain/entities/rating.dart';
import '../models/rating_model.dart';

class RatingMapper {
  static Rating toEntity(RatingModel model) =>
      Rating(count: model.count, rate: model.rate);
}
