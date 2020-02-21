import 'dart:math';

import 'package:flutter/material.dart';
class Calculator{

  Calculator({this.weight, this.height});

  final int height;
  final int weight;
  double _bmi;

  String calculateBMI(){
     _bmi = weight /pow(height/100, 2);
     return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      return 'Overweight';
    }
    else if(_bmi > 18.5)
      {
        return 'Normal';
      }
    else{
      return 'underweight';
    }
  }
  String getInterpret(){
    if(_bmi >= 25){
      return 'You body weight is higher than the normal body weight try to exercise more';
    }
    else if(_bmi > 18.5)
    {
      return 'You have a normal body weight. Good job!!';
    }
    else{
      return 'You have a lower body weight than the normal body .You can eat more ';
    }
  }

}