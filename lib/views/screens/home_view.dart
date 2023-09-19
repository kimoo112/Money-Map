import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:incomeandexpense/Helpers/images.dart';
import 'package:incomeandexpense/view%20model/cubit/the_money_cubit.dart';

import '../../Helpers/colors.dart';
import '../widgets/bottom_container.dart';
import '../widgets/top_container.dart';
import '../widgets/transactions_row_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TheTransactionsCubit>(context).checkList();
  }

  @override
  Widget build(BuildContext context) {
    final List transactionsContents =
        BlocProvider.of<TheTransactionsCubit>(context)
            .transactionsContents
            .reversed
            .toList();

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
            BlocBuilder<TheTransactionsCubit, TheTransactionsState>(
              builder: (context, state) {
                if (state is TheTransactionsEmpty) {
                  return Center(
                    child: Image.asset(
                      Assets.imagesGetStarted,
                      width: 250.w,
                    ),
                  );
                } else if (state is TheTransactionsLoaded) {
                  return Expanded(
                      child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: transactionsContents.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<TheTransactionsCubit>(context)
                              .removeTransaction(transactionsContents[index]);
                        },
                        child: ListTile(
                          title: Text('${transactionsContents[index].title}'),
                          subtitle: Text('${transactionsContents[index].date}'),
                          leading: CircleAvatar(
                            backgroundColor: cBlue,
                            backgroundImage: FileImage(
                                File(transactionsContents[index].image)),
                          ),
                          trailing: Text(
                              '\$ ${transactionsContents[index].price}',
                              style:
                                  const TextStyle(fontSize: 15, color: cGreen)),
                        ),
                      );
                    },
                  ));
                }
                return const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }
}
