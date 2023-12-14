import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapi/blocs/newsbloc/news_event.dart';
import 'package:newsapi/blocs/newsbloc/news_state.dart';
import 'package:newsapi/models/article_model.dart';
import 'package:newsapi/repositories/news_repository.dart';

class NewsBloc extends Bloc<NewsEvents, NewsStates> {
  NewsRepository newsRepository;
  NewsBloc({required NewsStates initialState, required this.newsRepository})
      : super(initialState) {
    add(StartEvent());
  }

  @override
   Stream<NewsStates> mapEventToState(
    NewsEvents event
  ) async* {
    if (event is StartEvent) {
      yield NewsLoadingState();
      try {
        List<ArticleModel> _articleList;
        _articleList = await newsRepository.fetchNews();
        yield NewsLoadedState(articleList: _articleList);

      } catch (e) {
        yield NewsErrorState(errorMessage: e.toString());
      }
    }
  }
}
