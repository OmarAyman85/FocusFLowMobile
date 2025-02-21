part of 'add_delete_update_bloc_bloc.dart';

sealed class AddDeleteUpdateBlocState extends Equatable {
  const AddDeleteUpdateBlocState();
  
  @override
  List<Object> get props => [];
}

final class AddDeleteUpdateBlocInitial extends AddDeleteUpdateBlocState {}
