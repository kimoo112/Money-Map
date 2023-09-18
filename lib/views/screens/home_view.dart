import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Helpers/colors.dart';
import '../widgets/bottom_container.dart';
import '../widgets/top_container.dart';
import '../widgets/transactions_row_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 350.h,
              child: const Stack(
                children: [
                  TopContainer(),
                  BottomContainer(),
                ],
              ),
            ),
            const TransactionsRowWIdget(),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 12,
                itemBuilder: (BuildContext context, int index) {
                  return const ListTile(
                    title: Text('12 M3SL'),
                    subtitle: Text('Today'),
                    leading: CircleAvatar(
                      backgroundColor: cBlue,
                    ),
                    trailing: Text('+200 ',
                        style: TextStyle(fontSize: 15, color: cGreen)),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
