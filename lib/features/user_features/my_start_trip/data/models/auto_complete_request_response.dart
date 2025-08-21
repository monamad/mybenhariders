import 'package:json_annotation/json_annotation.dart';

part 'auto_complete_request_response.g.dart';

@JsonSerializable()
class SearchAutoCompleteResponse {
  List<Predictions> predictions;
  String status;
  @JsonKey(name: 'error_message')
  String? errorMessage;

  SearchAutoCompleteResponse({
    required this.predictions,
    required this.status,
    this.errorMessage,
  });

  factory SearchAutoCompleteResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchAutoCompleteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchAutoCompleteResponseToJson(this);
}

@JsonSerializable()
class Predictions {
  String? description;
  @JsonKey(name: 'place_id')
  String? placeId;
  String? reference;
  @JsonKey(name: 'structured_formatting')
  StructuredFormatting? structuredFormatting;
  List<String>? types;

  Predictions({
    this.description,
    this.placeId,
    this.reference,
    this.structuredFormatting,
    this.types,
  });

  factory Predictions.fromJson(Map<String, dynamic> json) =>
      _$PredictionsFromJson(json);

  Map<String, dynamic> toJson() => _$PredictionsToJson(this);
}

@JsonSerializable()
class StructuredFormatting {
  @JsonKey(name: 'main_text')
  String? mainText;
  @JsonKey(name: 'secondary_text')
  String? secondaryText;

  StructuredFormatting({this.mainText, this.secondaryText});

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) =>
      _$StructuredFormattingFromJson(json);

  Map<String, dynamic> toJson() => _$StructuredFormattingToJson(this);
}
