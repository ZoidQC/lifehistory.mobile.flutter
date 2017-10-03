library life_history_mobile.models.activity_type;

import 'package:json_annotation/json_annotation.dart';

part 'activity_type.g.dart';

@JsonSerializable()
class ActivityType extends Object with _$ActivityTypeSerializerMixin {
  final int id;
  final String name;
  @JsonKey(name: 'show_quantity')
  final bool showQuantity;
  @JsonKey(name: 'show_rating')
  final bool showRating;

  ActivityType({
    this.id,
    this.name,
    this.showQuantity,
    this.showRating,
  });

  factory ActivityType.fromJson(Map<String, dynamic> json) =>
      _$ActivityTypeFromJson(json);
}
