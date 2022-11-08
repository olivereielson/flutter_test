import 'dart:core';

import 'package:email_validator/email_validator.dart';

class Input {
  Input(this.email, this.fname, this.lname, this.age);

  String email;
  String fname;
  String lname;
  int age;

  bool validate(){

    if(fname.isEmpty || fname==""){
      return false;
    }
    if(lname.isEmpty || lname==""){
      return false;
    }
    if(age==0){
      return false;
    }
    if(!EmailValidator.validate(email)){
      return false;
    }
    return true;
  }
}
