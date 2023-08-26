import 'package:pill_pall/models/medicine.dart';
import 'package:pill_pall/util/enums.dart';

const String nextPillCoverUrl =
    "https://images.unsplash.com/photo-1676364423874-19c785db3e61?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjY4fHxtZWRpY2luZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60";

const String medicineImage =
    "https://images.unsplash.com/photo-1550572017-4fcdbb59cc32?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1939&q=80";

Medicine dummyMedicine = Medicine(
    id: 1,
    name: "Paracetamol",
    consumptionStart: DateTime.now(),
    nextConsumtionTime: DateTime.now(),
    period: 3,
    unit: TimeUnit.day,
    quantity: 30,
    startingQuantity: 30,
    quantityUnit: QuantityUnit.piece);

List<Medicine> items = [
  Medicine(
      id: 1,
      name: "Paracetamol",
      consumptionStart: DateTime.now(),
      nextConsumtionTime: DateTime.now(),
      period: 3,
      unit: TimeUnit.day,
      quantity: 30,
      startingQuantity: 30,
      quantityUnit: QuantityUnit.piece),
  Medicine(
      id: 2,
      name: "Paracetamol",
      consumptionStart: DateTime.now(),
      nextConsumtionTime: DateTime.now(),
      period: 3,
      unit: TimeUnit.day,
      quantity: 30,
      startingQuantity: 30,
      quantityUnit: QuantityUnit.piece),
  Medicine(
      id: 3,
      name: "Paracetamol",
      consumptionStart: DateTime.now(),
      nextConsumtionTime: DateTime.now(),
      period: 3,
      unit: TimeUnit.day,
      quantity: 30,
      startingQuantity: 30,
      quantityUnit: QuantityUnit.piece),
  Medicine(
      id: 4,
      name: "Paracetamol",
      consumptionStart: DateTime.now(),
      nextConsumtionTime: DateTime.now(),
      period: 3,
      unit: TimeUnit.day,
      quantity: 30,
      startingQuantity: 30,
      quantityUnit: QuantityUnit.piece),
  Medicine(
      id: 5,
      name: "Paracetamol",
      consumptionStart: DateTime.now(),
      nextConsumtionTime: DateTime.now(),
      period: 3,
      unit: TimeUnit.day,
      quantity: 30,
      startingQuantity: 30,
      quantityUnit: QuantityUnit.piece),
  Medicine(
      id: 6,
      name: "Paracetamol",
      consumptionStart: DateTime.now(),
      nextConsumtionTime: DateTime.now(),
      period: 3,
      unit: TimeUnit.day,
      quantity: 30,
      startingQuantity: 30,
      quantityUnit: QuantityUnit.piece),
];
