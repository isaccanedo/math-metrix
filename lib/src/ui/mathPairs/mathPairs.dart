import 'package:flutter/material.dart';
import 'package:mathgame/src/provider/mathPairsProvider.dart';
import 'package:mathgame/src/resources/gameCategoryDataProvider.dart';
import 'package:mathgame/src/ui/mathPairs/math_pairs_button.dart';
import 'package:mathgame/src/ui/timer.dart';
import 'package:provider/provider.dart';

class MathPairs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MathPairsProvider>(
      create: (_) => MathPairsProvider(),
      child: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          body: SafeArea(
            top: true,
            bottom: true,
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              constraints: BoxConstraints.expand(),
              child: Column(
                children: <Widget>[
                  Expanded(
                      flex: 10,
                      child: SizedBox(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Timer(GameCategoryType.MATH_PAIRS),
                        ),
                      )),
                  Expanded(
                    flex: 5,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 70,
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: 0.7,
                        child: Consumer<MathPairsProvider>(
                            builder: (context, mathPairsProvider, child) {
                          return Visibility(
                            visible: !mathPairsProvider.pause,
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 1.5),
                                itemCount:
                                    mathPairsProvider.currentState.list.length,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return MathPairsButton(
                                      mathPairsProvider
                                          .currentState.list[index],
                                      index);
                                }),
                          );
                        }),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(),
                  ),
                  Expanded(
                      flex: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Consumer<MathPairsProvider>(
                              builder: (context, provider, child) {
                            return IconButton(
                              icon: provider.pause
                                  ? Icon(Icons.play_arrow)
                                  : Icon(Icons.pause),
                              iconSize: 40,
                              onPressed: () {
                                provider.pauseTimer();
                              },
                            );
                          }),
                          Consumer<MathPairsProvider>(
                              builder: (context, provider, child) {
                            return IconButton(
                              icon: Icon(Icons.info_outline),
                              iconSize: 40,
                              onPressed: () {
                                provider.showInfoDialog();
                              },
                            );
                          })
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
