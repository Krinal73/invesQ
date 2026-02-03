import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/enum_utils.dart';
import '../bloc/lead_bloc.dart';

class LeadScreen extends StatefulWidget {
  static const String route = '/lead';

  @override
  State<LeadScreen> createState() => _LeadScreenState();
}

class _LeadScreenState extends State<LeadScreen> {
  final _scrollController = ScrollController();
  late final LeadBloc _leadBloc;

  @override
  void initState() {
    super.initState();
    _leadBloc = LeadBloc()..add(FetchLeadsEvent());
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _leadBloc.add(FetchMoreLeadsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _leadBloc,
      child: Column(
        children: [
          // 1️⃣ Search TextField at the top
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search leads...',
                border: OutlineInputBorder(),
                suffixIcon: const Icon(Icons.search),
              ),
              onChanged: (value) {
                // Use the local bloc reference to update search query
                _leadBloc.add(UpdateSearchQueryEvent(value));
              },
            ),
          ),

          // 2️⃣ Expanded ListView wrapped in BlocBuilder
          Expanded(
            child: BlocBuilder<LeadBloc, LeadState>(
              builder: (context, state) {
                // Show loader if first page is loading
                if (state.apiStatus == ApiStatus.loading &&
                    state.leads.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                // Filter leads based on search query
                final filteredLeads = state.leads
                    .where(
                      (lead) =>
                          lead.name!.toLowerCase().contains(
                            state.searchQuery.toLowerCase(),
                          ) ||
                          (lead.company?.toLowerCase().contains(
                                state.searchQuery.toLowerCase(),
                              ) ??
                              false),
                    )
                    .toList();

                return ListView.builder(
                  controller: _scrollController,
                  itemCount:
                      filteredLeads.length + (state.isFetchingMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index >= filteredLeads.length) {
                      return const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    final lead = filteredLeads[index];
                    return ListTile(
                      title: Text(lead.name ?? '-'),
                      subtitle: Text(lead.company ?? ''),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _leadBloc.close();
    super.dispose();
  }
}
