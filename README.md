# My Portfolio

A Flutter portfolio app with a welcome screen, sign-up and login flow, profile page, and an interactive animation demo.

## Features

- Shows an animated welcome screen, then opens the login screen.
- Sign-up validates the name, email, password, and password confirmation. A successful sign-up opens the profile.
- Login checks the account created during the current app session.
- The profile displays the portfolio image and bio, a contact button, Student 1 through Student 5, and the animation demo.
- The animation demo supports starting, reversing, and resetting size, color, rotation, shape, and scale animations.

Accounts are stored in memory only. They are not saved between app runs, and this project does not connect to an authentication service or backend. The Contact me button currently writes a debug message rather than opening a contact method.

## Requirements

- Flutter SDK with Dart SDK `^3.13.4`

## Run

```sh
flutter pub get
flutter run
```

To run in Chrome:

```sh
flutter run -d chrome
```

## Project Structure

```text
lib/
	main.dart                 App entrypoint and in-memory account state
	animation.dart            Reusable animated container demo
	models/user_data.dart     Local account model
	pages/
		welcome_page.dart       Animated welcome screen
		login_page.dart         Login form and shared authentication layout
		signup_page.dart        Account creation and input validation
		profile_page.dart       Portfolio, student list, and animation demo
assets/
	Adeel-real.png            Profile image
```
