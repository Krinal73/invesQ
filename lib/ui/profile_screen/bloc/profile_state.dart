// part of 'profile_bloc.dart';
//
// class ProfileState extends Equatable {
//   const ProfileState({
//     this.apiStatus,
//     this.generalProfileResponseModel,
//     this.familyApiStatus,
//     this.familyResponseModel,
//     this.childrenApiStatus,
//     this.childrenResponseModel,
//     this.educationApiStatus,
//     this.educationResponseModel,
//     this.professionApiStatus,
//     this.professionResponseModel,
//
//     this.isGeneralExpanded = false,
//     this.isFamilyExpanded = false,
//     this.isEducationExpanded = false,
//     this.isProfessionExpanded = false,
//   });
//
//   final ApiStatus? apiStatus;
//   final GeneralProfileResponseModel? generalProfileResponseModel;
//
//   final ApiStatus? familyApiStatus;
//   final FamilyResponseModel? familyResponseModel;
//
//   final ApiStatus? childrenApiStatus;
//   final List<ChildrenResponseModel>? childrenResponseModel;
//
//   final ApiStatus? educationApiStatus;
//   final List<EducationResponseModel>? educationResponseModel;
//
//   final ApiStatus? professionApiStatus;
//   final List<ProfessionResponseModel>? professionResponseModel;
//
//   final bool isGeneralExpanded;
//   final bool isFamilyExpanded;
//   final bool isEducationExpanded;
//   final bool isProfessionExpanded;
//
//   ProfileState copyWith({
//     ApiStatus? apiStatus,
//     GeneralProfileResponseModel? generalProfileResponseModel,
//     ApiStatus? familyApiStatus,
//     FamilyResponseModel? familyResponseModel,
//     ApiStatus? childrenApiStatus,
//     List<ChildrenResponseModel>? childrenResponseModel,
//     ApiStatus? educationApiStatus,
//     List<EducationResponseModel>? educationResponseModel,
//     ApiStatus? professionApiStatus,
//     List<ProfessionResponseModel>? professionResponseModel,
//
//     bool? isGeneralExpanded,
//     bool? isFamilyExpanded,
//     bool? isEducationExpanded,
//     bool? isProfessionExpanded,
//   }) {
//     return ProfileState(
//       apiStatus: apiStatus ?? this.apiStatus,
//       generalProfileResponseModel:
//           generalProfileResponseModel ?? this.generalProfileResponseModel,
//       familyApiStatus: familyApiStatus ?? this.familyApiStatus,
//       familyResponseModel: familyResponseModel ?? this.familyResponseModel,
//       childrenApiStatus: childrenApiStatus ?? this.childrenApiStatus,
//       childrenResponseModel:
//           childrenResponseModel ?? this.childrenResponseModel,
//       educationApiStatus: educationApiStatus ?? this.educationApiStatus,
//       educationResponseModel:
//           educationResponseModel ?? this.educationResponseModel,
//
//       professionApiStatus: professionApiStatus ?? this.professionApiStatus,
//       professionResponseModel:
//           professionResponseModel ?? this.professionResponseModel,
//
//       isGeneralExpanded: isGeneralExpanded ?? this.isGeneralExpanded,
//       isFamilyExpanded: isFamilyExpanded ?? this.isFamilyExpanded,
//       isEducationExpanded: isEducationExpanded ?? this.isEducationExpanded,
//       isProfessionExpanded: isProfessionExpanded ?? this.isProfessionExpanded,
//     );
//   }
//
//   @override
//   List<Object?> get props => [
//     apiStatus,
//     generalProfileResponseModel,
//     familyApiStatus,
//     familyResponseModel,
//     childrenApiStatus,
//     childrenResponseModel,
//     educationApiStatus,
//     educationResponseModel,
//     professionApiStatus,
//     professionResponseModel,
//
//     isGeneralExpanded,
//     isFamilyExpanded,
//     isEducationExpanded,
//     isProfessionExpanded,
//   ];
// }
