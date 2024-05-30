import 'package:equatable/equatable.dart';

class PreferencesEvent {}

abstract class FormEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AgeChanged extends FormEvent {
  final int age;

  AgeChanged(this.age);

  @override
  List<Object> get props => [age];
}

class HeightChanged extends FormEvent {
  final double height;

  HeightChanged(this.height);

  @override
  List<Object> get props => [height];
}

class WeightChanged extends FormEvent {
  final double weight;

  WeightChanged(this.weight);

  @override
  List<Object> get props => [weight];
}

class SubmitForm extends FormEvent {}