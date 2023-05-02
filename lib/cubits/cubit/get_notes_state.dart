part of 'get_notes_cubit.dart';

@immutable
abstract class GetNotesState {}

class GetNotesInitial extends GetNotesState {}

class GetNotesLoading extends GetNotesState {}

class GetNotesSucess extends GetNotesState {}

class GetNotesFailed extends GetNotesState {
  final String erroString;

  GetNotesFailed(this.erroString);
}
