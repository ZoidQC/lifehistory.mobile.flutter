library life_history_mobile.models.activity;

import 'package:json_annotation/json_annotation.dart';
import 'package:life_history_mobile/models/activity_type.dart';

part 'activity.g.dart';

@JsonSerializable()
class Activity extends Object with _$ActivitySerializerMixin {
  final int id;
  final String name;
  @JsonKey(name: 'activity_type')
  final ActivityType activityType;

  Activity({
    this.id,
    this.name,
    this.activityType,
  });

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
}
