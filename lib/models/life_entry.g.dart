// GENERATED CODE - DO NOT MODIFY BY HAND

part of life_history_mobile.models.life_entry;

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

LifeEntry _$LifeEntryFromJson(Map<String, dynamic> json) => new LifeEntry(
    id: json['id'] as int,
    dayId: json['day_id'] as int,
    startTime: json['start_time'] == null
        ? null
        : DateTime.parse(json['start_time'] as String),
    endTime: json['end_time'] == null
        ? null
        : DateTime.parse(json['end_time'] as String),
    lifeEntryActivities: (json['life_entry_activities'] as List)
        ?.map((e) => e == null
            ? null
            : new LifeEntryActivity.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$LifeEntrySerializerMixin {
  int get id;
  int get dayId;
  DateTime get startTime;
  DateTime get endTime;
  List<LifeEntryActivity> get lifeEntryActivities;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'day_id': dayId,
        'start_time': startTime?.toIso8601String(),
        'end_time': endTime?.toIso8601String(),
        'life_entry_activities': lifeEntryActivities
      };
}
