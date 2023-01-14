import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int counterValue;
  final bool wasIncremented;

  const CounterState({
    required this.counterValue,
    required this.wasIncremented,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [counterValue, wasIncremented];
}
