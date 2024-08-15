class PaginatorModel {
  PaginatorModel({
      int? currentPage, 
      int? perPageItemCount, 
      int? currentPageItemCount, 
      int? totalItems, 
      int? totalPages, 
      bool? lastPage,}){
    _currentPage = currentPage;
    _perPageItemCount = perPageItemCount;
    _currentPageItemCount = currentPageItemCount;
    _totalItems = totalItems;
    _totalPages = totalPages;
    _lastPage = lastPage;
}

  PaginatorModel.fromJson(dynamic json) {
    _currentPage = json['currentPage'];
    _perPageItemCount = json['perPageItemCount'];
    _currentPageItemCount = json['currentPageItemCount'];
    _totalItems = json['totalItems'];
    _totalPages = json['totalPages'];
    _lastPage = json['lastPage'];
  }
  int? _currentPage;
  int? _perPageItemCount;
  int? _currentPageItemCount;
  int? _totalItems;
  int? _totalPages;
  bool? _lastPage;

  int? get currentPage => _currentPage;
  int? get perPageItemCount => _perPageItemCount;
  int? get currentPageItemCount => _currentPageItemCount;
  int? get totalItems => _totalItems;
  int? get totalPages => _totalPages;
  bool? get lastPage => _lastPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = _currentPage;
    map['perPageItemCount'] = _perPageItemCount;
    map['currentPageItemCount'] = _currentPageItemCount;
    map['totalItems'] = _totalItems;
    map['totalPages'] = _totalPages;
    map['lastPage'] = _lastPage;
    return map;
  }

}