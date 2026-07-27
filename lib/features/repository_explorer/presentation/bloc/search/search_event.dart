part of 'search_bloc.dart';

@freezed
sealed class SearchEvent with _$SearchEvent {
  const factory SearchEvent.queryChanged(String query) = SearchQueryChanged;
  const factory SearchEvent.submitted(String query) = SearchSubmitted;
  const factory SearchEvent.loadNextPage() = SearchLoadNextPage;
  const factory SearchEvent.retryPage(int page) = SearchPageRetried;
  const factory SearchEvent.refreshed() = SearchRefreshed;
}
