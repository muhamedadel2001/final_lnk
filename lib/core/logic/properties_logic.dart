/*
import 'dart:async';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/material.dart';

class PropertiesLogic {
  final BuildContext context;
  final TextEditingController searchController;
  final ScrollController scrollController;
  Timer? _debounce;

  BookListLogic({
    required this.context,
    required this.searchController,
    required this.scrollController,
  });

  void init() {
    _fetchBooks();
    _scrollControllerListener();
    _searchControllerListener();
  }

  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    scrollController.dispose();
  }

  void _fetchBooks() {
    BookCubit.get(context).fetchBooks(context: context);
  }

  void _scrollControllerListener() {
    scrollController.addListener(_onScroll);
  }

  void _searchControllerListener() {
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      if (searchController.text.isNotEmpty) {
        if (searchController.text != BookCubit.get(context).currentQuery) {
          BookCubit.get(
            context,
          ).fetchBooks(isRefresh: true, query: searchController.text,context: context);
        }
      } else {
        BookCubit.get(context).fetchBooks(context: context);
      }
    });
  }

  void _onScroll() async{
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 100 &&
        BookCubit.get(context).state is BookLoaded &&
        BookCubit.get(context).hasMore) {
      if (BookCubit.get(context).currentQuery != null) {
        if(await DataConnectionChecker().hasConnection) {
          BookCubit.get(context).fetchBooks(query: searchController.text, isRefresh: true, context: context);
        }
      } else {
        if(await DataConnectionChecker().hasConnection){
          BookCubit.get(context).fetchBooks(context: context);
        }

      }
    }
  }
}
*/
