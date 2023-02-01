import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'components/progress_point.dart';
import 'package:fluttertesting/components/RoundedButton/rounded_button.dart';
import 'package:fluttertesting/pages/Tutorial/components/tutorial_stage.dart';
import 'package:fluttertesting/themes/colors.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({super.key});

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  int currentIndex = 0;
  String nextButtonText = "Avançar";

  List<Color> colors = [];

  @override
  void initState() {
    for (int i = 0; i < pages.length; i++) {
      colors.add(AppColors.purple8);
    }
    setState(() {});
    super.initState();
  }

  final List<Widget> pages = const [
    CurrentPage(
      icon: Icons.home,
      title: 'Início',
      description:
          'Texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto',
    ),
    CurrentPage(
      icon: Icons.camera_alt,
      title: 'Consultar',
      description:
          'Texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto',
    ),
    CurrentPage(
      icon: Icons.check_circle,
      title: 'Avaliação da Conformidade',
      description:
          'Texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto',
    ),
    CurrentPage(
      icon: CupertinoIcons.news_solid,
      title: 'Notícias',
      description:
          'Texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto',
    ),
  ];

  void actionButtons(
      {Color color = AppColors.purple8, int currentStageValue = 1}) {
    setState(() {
      colors = List<Color>.filled(pages.length, color);
      currentIndex = currentIndex + (1 * currentStageValue);
      if (currentIndex == pages.length - 1) {
        nextButtonText = "Concluir";
      } else {
        nextButtonText = "Avançar";
      }
    });
  }

  void nextButton() {
    if (currentIndex == pages.length - 1) {
      Navigator.pushNamed(context, '/home');
    } else {
      actionButtons();
    }
  }

  void backButton() {
    actionButtons(currentStageValue: -1);
  }

  List<Widget> progressPoint() {
    List<Widget> list = [];
    for (int i = 0; i < pages.length - 1; i++) {
      list.add(Row(
        children: [
          ProgressPoint(color: colors[i]),
          const SizedBox(width: 5),
        ],
      ));
    }

    list.add(ProgressPoint(color: colors[3]));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    colors[currentIndex] = AppColors.purple9;

    return Scaffold(
      backgroundColor: AppColors.white9,
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 360, color: Colors.green, child: pages[currentIndex]),
            const SizedBox(height: 45),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: progressPoint(),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Visibility(
                    visible: currentIndex != 0,
                    child: Expanded(
                      child: RoundedButton(
                        onTap: backButton,
                        height: 55,
                        width: 360,
                        buttonText: "Voltar",
                      ),
                    ),
                  ),
                  Visibility(
                      visible: currentIndex > 0,
                      child: const SizedBox(width: 15)),
                  Expanded(
                    child: RoundedButton(
                      onTap: nextButton,
                      height: 55,
                      width: 360,
                      buttonText: nextButtonText,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
