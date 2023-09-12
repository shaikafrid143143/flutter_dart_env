


# Email sender
Email Sender simplifies email integration in Flutter, enabling users to send emails, facilitate OTP verification,  Enhance your app's email functionality effortlessly.

#### Usage
```
import 'package:email_sender/email_sender.dart';
```
#### Example


⭐ **Class Initialization**
```dart
 EmailSender eamilsender = EmailSender();
```
⭐ **Send Method**
```dart
void main() async{
    //Initialize emailSender 
    EmailSender emailsender = EmailSender();
    //Enter your email in send method
    var response = await emailsender.send("toemail@gmail.com");
    print(response["message"]);
}
``` 
####  methods

⭐ **SendOtp**
```dart
    EmailSender emailsender = EmailSender();
    var response = await emailsender.sendOtp("toemail@gmail.com",123456);

```
⭐ **Sendmessage**

```dart
    EmailSender emailsender = EmailSender();
    var response = await emailsender.sendMessage("toemail@gmail.com","title","subject","body");

```
⭐ **Custommessage**

```dart
    EmailSender custom = EmailSender("fromemail@gmail.com","passkey","toemail@gmail.com","title","subject","body");
    var response = await emailsender.customMessage();

``` 
⭐ **Help**

```dart
    Email emailsender = Email();
    email.help();

``` 
#### Authors

- [AFRID SHAIK](https://www.github.com/afriddev)



#### Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

For help on editing plugin code, view the [documentation](https://flutter.io/developing-packages/#edit-plugin-package).
