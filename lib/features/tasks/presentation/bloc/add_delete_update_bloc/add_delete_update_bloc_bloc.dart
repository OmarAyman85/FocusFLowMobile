import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_delete_update_bloc_event.dart';
part 'add_delete_update_bloc_state.dart';

class AddDeleteUpdateBlocBloc extends Bloc<AddDeleteUpdateBlocEvent, AddDeleteUpdateBlocState> {
  AddDeleteUpdateBlocBloc() : super(AddDeleteUpdateBlocInitial()) {
    on<AddDeleteUpdateBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
