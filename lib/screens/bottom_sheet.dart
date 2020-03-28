import 'package:bem_aventurancas/model/News.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bottomSheet {
  void newsExpanded(BuildContext context, News news) {
    showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Wrap(children: <Widget>[
            Container(
                color: Color(0xFF737372),
                child: Container(
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(12.0),
                            topRight: const Radius.circular(12.0))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: 0, maxHeight: 70),
                            child: Wrap(
                              direction: Axis.horizontal,
                              alignment: WrapAlignment.start,
                              children: <Widget>[
                                IconButton(
                                    icon: Icon(Icons.arrow_back),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    }),
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 12, bottom: 10),
                                        child: Text(
                                          news.title,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 21),
                                        )))
                              ],
                            )),
                        Divider(
                          height: 1,
                          color: Colors.grey,
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints( minHeight: 150, maxHeight: MediaQuery.of(context).size.height - 96),

                          child: SingleChildScrollView(
                            child: Padding( padding: EdgeInsets.fromLTRB(15, 10, 15, 20),
                                child: Text(
                                  news.description,
                                  style: TextStyle(
                                      letterSpacing: 0.3,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                  textAlign: TextAlign.justify,
                                )),
                          ),
                        )
                      ],
                    )))
          ]);
        });
  }
}
