part of 'lead_bloc.dart';

class LeadState extends Equatable {
  final ApiStatus? apiStatus;
  final List<LeadResponseModel> leads;
  final int page;
  final bool isFetchingMore;
  final bool hasMore;
  final String searchQuery;

  const LeadState({
    this.apiStatus,
    this.leads = const [],
    this.page = 1,
    this.isFetchingMore = false,
    this.hasMore = true,
    this.searchQuery = '',
  });

  LeadState copyWith({
    ApiStatus? apiStatus,
    List<LeadResponseModel>? leads,
    int? page,
    bool? isFetchingMore,
    bool? hasMore,
    String? searchQuery,
  }) {
    return LeadState(
      apiStatus: apiStatus ?? this.apiStatus,
      leads: leads ?? this.leads,
      page: page ?? this.page,
      isFetchingMore: isFetchingMore ?? this.isFetchingMore,
      hasMore: hasMore ?? this.hasMore,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [
    apiStatus,
    leads,
    page,
    isFetchingMore,
    hasMore,
    searchQuery,
  ];
}
