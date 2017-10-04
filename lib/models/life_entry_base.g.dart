// GENERATED CODE - DO NOT MODIFY BY HAND

part of life_history_mobile.models.life_entry_base;

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

LifeEntryBase _$LifeEntryBaseFromJson(Map<String, dynamic> json) =>
    new LifeEntryBase(
        id: json['id'] as int,
        dayId: json['day_id'] as int,
        lifeEntryActivities: (json['life_entry_activities'] as List)
            ?.map((e) => e == null
                ? null
                : new LifeEntryActivity.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        startTimeString: json['start_time'] as String,
        endTimeString: json['end_time'] as String);

abstract class _$LifeEntryBaseSerializerMixin {
  int get id;
  int get dayId;
  String get startTimeString;
  String get endTimeString;
  List<LifeEntryActivity> get lifeEntryActivities;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'day_id': dayId,
        'start_time': startTimeString,
        'end_time': endTimeString,
        'life_entry_activities': lifeEntryActivities
      };
}
