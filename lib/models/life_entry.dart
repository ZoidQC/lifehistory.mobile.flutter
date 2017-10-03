library life_history_mobile.models.life_entry;

import 'package:json_annotation/json_annotation.dart';
import 'package:life_history_mobile/models/life_entry_activity.dart';

part 'life_entry.g.dart';

@JsonSerializable()
class LifeEntry extends Object with _$LifeEntrySerializerMixin {
  final int id;
  @JsonKey(name: 'day_id')
  final int dayId;
  @JsonKey(name: 'start_time')
  final DateTime startTime;
  @JsonKey(name: 'end_time')
  final DateTime endTime;
  @JsonKey(name: 'life_entry_activities')
  final List<LifeEntryActivity> lifeEntryActivities;

  LifeEntry({
    this.id,
    this.dayId,
    this.startTime,
    this.endTime,
    this.lifeEntryActivities,
  });

  factory LifeEntry.fromJson(Map<String, dynamic> json) =>
      _$LifeEntryFromJson(json);
}
