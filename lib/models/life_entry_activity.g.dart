// GENERATED CODE - DO NOT MODIFY BY HAND

part of life_history_mobile.models.life_entry_activity;

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

LifeEntryActivity _$LifeEntryActivityFromJson(Map<String, dynamic> json) =>
    new LifeEntryActivity(
        id: json['id'] as int,
        description: json['description'] as String,
        lifeEntryId: json['life_entry_id'] as int,
        quantity: (json['quantity'] as num)?.toDouble(),
        rating: json['rating'] as int,
        activity: json['activity'] == null
            ? null
            : new Activity.fromJson(json['activity'] as Map<String, dynamic>));

abstract class _$LifeEntryActivitySerializerMixin {
  int get id;
  String get description;
  int get lifeEntryId;
  double get quantity;
  int get rating;
  Activity get activity;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'description': description,
        'life_entry_id': lifeEntryId,
        'quantity': quantity,
        'rating': rating,
        'activity': activity
      };
}
