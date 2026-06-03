import 'package:adhd_app/features/profile/complete_profile/presentation/cubit/complete_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  CompleteProfileCubit() : super(CompleteProfileStateInitial());
}