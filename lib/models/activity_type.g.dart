// GENERATED CODE - DO NOT MODIFY BY HAND

part of life_history_mobile.models.activity_type;

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ActivityType _$ActivityTypeFromJson(Map<String, dynamic> json) =>
    new ActivityType(
        id: json['id'] as int,
        name: json['name'] as String,
        showQuantity: json['show_quantity'] as bool,
        showRating: json['show_rating'] as bool);

abstract class _$ActivityTypeSerializerMixin {
  int get id;
  String get name;
  bool get showQuantity;
  bool get showRating;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'show_quantity': showQuantity,
        'show_rating': showRating
      };
}
