// GENERATED CODE - DO NOT MODIFY BY HAND

part of life_history_mobile.models.day;

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Day _$DayFromJson(Map<String, dynamic> json) => new Day(
    id: json['id'] as int,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    lifeEntries: (json['life_entries'] as List)
        ?.map((e) => e == null
            ? null
            : new LifeEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    note: json['note'] as String);

abstract class _$DaySerializerMixin {
  int get id;
  DateTime get date;
  List<LifeEntry> get lifeEntries;
  String get note;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'date': date?.toIso8601String(),
        'life_entries': lifeEntries,
        'note': note
      };
}
