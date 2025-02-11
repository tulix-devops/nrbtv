import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:commons/commons.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nrbtv/src/data/data.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required GetAuthTokenUseCase getAuthTokenUseCase,
    required ProfileRepository profileRepository,
  })  : _getAuthTokenUseCase = getAuthTokenUseCase,
        _profileRepository = profileRepository,
        super(const ProfileState());

  final GetAuthTokenUseCase _getAuthTokenUseCase;
  final ProfileRepository _profileRepository;

  void onNameChanged(String name) {
    emit(state.copyWith(name: (value: name, error: _validateString(name))));
  }

  void onLastNameChanged(String lastName) {
    emit(state.copyWith(
        lastName: (value: lastName, error: _validateString(lastName))));
  }

  void onPhoneNumberChanged(String phoneNumber) {
    emit(state.copyWith(phoneNumber: (
      value: phoneNumber,
      error: _validateString(phoneNumber)
    )));
  }

  void onFileChanged(String file) {
    emit(state.copyWith(file: file));
  }

  void onSubmit() async {
    if (state.status == FormStatus.inProgress || !state.isValid) {
      return;
    }

    emit(state.copyWith(status: FormStatus.inProgress));

    FillProfileInfoParams params = FillProfileInfoParams(
      name: state.name.value,
      lastName: state.lastName.value,
      phoneNumber: state.phoneNumber.value,
      file: state.file,
    );

    final result = await _profileRepository.fillProfileInfo(params);

    (switch (result) {
      SuccessModel<ProfileModel>() => emit(
          state.copyWith(
            status: FormStatus.success,
          ),
        ),
      FailureModel<ProfileModel>() => emit(state.copyWith(
          status: FormStatus.failure,
          formError: result.message,
        )),
      ValidationFailureModel<ProfileModel>() => emit(state.copyWith(
          status: FormStatus.failure,
          formError: state.errorsToString(result.validationErrors),
        )),
      ModelNotFoundFailureModel<ProfileModel>() => emit(state.copyWith(
          status: FormStatus.failure,
          formError: result.message,
        )),
      _ => emit(state.copyWith(
          status: FormStatus.failure,
          formError: 'Something went wrong',
        )),
    });
  }

  void verifySubscription() {}

  Future<void> cancelSubscription() async {
    emit(state.copyWith(status: FormStatus.inProgress));
    final token = await _getAuthTokenUseCase();
    if (token == null) return;
    final result = await _profileRepository.cancelSubscription(token);
    (switch (result) {
      SuccessModel<CancelSubscriptionModel>() => emit(
          state.copyWith(
            status: FormStatus.success,
          ),
        ),
      FailureModel<CancelSubscriptionModel>() => emit(state.copyWith(
          status: FormStatus.failure,
          formError: result.message,
        )),
      ValidationFailureModel<CancelSubscriptionModel>() => emit(state.copyWith(
          status: FormStatus.failure,
          formError: state.errorsToString(result.validationErrors),
        )),
      ModelNotFoundFailureModel<CancelSubscriptionModel>() =>
        emit(state.copyWith(
          status: FormStatus.failure,
          formError: result.message,
        )),
      _ => emit(state.copyWith(
          status: FormStatus.failure,
          formError: 'Something went wrong',
        )),
    });
  }

  String? _validateString(String value) {
    if (value.isEmpty) {
      return 'Please fill out this field';
    }

    return null;
  }
}
