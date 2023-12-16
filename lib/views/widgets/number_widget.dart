import 'package:flutter/material.dart';

class NumberWidget extends StatefulWidget {
  const NumberWidget({super.key, required this.number});
  final ValueNotifier<int> number;

  @override
  State<NumberWidget> createState() => _NumberWidgetState();
}

class _NumberWidgetState extends State<NumberWidget> {
  @override
  void initState() {    
    super.initState();
    widget.number.addListener(() {
      setState(() {
        
      });
    });
  }
  @override
  void dispose() {
    super.dispose();
    widget.number.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Text("${widget.number.value}");
  }
}