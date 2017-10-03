library life_history_mobile.models.life_entry_activity;

import 'package:json_annotation/json_annotation.dart';
import 'package:life_history_mobile/models/activity.dart';

part 'life_entry_activity.g.dart';

@JsonSerializable()
class LifeEntryActivity extends Object with _$LifeEntryActivitySerializerMixin {
  final int id;
  final String description;
  final int life_entry_id;
  final double quantity;
  final int rating;
  final Activity activity;

  LifeEntryActivity({
    this.id,
    this.description,
    this.life_entry_id,
    this.quantity,
    this.rating,
    this.activity,
  });

  factory LifeEntryActivity.fromJson(Map<String, dynamic> json) =>
      _$LifeEntryActivityFromJson(json);
}
