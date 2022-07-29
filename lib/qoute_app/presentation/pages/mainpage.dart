import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:qoute/qoute_app/presentation/pages/homepage.dart';
import 'package:qoute/qoute_app/presentation/widgets/primary_widgets/custom_text_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 100),
        const Iconify(Mdi.format_quote_open, size: 70),
        const SizedBox(height: 100),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            children: [
              const QuickSandTextWidget(
                text: 'Welcome',
                fontsize: 30,
                fontWeight: FontWeight.bold,
              ),
              const OswaldTextWidget(
                text: 'Quote App',
                fontsize: 40,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 250),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  width: 190,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: const QuickSandTextWidget(
                    text: 'Explore',
                    fontsize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
