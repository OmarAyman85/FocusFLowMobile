part of 'add_delete_update_bloc.dart';

sealed class AddDeleteUpdateBlocState extends Equatable {
  const AddDeleteUpdateBlocState();

  @override
  List<Object> get props => [];
}

final class AddDeleteUpdateBlocInitial extends AddDeleteUpdateBlocState {}

class LoadingAddDeleteUpdateBlocState extends AddDeleteUpdateBlocState {}

class ErrorAddDeleteUpdateBlocState extends AddDeleteUpdateBlocState {
  final String message;

  const ErrorAddDeleteUpdateBlocState({required this.message});

  @override
  List<Object> get props => [message];
}

class MessageAddDeleteUpdateBlocState extends AddDeleteUpdateBlocState {
  final String message;

  const MessageAddDeleteUpdateBlocState({required this.message});

  @override
  List<Object> get props => [message];
}
