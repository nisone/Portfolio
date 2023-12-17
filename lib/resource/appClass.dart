import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:portfolio/model/models.dart';
import 'package:portfolio/resource/styles.dart';
import 'package:url_launcher/url_launcher.dart';

enum ScreenType { mobile, tab, web }

class AppClass {
  static final AppClass _mAppClass = AppClass._internal();
  static BuildContext? lastContext;
  ScrollController controller = ScrollController();

  /* URL */
  static final resumeDownloadURL =
      '''https://drive.google.com/file/d/1vqI1hTrX5EGQcO5MgZTzq0rHxpNUN1WF/view?usp=drive_link''';

  static final zappay = '''https://zappay-nine.vercel.app/web/''';

  // static final gitHermarts = '''https://github.com/jeeva-HBK/SafeC19''';
  static final kyef =
      '''https://play.google.com/store/apps/details?id=org.kdyouthsempowerment.appmember''';
  static final keypoint = '''https://github.com/nisone/keypoint''';
  // static final gitPAT = '''https://github.com/jeeva-HBK/PAT''';

  // static final gitAVM = '''https://github.com/jeeva-HBK/SafeC19''';

  List<WorkModel> projectList = [
    WorkModel(
        projectTitle: "Zappay",
        projectContent:
            "Zappay is a VTU website/mobile application specially designed to encourage and takeout the difficulties in Virtual Top Up for mobile data and Airtime. It is developed with user-centric features to help the users with integrated InApp payment mode with high level security.",
        tech1: "Flutter",
        tech2: "Firebase",
        tech3: "Paystack"),
    WorkModel(
        projectTitle: "KDYEF",
        projectContent:
            "Foundation Members platform for registration and beneficiary users management. New members records is still captured and uploaded in cloud server, as reference for auditing.",
        tech1: "Android",
        tech2: "Cloud Firestore",
        tech3: "Java"),
    WorkModel(
        projectTitle: "Keypoint",
        projectContent: '''It’s a web/mobile e-commerce platform''',
        tech1: "Android",
        tech2: "Flutterwave",
        tech3: "API"),
    // WorkModel(
    //     projectTitle: "AutoStabilizer",
    //     projectContent:
    //         '''It is used to connect to a stabilizer and read the inlet and outlet voltage and several other parameters of the Stabilizer. This application will also set up the stabilizer hardware to connect the stabilizer to the Wi-Fi network. And with some features like PIR Sensor, Control Stabilizer with schedule, Standby Mode, Control Stabilizer with MobileData via AWS, and With WiFi via TCP Connection.''',
    //     tech1: "Android",
    //     tech2: "MQTT"),
    // WorkModel(
    //     projectTitle: "PAT",
    //     projectContent:
    //         '''This application is to store and record the data of tested production product information for future reference. This application can reduce the time and ensure the performance and quality of the QA/QC people. This application let the super admin to track the workers and their performance. Through this application, we can calculate the time spent on every test that was taken to complete by the worker.''',
    //     tech1: "Flutter",
    //     tech2: "NodeJs",
    //     tech3: "Flutter-Windows"),
    // WorkModel(
    //     projectTitle: "AVM",
    //     projectContent:
    //         '''AVM - Automatic Vending Machine is one of Pradeep's stainless steel product. The project is aimed at automating the beverage vending process. It can be done through hardware that controls the main engines and a mobile app (which acts like a PCB display for the unit) that is used to personalize and make beverage. It can also perform several process like Brewing, Boiling,cleansing drum etc . The Engines (hardware) and Mobiel Application communicate using Bluetooth.''',
    //     tech1: "Android",
    //     tech2: "Tablet"),
  ];

  factory AppClass() {
    return _mAppClass;
  }

  AppClass._internal();

  getMqWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  getMqHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  showSnackBar(String msg, {BuildContext? context}) {
    ScaffoldMessenger.of(context ?? lastContext!)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  ScreenType getScreenType(BuildContext context) {
    double scrWidth = getMqWidth(context);
    if (scrWidth > 915) {
      return ScreenType.web;
    } else if (scrWidth < 650) {
      return ScreenType.mobile;
    }
    return ScreenType.tab;
  }

  downloadResume(context) async {
    await launchUrl(Uri.parse(AppClass.resumeDownloadURL));
  }

  alertDialog(context, title, msg) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
                title: Text(title, style: TxtStyle().boldWhite(context)),
                content: Text(msg),
                actions: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.green),
                      onPressed: () => Navigator.pop(context),
                      child: Text('Okay'))
                ]));
  }

  Future<bool> sendEmail(name, contact, msg) async {
    // var url = Uri.https('hbk-portfolio-mailer.web.app', '/sendMail');
    // var response = await post(url,
    //         body: {"name": name, "contactInfo": contact, "message": msg})
    //     .timeout(Duration(seconds: 10))
    //     .onError((error, stackTrace) {
    //   return Response("body", 400);
    // });
    // print(response.body);
    // return response.statusCode == 200;

    Uri url = Uri.parse(
        'mailto:nuhu94@gmail.com?subject=Product Inquiry&body=$name\n\r$contact\n\r$msg');
    if (await launchUrl(url)) {
      return true;
    } else {
      return false;
    }
  }
}
