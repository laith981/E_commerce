import 'package:flutter/material.dart';

class PriseWidget extends StatefulWidget {
  const PriseWidget({super.key, required this.quantity, required this.prise});
  final ValueNotifier <int>quantity;
  final double prise;

  @override
  State<PriseWidget> createState() => _PriseWidgetState();
}

class _PriseWidgetState extends State<PriseWidget> {
  @override
  void initState() {
    super.initState();
    widget.quantity.addListener(() {
      setState(() {
        
      });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.quantity.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Text("${widget.quantity.value*widget.prise}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    )) ;
  }
}