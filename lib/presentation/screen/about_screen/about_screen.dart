import 'package:d_tt_nl_code_test/presentation/widget/simple_app_bar.dart';
import 'package:d_tt_nl_code_test/presentation/widget/text_view.dart';
import 'package:d_tt_nl_code_test/utils/dimens.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const SimpleAppBar(
          title: "ABOUT",
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: k18Font),
          child: ListView(
            children: [
              const SizedBox(
                height: 16,
              ),
              TextView(
                text: aboutText,
                color: Theme.of(context).hintColor,
                fontSize: k14Font,
              ),
              const SizedBox(
                height: 24,
              ),
              TextView(
                text: "DESIGN AND DEVELOPMENT",
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyText2?.color,
                fontSize: k20Font,
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 200,
                      child: Image.asset(
                        "assets/images/dtt_banner.png",
                      )),
                  const SizedBox(
                    width: kPadding16 * 2,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "by Dtt\n",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: k18Font)),
                    TextSpan(
                      text: "d-tt.nl",
                      style: const TextStyle(
                          color: Colors.blue,
                          fontSize: k18Font,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          try {
                            final url = Uri.parse(
                              'https://www.d-tt.nl/',
                            );
                            if (await canLaunchUrl(url)) {
                              launchUrl(
                                url,
                                mode: LaunchMode.externalApplication,
                              );
                            } else {
                              // ignore: avoid_print
                              Get.snackbar("Fail To Launch Url", "");
                            }
                          } catch (e) {
                            Get.snackbar("Fail To Launch Url", "");
                          }
                        },
                    ),
                  ]))
                ],
              )
            ],
          ),
        ));
  }
}

const String aboutText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.";
