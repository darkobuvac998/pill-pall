import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pill_pall/models/medicine.dart';
import 'package:pill_pall/widgets/tag.dart';

class MedicineInfo extends StatelessWidget {
  final Medicine medicine;

  MedicineInfo({super.key, required this.medicine});

  String getDateTime({required DateTime value}) {
    final date = DateFormat('MMMMEEEEd').format(value);
    final time = DateFormat('Hm').format(value);

    return "$date - $time";
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      height: deviceSize.height * 0.35,
      padding: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                height: deviceSize.height * 0.02,
              ),
              Text(
                medicine.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: deviceSize.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.start,
                    size: 20,
                  ),
                  SizedBox(
                    width: deviceSize.width * 0.05,
                  ),
                  Tag(
                    getDateTime(value: medicine.consumptionStart),
                    color: Colors.grey.shade300.withOpacity(0.55),
                    radius: 15,
                    stye: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(
                height: deviceSize.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    size: 20,
                  ),
                  SizedBox(
                    width: deviceSize.width * 0.05,
                  ),
                  Tag(
                    getDateTime(value: medicine.nextConsumtionTime),
                    color: Colors.grey.shade300.withOpacity(0.55),
                    radius: 15,
                    stye: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(
                height: deviceSize.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.storage,
                    size: 20,
                  ),
                  SizedBox(
                    width: deviceSize.width * 0.05,
                  ),
                  Tag(
                    "${medicine.quantity.ceil()} / ${medicine.startingQuantity.ceil()} ${medicine.quantityUnit.name}",
                    color: Colors.grey.shade300.withOpacity(0.55),
                    radius: 15,
                    stye: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(
                height: deviceSize.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_month,
                    size: 20,
                  ),
                  SizedBox(
                    width: deviceSize.width * 0.05,
                  ),
                  Tag(
                    "${medicine.period} per ${medicine.unit.name}",
                    color: Colors.grey.shade300.withOpacity(0.55),
                    radius: 15,
                    stye: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ]),
          ),
          Divider(
            thickness: 1,
            height: deviceSize.width * 0.01,
            color: Colors.grey.shade900.withOpacity(0.4),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    "Close",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
