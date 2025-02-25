// String? Function(String?)

import 'package:regexpattern/regexpattern.dart';

//? user name
String? validateUserName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a user name';
  }
  if (!value.trim().isUsername()) {
    return 'Please enter a valid user name';
  }
  return null;
}

//? name and last name
String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a first name';
  }
  if (!value.trim().isUsernameGoogle()) {
    return 'Please enter a valid first name';
  }
  return null;
}

//? email
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an email';
  }
  if (!value.trim().isEmail()) {
    return 'Please enter a valid email';
  }
  return null;
}

//? password
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }
  if (!value.trim().isPasswordEasy()) {
    return 'Please enter a hard password';
  }
  return null;
}

//? re password
String? validateRePassword(String? value, String? password) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }
  if (value != password) {
    return 'Passwords do not match';
  }
  return null;
}

String? validatePhone(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a phone number';
  }
  if (!value.trim().isPhone()) {
    return 'Please enter a valid phone number';
  }
  return null;
}
