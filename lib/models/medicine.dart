// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pill_pall/util/enums.dart';

class Medicine {
  late final int id;
  late final String name;
  late final DateTime consumptionStart;
  late final DateTime nextConsumtionTime;
  late final int period;
  late final TimeUnit unit;
  late final double quantity;
  late final double startingQuantity;
  late final QuantityUnit quantityUnit;

  Medicine({
    required this.id,
    required this.name,
    required this.consumptionStart,
    required this.nextConsumtionTime,
    required this.period,
    required this.unit,
    required this.quantity,
    required this.startingQuantity,
    required this.quantityUnit,
  });

  Medicine copyWith({
    int? id,
    String? name,
    DateTime? consumptionStart,
    DateTime? nextConsumtionTime,
    int? period,
    TimeUnit? unit,
    double? quantity,
    double? startingQuantity,
    QuantityUnit? quantityUnit,
  }) {
    return Medicine(
      id: id ?? this.id,
      name: name ?? this.name,
      consumptionStart: consumptionStart ?? this.consumptionStart,
      nextConsumtionTime: nextConsumtionTime ?? this.nextConsumtionTime,
      period: period ?? this.period,
      unit: unit ?? this.unit,
      quantity: quantity ?? this.quantity,
      startingQuantity: startingQuantity ?? this.startingQuantity,
      quantityUnit: quantityUnit ?? this.quantityUnit,
    );
  }

  @override
  bool operator ==(covariant Medicine other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.consumptionStart == consumptionStart &&
        other.period == period &&
        other.unit == unit &&
        other.quantity == quantity &&
        other.startingQuantity == startingQuantity &&
        other.quantityUnit == quantityUnit;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        consumptionStart.hashCode ^
        period.hashCode ^
        unit.hashCode ^
        quantity.hashCode ^
        startingQuantity.hashCode ^
        quantityUnit.hashCode;
  }
}
