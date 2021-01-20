import 'package:url_launcher/url_launcher.dart';

// class CallsAndMessagesService {
void call(String number) => launch("tel://$number");

void sendSms(String number) => launch("sms:$number");

void sendEmail(String email) => launch("mailto:$email");

// }

void openURL(String $applink) async {
  var url = $applink;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void linkedinURL(String $profileName) async {
  var url = 'https://sa.linkedin.com/in/' + $profileName;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void twitterURL(String $profileName) async {
  var url = 'https://twitter.com/' + $profileName;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void githubURL(String $profileName) async {
  var url = 'https://github.com/' + $profileName;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
