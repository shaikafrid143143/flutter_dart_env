


# email_sender
Email Sender simplifies email integration in Flutter, enabling users to send emails, facilitate OTP verification,  Enhance your app's email functionality effortlessly.
## Example

```dart
void main() async{
    //Initialize emailSender 
    emailSender emailsender = EmailSender();
    //Enter your email in send method
    var response = await emailsender.send("youremail@gmail.com");
    print(response);
}
``` 
## -- methods

```dart
    emailSender emailsender = EmailSender();
    var response = await emailsender.details();

``` 

```dart
    emailSender emailsender = EmailSender();
    var response = await emailsender.sendOtp("toemail@gmail.com",123456);

``` 

```dart
    emailSender emailsender = EmailSender();
    var response = await emailsender.sendMessage("toemail@gmail.com","title","subject","body");

``` 

```dart
    emailSender custom = EmailSender("fromemail@gmail.com","passkey","toemail@gmail.com","title","subject","body");
    var response = await emailsender.details();

``` 


## -- help
```dart
    emailSender emailsender = email_sender();
    var response = await emailsender.help();

``` 
## Authors

- [SHAIK AFRID](https://www.github.com/afriddev)



## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

For help on editing plugin code, view the [documentation](https://flutter.io/developing-packages/#edit-plugin-package).