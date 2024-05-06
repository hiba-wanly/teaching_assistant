import 'package:flutter/material.dart';
import 'package:teachers_marks/constants.dart';

class TGridLayout extends StatefulWidget {
  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  const TGridLayout(
      {super.key,
      required this.itemCount,
      this.mainAxisExtent = 288,
      required this.itemBuilder});

  @override
  State<TGridLayout> createState() => _TGridLayoutState();
}

class _TGridLayoutState extends State<TGridLayout> {
  double h =1;
  double w=1 ;
  @override
  Widget build(BuildContext context) {

    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return GridView.builder(
      itemCount: widget.itemCount,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
          mainAxisExtent: widget.mainAxisExtent,
          mainAxisSpacing:w*0.05,
          crossAxisSpacing:h*0.03,
    ), itemBuilder: widget.itemBuilder);
  }
}
