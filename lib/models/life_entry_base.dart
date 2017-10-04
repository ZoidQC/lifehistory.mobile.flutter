library life_history_mobile.models.life_entry_base;

import 'package:json_annotation/json_annotation.dart';
import 'package:life_history_mobile/models/life_entry_activity.dart';

part 'life_entry_base.g.dart';

@JsonSerializable()
class LifeEntryBase extends Object with _$LifeEntryBaseSerializerMixin {
  final int id;
  @JsonKey(name: 'day_id')
  final int dayId;
  @JsonKey(name: 'start_time')
  String startTimeString;
  @JsonKey(name: 'end_time')
  String endTimeString;
  @JsonKey(name: 'life_entry_activities')
  final List<LifeEntryActivity> lifeEntryActivities;

  LifeEntryBase({
    this.id,
    this.dayId,
    this.lifeEntryActivities,
    this.startTimeString,
    this.endTimeString,
  });

  factory LifeEntryBase.fromJson(Map<String, dynamic> json) =>
      _$LifeEntryBaseFromJson(json);
}
