import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'formatter.dart';

class PostItem {
  final String id;
  final String title;
  final String subreddit;
  final String subredditPrefixed;
  final String user;
  final int score;
  final int comments;
  final String url;
  final String thumbnailUrl;

  PostItem(this.id, this.title, this.subreddit, this.subredditPrefixed,
      this.user, this.score, this.comments, this.url, this.thumbnailUrl);

  getId() => id;

  getSubreddit() => subreddit;

  renderable(BuildContext context) {
    return new Container(
      margin:
          const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
      child: Column(children: <Widget>[
        Row(children: <Widget>[
          Text(
            subredditPrefixed,
            style: Theme.of(context).textTheme.body2,
          ),
          SizedBox(width: 10),
          Text(
            'u/' + user,
            style: Theme.of(context).textTheme.body1,
          ),
        ]),
        Column(children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (thumbnailUrl != null)
                    Image.network(thumbnailUrl, width: 80.0),
                  if (thumbnailUrl != null) SizedBox(width: 10.0),
                  Flexible(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ),
                ]),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(children: <Widget>[
                    Icon(
                      Icons.comment,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 3),
                    Text(
                      Formatter.uiCount(comments),
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ]),
                ),
                Container(
                    child: Row(children: <Widget>[
                  Icon(
                    Icons.arrow_upward,
                    color: Colors.red,
                  ),
                  SizedBox(width: 3),
                  Text(
                    Formatter.uiCount(score),
                    style: Theme.of(context).textTheme.caption,
                  ),
                ])),
              ])
        ])
      ]),
    );
  }
}