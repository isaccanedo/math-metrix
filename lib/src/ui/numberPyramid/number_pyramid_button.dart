import 'package:flutter/material.dart';
import 'package:mathgame/src/models/numberPyramid/number_pyramid_model.dart';
import 'package:mathgame/src/provider/calculatorProvider.dart';
import 'package:mathgame/src/provider/numberPyramidProvider.dart';
import 'package:provider/provider.dart';

class PyramidNumberButton extends StatelessWidget {
  final BorderRadius borderRadius;
  final String text;
//  final NumPyramidCellModel numPyramidCellModel;
  PyramidNumberButton(this.text, this.borderRadius);

  @override
  Widget build(BuildContext context) {
    final numberProvider = Provider.of<NumberPyramidProvider>(context);

    return Expanded(
      flex: 1,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: (){
          numberProvider.pyramidBoxInputValue(text);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).dialogBackgroundColor,
            shape: BoxShape.rectangle,
            borderRadius: borderRadius,
            border: Border.all(color: Theme.of(context).dividerColor, width: 1),
          ),
          margin: EdgeInsets.all(1),
          constraints: BoxConstraints.expand(),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.headline,
            ),
          ),
        ),
      ),
    );
  }
}
