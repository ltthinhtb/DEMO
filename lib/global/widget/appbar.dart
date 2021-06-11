import 'package:flutter/material.dart';

AppBar appBarCustom(BuildContext context, {String? title}) {
  return AppBar(
    title: Text(
      title ?? "",
      style: Theme.of(context).textTheme.headline1,
    ),
    actions: [
      IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none_outlined)),
      IconButton(onPressed: (){}, icon: Icon(Icons.search_outlined)),
    ],
  );
}
