// import 'dart:async';
//
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sharadagram/api/models/api_base_resource/api_base_resource.dart';
// import 'package:sharadagram/api/repositories/profile_repository/model/family_response_model/family_response_model.dart';
// import 'package:sharadagram/api/repositories/profile_repository/repository/profile_repository.dart';
// import 'package:sharadagram/utils/enum_utils.dart';
//
// import '../../../../api/repositories/profile_repository/model/children_response_model/children_response_model.dart';
// import '../../../../api/repositories/profile_repository/model/education_response_model/education_response_model.dart';
// import '../../../../api/repositories/profile_repository/model/general_profile_response_model/general_profile_response_model.dart';
// import '../../../../api/repositories/profile_repository/model/profession_response_model/profession_response_model.dart';
//
// part 'profile_event.dart';
// part 'profile_state.dart';
//
// class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
//   ProfileBloc() : super(ProfileState()) {
//     print("🔥🔥 ProfileBloc CONSTRUCTOR CALLED");
//     _profileRepository = ProfileRepository();
//
//     on<LoadProfileEvent>(_mapLoadProfileEventToState);
//     on<GeneralProfileApiBaseResourceEvent>(
//       _mapGeneralProfileApiBaseResourceEventToState,
//     );
//
//     on<FamilyApiBaseResourceEvent>(_mapFamilyApiBaseResourceEventToState);
//     on<ChildrenApiBaseResourceEvent>(_mapChildrenApiBaseResourceEventToState);
//     on<EducationApiBaseResourceEvent>(_mapEducationApiBaseResourceEventToState);
//     on<ProfessionApiBaseResourceEvent>(
//       _mapProfessionApiBaseResourceEventToState,
//     );
//
//     on<ToggleProfileSectionEvent>((event, emit) {
//       switch (event.section) {
//         case ProfileSectionType.general:
//           emit(state.copyWith(isGeneralExpanded: !state.isGeneralExpanded));
//           break;
//
//         case ProfileSectionType.family:
//           emit(state.copyWith(isFamilyExpanded: !state.isFamilyExpanded));
//           break;
//
//         case ProfileSectionType.education:
//           emit(state.copyWith(isEducationExpanded: !state.isEducationExpanded));
//           break;
//
//         case ProfileSectionType.profession:
//           emit(
//             state.copyWith(isProfessionExpanded: !state.isProfessionExpanded),
//           );
//           break;
//       }
//     });
//
//     _profileStreamSubscription = _profileRepository.getGeneralProfileApiStream
//         .listen((event) {
//           add(GeneralProfileApiBaseResourceEvent(apiBaseResource: event));
//         });
//
//     _familyStreamSubscription = _profileRepository.getFamilyApiStream.listen((
//       event,
//     ) {
//       add(FamilyApiBaseResourceEvent(apiBaseResource: event));
//     });
//
//     _childrenStreamSubscription = _profileRepository.getChildrenApiStream
//         .listen((event) {
//           add(ChildrenApiBaseResourceEvent(apiBaseResource: event));
//         });
//
//     _educationStreamSubscription = _profileRepository.getEducationApiStream
//         .listen((event) {
//           add(EducationApiBaseResourceEvent(apiBaseResource: event));
//         });
//
//     _professionStreamSubscription = _profileRepository.getProfessionApiStream
//         .listen((event) {
//           add(ProfessionApiBaseResourceEvent(apiBaseResource: event));
//         });
//   }
//
//   late ProfileRepository _profileRepository;
//   late StreamSubscription _profileStreamSubscription;
//   late StreamSubscription _familyStreamSubscription;
//   late StreamSubscription _childrenStreamSubscription;
//   late StreamSubscription _educationStreamSubscription;
//   late StreamSubscription _professionStreamSubscription;
//
//   @override
//   Future<void> close() {
//     _profileStreamSubscription.cancel();
//     _familyStreamSubscription.cancel();
//     _childrenStreamSubscription.cancel();
//     _educationStreamSubscription.cancel();
//     _professionStreamSubscription.cancel();
//     return super.close();
//   }
//
//   void _mapLoadProfileEventToState(
//     LoadProfileEvent event,
//     Emitter<ProfileState> emit,
//   ) {
//     print("Load bloc called");
//     _profileRepository.getProfile();
//     _profileRepository.getFamily();
//     _profileRepository.getChildren();
//     _profileRepository.getEducation();
//     _profileRepository.getProfession();
//   }
//
//   void _mapGeneralProfileApiBaseResourceEventToState(
//     GeneralProfileApiBaseResourceEvent event,
//     Emitter<ProfileState> emit,
//   ) {
//     print("📦 General Profile Api Status : ${event.apiBaseResource.apiStatus}");
//     emit(state.copyWith(apiStatus: event.apiBaseResource.apiStatus));
//     GeneralProfileResponseModel? model;
//
//     if (event.apiBaseResource.data != null) {
//       model = GeneralProfileResponseModel.fromJson(
//         event.apiBaseResource.data as Map<String, dynamic>,
//       );
//     }
//
//     emit(
//       state.copyWith(
//         apiStatus: event.apiBaseResource.apiStatus,
//         generalProfileResponseModel: model,
//       ),
//     );
//   }
//
//   void _mapFamilyApiBaseResourceEventToState(
//     FamilyApiBaseResourceEvent event,
//     Emitter<ProfileState> emit,
//   ) {
//     print("📦 Family Profile Api Status : ${event.apiBaseResource.apiStatus}");
//     emit(state.copyWith(familyApiStatus: event.apiBaseResource.apiStatus));
//     FamilyResponseModel? model;
//
//     if (event.apiBaseResource.data != null) {
//       model = FamilyResponseModel.fromJson(
//         event.apiBaseResource.data as Map<String, dynamic>,
//       );
//     }
//
//     emit(
//       state.copyWith(
//         familyApiStatus: event.apiBaseResource.apiStatus,
//         familyResponseModel: model,
//       ),
//     );
//   }
//
//   void _mapChildrenApiBaseResourceEventToState(
//     ChildrenApiBaseResourceEvent event,
//     Emitter<ProfileState> emit,
//   ) {
//     print(
//       "📦 Children Profile Api Status : ${event.apiBaseResource.apiStatus}",
//     );
//     emit(state.copyWith(childrenApiStatus: event.apiBaseResource.apiStatus));
//     List<ChildrenResponseModel>? model;
//
//     if (event.apiBaseResource.data != null) {
//       model = (event.apiBaseResource.data as List)
//           .map((e) => ChildrenResponseModel.fromJson(e))
//           .toList();
//     }
//
//     emit(
//       state.copyWith(
//         childrenApiStatus: event.apiBaseResource.apiStatus,
//         childrenResponseModel: model,
//       ),
//     );
//   }
//
//   void _mapEducationApiBaseResourceEventToState(
//     EducationApiBaseResourceEvent event,
//     Emitter<ProfileState> emit,
//   ) {
//     print(
//       "📦 Education Profile Api Status : ${event.apiBaseResource.apiStatus}",
//     );
//     emit(state.copyWith(educationApiStatus: event.apiBaseResource.apiStatus));
//     List<EducationResponseModel>? model;
//
//     if (event.apiBaseResource.data != null) {
//       model = (event.apiBaseResource.data as List)
//           .map((e) => EducationResponseModel.fromJson(e))
//           .toList();
//     }
//
//     emit(
//       state.copyWith(
//         educationApiStatus: event.apiBaseResource.apiStatus,
//         educationResponseModel: model,
//       ),
//     );
//   }
//
//   void _mapProfessionApiBaseResourceEventToState(
//     ProfessionApiBaseResourceEvent event,
//     Emitter<ProfileState> emit,
//   ) {
//     print(
//       "📦 Profession Profile Api Status : ${event.apiBaseResource.apiStatus}",
//     );
//     emit(state.copyWith(professionApiStatus: event.apiBaseResource.apiStatus));
//     List<ProfessionResponseModel>? model;
//
//     if (event.apiBaseResource.data != null) {
//       model = (event.apiBaseResource.data as List)
//           .map((e) => ProfessionResponseModel.fromJson(e))
//           .toList();
//     }
//
//     emit(
//       state.copyWith(
//         professionApiStatus: event.apiBaseResource.apiStatus,
//         professionResponseModel: model,
//       ),
//     );
//   }
// }
