import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pill_pall/models/medicine.dart';
import 'package:pill_pall/screens/medicine_detail_screen.dart';
import 'package:pill_pall/util/constants.dart';
import 'package:pill_pall/widgets/tag.dart';

class MedicineItem extends StatelessWidget {
  final Medicine medicine;
  const MedicineItem({super.key, required this.medicine});

  void _navigateToDetailScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MedicineDetailScreen.routeName,
        arguments: {'medicine': medicine});
  }

  @override
  Widget build(BuildContext context) {
    final time = DateFormat('Hm').format(medicine.nextConsumtionTime);

    return Flexible(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => _navigateToDetailScreen(context),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(medicineImage),
                    ),
                    title: Text(
                      medicine.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Tag(
                                  "${medicine.period} x 1",
                                  stye: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                  radius: 10,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Tag(
                                  "${medicine.quantity.ceil()} / ${medicine.startingQuantity.ceil()}",
                                  stye: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                  radius: 10,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Tag(
                                icon: Icons.watch_later_outlined,
                                time,
                                color: Colors.white.withOpacity(0.7),
                                radius: 10,
                                stye: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          )
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
