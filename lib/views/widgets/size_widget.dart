import 'package:flutter/material.dart';

class SizeWidget extends StatefulWidget {
  const SizeWidget({super.key});

  @override
  State<SizeWidget> createState() => _SizeWidgetState();
}
enum Sizes { extraSmall, small, medium, large, extraLarge }

class _SizeWidgetState extends State<SizeWidget> {
   Set<Sizes> selection = <Sizes>{Sizes.large};
  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Sizes>( 
                                segments: const <ButtonSegment<Sizes>>[
                                  ButtonSegment<Sizes>(value: Sizes.extraSmall, label: Text('XS')),
                                  ButtonSegment<Sizes>(value: Sizes.small, label: Text('S')),
                                  ButtonSegment<Sizes>(value: Sizes.medium, label: Text('M')),
                                  ButtonSegment<Sizes>(value: Sizes.large,label: Text('L'), ),
                                  ButtonSegment<Sizes>(value: Sizes.extraLarge, label: Text('XL')),
                                  ],
                                  selected: selection,
                                   onSelectionChanged: (Set<Sizes> newSelection) {
                                    setState(() {
                                       selection = newSelection;
                                         });
                                         },
                                          );
  }
}