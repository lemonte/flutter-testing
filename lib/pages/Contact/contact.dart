import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertesting/components/BaseAppBar/base_app_bar.dart';
import 'package:fluttertesting/components/RoundedButton/rounded_button.dart';
import 'package:fluttertesting/pages/Contact/components/make_contact_button.dart';
import 'package:fluttertesting/themes/colors.dart';
import 'package:fluttertesting/themes/images.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  String selectedRadioValue = '';
  String textAreaDescription = '';

  Future<void> launchMailto() async {
    final Uri mailtoLink = Uri(
      scheme: 'mailto',
      path: 'email@example.com',
      queryParameters: {
        'subject': 'Subject Example',
        'body': 'Message here ..'
      },
    );
    try {
      await launchUrl(mailtoLink);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white9,
      appBar: const BaseAppBar(
        title: 'Contato',
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: AppColors.white9,
            child: Column(
              children: [
                const Text('Como você prefere'),
                const Text('falar com a gente?'),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MakeContactButton(
                      image: AppImages.emailIcon,
                      buttonText: 'E-mail',
                      color: AppColors.gray6,
                      onPressed: launchMailto,
                    ),
                    const SizedBox(width: 20),
                    MakeContactButton(
                      image: AppImages.phoneIcon,
                      buttonText: 'Telefone',
                      color: AppColors.gray6,
                      onPressed: () {
                        print('Telefone!');
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Nos envie uma mensagem'),
                    const SizedBox(width: 15),
                    SvgPicture.asset(AppImages.dialogIcon),
                  ],
                ),
                const Text('Selecione um assunto'),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Radio(
                                  activeColor: AppColors.black9,
                                  value: 'Críticas e elogios',
                                  groupValue: selectedRadioValue,
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedRadioValue = value!;
                                      print(selectedRadioValue);
                                    });
                                  }),
                            ),
                            Text('Críticas e elogios'),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Radio(
                                  activeColor: AppColors.black9,
                                  value: 'Dúvidas',
                                  groupValue: selectedRadioValue,
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedRadioValue = value!;
                                      print(selectedRadioValue);
                                    });
                                  }),
                            ),
                            Text('Dúvidas'),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Radio(
                                  activeColor: AppColors.black9,
                                  value: 'Relatar problemas',
                                  groupValue: selectedRadioValue,
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedRadioValue = value!;
                                      print(selectedRadioValue);
                                    });
                                  }),
                            ),
                            Text('Relatar problemas'),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: 35),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Radio(
                                  activeColor: AppColors.black9,
                                  value: 'Sugestões',
                                  groupValue: selectedRadioValue,
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedRadioValue = value!;
                                      print(selectedRadioValue);
                                    });
                                  }),
                            ),
                            Text('Sugetões'),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Radio(
                                  activeColor: AppColors.black9,
                                  value: 'Outros',
                                  groupValue: selectedRadioValue,
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedRadioValue = value!;
                                      print(selectedRadioValue);
                                    });
                                  }),
                            ),
                            Text('Outros'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 25, left: 55, right: 55, bottom: 40),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.gray6,
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: AppColors.gray8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: null,
                    ),
                    maxLines: 6,
                    onChanged: (value) {
                      setState(() {
                        textAreaDescription = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: RoundedButton(
                    width: 100,
                    height: 38,
                    buttonText: 'Enviar',
                    onTap: () => {
                      print('Clicado!'),
                      print(textAreaDescription),
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
