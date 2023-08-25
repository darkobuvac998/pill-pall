import 'package:flutter/material.dart';
import 'package:pill_pall/models/medicine.dart';
import 'package:pill_pall/util/app_icons.dart';
import 'package:pill_pall/util/constants.dart';
import 'package:pill_pall/util/helpers.dart';
import 'package:pill_pall/widgets/kpi_card.dart';

class MedicineDetailScreen extends StatelessWidget {
  static const routeName = '/medicine-detil';
  const MedicineDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediQuery = MediaQuery.of(context);
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final medicine = args['medicine'] as Medicine;

    return Container(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Title(
              color: Colors.white,
              child: Text(
                medicine.name,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            pinned: true,
            expandedHeight:
                (mediQuery.size.height - mediQuery.viewInsets.top) * 0.3,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.zoomBackground],
              background: SizedBox(
                child: Hero(
                  tag: medicine.id,
                  child: Image.network(medicineImage, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: mediQuery.size.height,
              width: mediQuery.size.width,
              child: Scaffold(
                body: GridView.count(
                  primary: false,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(10),
                  children: [
                    KpiCard(
                      kpiTitle: "Name",
                      aspectRatio: 1,
                      kpiValue: medicine.name,
                      icon: AppIcons.align_justify,
                    ),
                    KpiCard(
                      kpiTitle: "Start",
                      aspectRatio: 1,
                      kpiValue: formatTime(medicine.consumptionStart),
                      icon: Icons.date_range,
                    ),
                    KpiCard(
                      kpiTitle: "Next consumption",
                      aspectRatio: 1,
                      kpiValue: formatTime(medicine.nextConsumtionTime),
                      icon: Icons.next_plan_outlined,
                    ),
                    KpiCard(
                      kpiTitle: "Period",
                      aspectRatio: 1,
                      kpiValue: "${medicine.period.toString()} per ${medicine.unit.name}",
                      icon: AppIcons.times,
                    ),
                    KpiCard(
                      kpiTitle: "Quantity",
                      aspectRatio: 1,
                      kpiValue:
                          "${medicine.quantity.ceil()} / ${medicine.startingQuantity.ceil()}",
                      icon: AppIcons.sort_amount_down,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
