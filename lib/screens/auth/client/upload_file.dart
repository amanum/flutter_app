import 'package:flutter/material.dart';
import 'package:quick_pick/core/constants/enums.dart';
import 'package:quick_pick/core/constants/strings.dart';
import 'package:quick_pick/router/app_router.dart';
import 'package:quick_pick/screens/auth/client/about_next_step.dart';
import 'package:quick_pick/utilities/components/regis_progress.dart';
import 'package:quick_pick/utilities/components/title_back.dart';
import 'package:quick_pick/utilities/widgets/buttons.dart';
import 'package:quick_pick/utilities/widgets/upload_file.dart';

class UploadFileClientRegis extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<UploadFileClientRegis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              regisProgress(4),
              Expanded(
                child: ListView(
                  children: [
                    TitleBack(Strings.uploadFiles, () {
                      Navigator.of(context).pop(true);
                    }),
                    SizedBox(height: 25),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(children: [
                        UploadFileWidget(
                          label: Strings.educationDiploma,
                        ),
                        SizedBox(height: 25),
                        UploadFileWidget(
                          label: Strings.summary,
                        ),
                      ]),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: ButtonWidget().fixedRed(Strings.complete, () {
        Navigator.pushNamed(
          context,
          AppRouter.home,
          arguments: UserType.employee
        );
      }),
    );
  }
}
