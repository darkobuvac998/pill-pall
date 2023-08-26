import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pill_pall/models/medicine.dart';
import 'package:pill_pall/screens/medicine_detail_screen.dart';
import 'package:pill_pall/util/app_icons.dart';
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
    final mediaQuery = MediaQuery.of(context);

    return Card(
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _navigateToDetailScreen(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Dismissible(
                  background: Container(
                      decoration: BoxDecoration(color: Colors.red),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.delete),
                          SizedBox(
                            width: mediaQuery.size.width * 0.01,
                          ),
                          Text(
                            "Consumed",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          SizedBox(
                            width: mediaQuery.size.width * 0.05,
                          )
                        ],
                      )),
                  direction: DismissDirection.endToStart,
                  key: Key(medicine.id.toString()),
                  onDismissed: (_) {},
                  child: ListTile(
                    horizontalTitleGap: mediaQuery.size.width * 0.05 * (-1),
                    contentPadding: EdgeInsets.all(0),
                    leading: CircleAvatar(
                      radius: mediaQuery.size.width * 0.15,
                      backgroundImage:
                          AssetImage("assets/images/capsule_white.png"),
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
                                  color: Colors.black12,
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
                                  color: Colors.black12,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Tag(
                                icon: Icons.watch_later_outlined,
                                time,
                                color: Colors.black12,
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
