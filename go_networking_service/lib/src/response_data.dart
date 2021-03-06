import 'model/auth_session_info.dart';

typedef S ItemCreator<S>();

typedef List<L> ItemsCreator<L>();

abstract class BaseModelInterface extends JSONable {}

abstract class PagingInterface extends JSONable {
  int pageNumber;
  int pageSize;
}

class ResponseListData<T extends BaseModelInterface> {
  ItemsCreator creators;
  PagingInterface paging;
  ResponseListData(this.creators, {this.paging});
  List<T> get data {
    return creators();
  }
}
