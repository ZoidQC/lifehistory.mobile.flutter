// GENERATED CODE - DO NOT MODIFY BY HAND

part of life_history_mobile.models.activity;

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) => new Activity(
    id: json['id'] as int,
    name: json['name'] as String,
    activityType: json['activity_type'] == null
        ? null
        : new ActivityType.fromJson(
            json['activity_type'] as Map<String, dynamic>));

abstract class _$ActivitySerializerMixin {
  int get id;
  String get name;
  ActivityType get activityType;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': id, 'name': name, 'activity_type': activityType};
}
