part of 'checkbox_bloc.dart';

sealed class CheckboxState {}

final class CheckboxInitial extends CheckboxState {}

class CheckboxUncheckedState extends CheckboxState {}

class CheckboxCheckedState extends CheckboxState {}
