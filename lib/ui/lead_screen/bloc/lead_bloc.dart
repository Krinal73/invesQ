import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/models/api_base_resource/api_base_resource.dart';
import '../../../api/repositories/lead_repository/model/response_model/lead_response_model.dart';
import '../../../api/repositories/lead_repository/repository/lead_repository.dart';
import '../../../utils/enum_utils.dart';
import '../../../utils/snackbar_utils.dart';

part 'lead_event.dart';
part 'lead_state.dart';

class LeadBloc extends Bloc<LeadEvent, LeadState> {
  LeadBloc() : super(const LeadState()) {
    _leadRepository = LeadRepository();

    on<FetchLeadsEvent>(_onFetchLeads);
    on<FetchMoreLeadsEvent>(_onFetchMoreLeads);
    on<_LeadApiResponseEvent>(_onApiResponse);
    on<UpdateSearchQueryEvent>(_onUpdateSearchQuery);
    _subscription = _leadRepository.leadApiStream.listen((event) {
      add(_LeadApiResponseEvent(event));
    });
  }

  late LeadRepository _leadRepository;
  late StreamSubscription _subscription;

  void _onFetchLeads(FetchLeadsEvent event, Emitter<LeadState> emit) {
    emit(
      state.copyWith(
        apiStatus: ApiStatus.loading,
        page: 1,
        hasMore: true, // <-- important
        leads: [], // reset previous leads
      ),
    );
    _leadRepository.fetchLeads(page: 1);
  }

  void _onFetchMoreLeads(FetchMoreLeadsEvent event, Emitter<LeadState> emit) {
    if (state.isFetchingMore || !state.hasMore) return;

    emit(state.copyWith(isFetchingMore: true));
    _leadRepository.fetchLeads(page: state.page + 1);
  }

  void _onUpdateSearchQuery(
    UpdateSearchQueryEvent event,
    Emitter<LeadState> emit,
  ) {
    emit(state.copyWith(searchQuery: event.query));
  }

  void _onApiResponse(_LeadApiResponseEvent event, Emitter<LeadState> emit) {
    if (event.resource.apiStatus == ApiStatus.success) {
      final List data = event.resource.data as List;

      final newLeads = data.map((e) => LeadResponseModel.fromJson(e)).toList();
      if (newLeads.isEmpty) {
        SnackBarUtils.showSnackBar(
          message: event.resource.message,
          type: SnackBarType.success,
        );
      }
      emit(
        state.copyWith(
          apiStatus: ApiStatus.success,
          leads: [...state.leads, ...newLeads],
          page: state.page + 1,
          isFetchingMore: false,
          hasMore: newLeads.length == 50, // API page size
        ),
      );
      if (newLeads.length != 50)
        SnackBarUtils.showSnackBar(
          message: event.resource.message,
          type: SnackBarType.success,
        );
    } else {
      emit(
        state.copyWith(
          apiStatus: event.resource.apiStatus,
          isFetchingMore: false,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}

class _LeadApiResponseEvent extends LeadEvent {
  final ApiBaseResource resource;
  const _LeadApiResponseEvent(this.resource);
}
