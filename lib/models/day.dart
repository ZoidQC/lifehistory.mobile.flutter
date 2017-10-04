library life_history_mobile.models.day;

import 'package:json_annotation/json_annotation.dart';
import 'package:life_history_mobile/models/life_entry.dart';

part 'day.g.dart';

@JsonSerializable()
class Day extends Object with _$DaySerializerMixin {
  final int id;
  final DateTime date;
  @JsonKey(name: 'life_entries')
  final List<LifeEntry> lifeEntries;
  final String note;

  Day({
    this.id,
    this.date,
    this.lifeEntries,
    this.note,
  });

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}
