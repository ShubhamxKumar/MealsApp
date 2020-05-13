import 'package:flutter/material.dart';
class Category  {
  @required final String id;
  @required final String title;
  @required final Color color;

  const Category({this.id, this.title, this.color}); // const means that the properties of the object can't be chnaged after the object has been created.
}