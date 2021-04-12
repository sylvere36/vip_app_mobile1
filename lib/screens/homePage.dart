import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:vip1/customs/CustomText.dart';
import 'package:vip1/models/vipModel.dart';
import 'package:vip1/services/bloc/vipBloc.dart';
import 'package:vip1/utils/UIData.dart';
import 'package:flutter/material.dart';
import 'package:vip1/widgets/circularLoadingWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    blocVip.getList();
  }

  @override
  void setState(fn) {
    if (!mounted) return;
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: ColorsData.colorsPrimary,
        title: Text(ExtraString.appName),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: (() {
                blocVip.getList();
              }))
        ],
      ),
      body: Container(
          height: height,
          width: width,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              StreamBuilder<VipModel>(
                stream: blocVip.subject.stream,
                builder: (context, AsyncSnapshot<VipModel> snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      if (snapshot.data != null) {
                        if (snapshot.data.data.length > 0) {
                          snapshot.data.data
                              .sort((a, b) => b.date.compareTo(a.date));
                          return Container(
                            height: height * 0.8,
                            width: width,
                            child: GroupedListView<Datum, DateTime>(
                              elements: snapshot.data.data,
                              groupBy: (dt) {
                                return dt.date;
                              },
                              groupSeparatorBuilder: (DateTime date) {
                                return CustomTextMultipleLigne(
                                  "${date.year}.${date.month}.${date.day} SPECIAL ${ExtraString.appName} !",
                                  maxLines: 3,
                                  scale: 2.2,
                                  color: Colors.white,
                                );
                              },
                              order: GroupedListOrder.DESC,
                              itemBuilder: (context, Datum dt) => Card(
                                color: Colors.grey[500],
                                elevation: 3.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: CircleAvatar(
                                                    maxRadius: 20,
                                                    backgroundImage:
                                                        NetworkImage(dt.photo),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 5,
                                                  child: CustomText(
                                                    dt.ligue,
                                                    color: Colors.red,
                                                    scale: 1.5,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Card(
                                                  color: Colors.white54,
                                                  child: validateWidget(
                                                      dt.date, dt.validate)),
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                              color: Colors.black,
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Center(),
                                                  ),
                                                  Expanded(
                                                    flex: 5,
                                                    child: CustomText(
                                                      dt.equipes,
                                                      color: Colors.black,
                                                      scale: 1.5,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Card(
                                                    color: Colors.white54,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: CustomText(
                                                        dt.score,
                                                        color: Colors.black,
                                                        scale: 1.5,
                                                      ),
                                                    )),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                              color: Colors.black,
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Center(),
                                                  ),
                                                  Expanded(
                                                    flex: 5,
                                                    child: CustomText(
                                                      "Winner : " + dt.winner,
                                                      color: Colors.black,
                                                      scale: 1.5,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Card(
                                                    color: Colors.white54,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: CustomText(
                                                        dt.cote,
                                                        color: Colors.black,
                                                        scale: 1.5,
                                                      ),
                                                    )),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return SizedBox.shrink();
                        }
                      } else
                        return noData();
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error);
                    } else {
                      return noData();
                    }
                  }
                  return CircularLoadingWidget(
                    height: 200,
                  );
                },
              ),
              Padding(padding: EdgeInsets.only(bottom: 30.0))
            ],
          )),
    );
  }

  Widget noData() {
    return Center(
      child: Column(
        children: [Icon(FontAwesomeIcons.infoCircle), Text("No Data")],
      ),
    );
  }

  Widget validateWidget(DateTime date, String validate) {
    DateTime dateTime = DateTime.now();
    int diffMinute = dateTime.difference(date).inMinutes;

    print(diffMinute);

    if (diffMinute > 0 && validate == "0") {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    } else if (diffMinute > 0 && validate == "1") {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else if (diffMinute < 0 && validate == "0") {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          FontAwesomeIcons.question,
          color: Colors.white,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          FontAwesomeIcons.question,
          color: Colors.white,
        ),
      );
    }
  }
}
