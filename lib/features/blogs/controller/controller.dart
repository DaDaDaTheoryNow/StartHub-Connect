import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starthub_connect/core/models/blog.dart';
import 'package:starthub_connect/core/models/user.dart';
import 'package:starthub_connect/core/util/app_dialog.dart';
import 'package:starthub_connect/features/blogs/controller/state.dart';

class BlogsController extends GetxController {
  final state = BlogsState();

  final appDialog = AppDialog();

  void createNewBlog(BlogModel blogModel) async {
    appDialog.loading();

    DatabaseReference messagesRef = FirebaseDatabase.instance
        .ref()
        .child('users/${FirebaseAuth.instance.currentUser!.uid}/blogs');

    DatabaseReference newMessageRef = messagesRef.push();

    FocusManager.instance.primaryFocus?.unfocus();

    await Future.delayed(const Duration(milliseconds: 300));

    await newMessageRef.set(BlogModel.toFirebase(blogModel));

    appDialog.close();
  }

  void deleteFromBlogs(String blogKey) async {
    DatabaseReference blogRef = FirebaseDatabase.instance.ref().child(
        'users/${FirebaseAuth.instance.currentUser!.uid}/blogs/$blogKey');

    await blogRef.remove();
  }

  void getUserBlogs(UserModel user) {
    state.isUserBlogsLoading.value = true;
    state.userAvatarUrl.value = user.image;
    _subscribeToUserBlogs(
        FirebaseDatabase.instance.ref().child('users/${user.uid}'));
  }

  void updateBlogs(Map<dynamic, dynamic> channelsData) async {
    final List<BlogModel> parsedBlogs =
        (channelsData["blogs"] as Map<Object?, Object?>?)
                ?.entries
                .map((entry) => BlogModel.fromFirebase(entry))
                .toList() ??
            [];

    state.blogs.value = parsedBlogs;
  }

  void updateUserBlogs(Map<dynamic, dynamic> channelsData) async {
    final List<BlogModel> parsedBlogs =
        (channelsData["blogs"] as Map<Object?, Object?>?)
                ?.entries
                .map((entry) => BlogModel.fromFirebase(entry))
                .toList() ??
            [];

    state.userBlogs.value = parsedBlogs;

    state.isUserBlogsLoading.value = false;
  }

  @override
  void onInit() {
    _subscribeToBlogs(FirebaseDatabase.instance
        .ref()
        .child('users/${FirebaseAuth.instance.currentUser!.uid}'));

    super.onInit();
  }

  late StreamSubscription subscribeToBlogs;
  void _subscribeToBlogs(DatabaseReference blogsRef) {
    subscribeToBlogs = blogsRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        updateBlogs(event.snapshot.value as Map<Object?, Object?>);
      }
    });
  }

  StreamSubscription? subscribeToUserBlogs;
  void _subscribeToUserBlogs(DatabaseReference userBlogsRef) {
    subscribeToBlogs = userBlogsRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        updateUserBlogs(event.snapshot.value as Map<Object?, Object?>);
      }
    });
  }

  @override
  void onClose() {
    subscribeToBlogs.cancel();
    subscribeToUserBlogs?.cancel();
    super.onClose();
  }
}
