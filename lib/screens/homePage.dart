import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:vip1/customs/CustomText.dart';
import 'package:vip1/customs/colum_builder.dart';
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
      appBar: AppBar(
        backgroundColor: ColorsData.colorsPrimary,
        title: Text("KISI Betting Special VIP"),
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
                                  "${date.year}.${date.month}.${date.day} SPECIAL CORRECT SCORE !",
                                  maxLines: 3,
                                  scale: 2.2,
                                );
                              },
                              order: GroupedListOrder.DESC,
                              itemBuilder: (context, Datum dt) => Card(
                                color: Colors.white,
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
                                                child: (dt.validate == "1")
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Icon(
                                                          Icons.check,
                                                          color: Colors.green,
                                                        ),
                                                      )
                                                    : Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Icon(
                                                          FontAwesomeIcons
                                                              .question,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
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
                                                  child: Center(),
                                                ),
                                                Expanded(
                                                  flex: 5,
                                                  child: CustomText(
                                                    dt.equipes,
                                                    color: Colors.black,
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
                                                  child: Center(),
                                                ),
                                                Expanded(
                                                  flex: 5,
                                                  child: CustomText(
                                                    "Winner : " + dt.winner,
                                                    color: Colors.black,
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
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );

                          // ColumnBuilder(
                          //     itemCount: snapshot.data.data.length,
                          //     itemBuilder: (context, index) {
                          //       var dt = snapshot.data.data[index];
                          //       return Card(
                          //         color: Colors.white,
                          //         elevation: 3.0,
                          //         child: Padding(
                          //           padding: const EdgeInsets.all(8.0),
                          //           child: Column(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.center,
                          //             children: [
                          //               CustomTextMultipleLigne(
                          //                 "${dt.date.year}.${dt.date.month}.${dt.date.day} SPECIAL CORRECT SCORE !",
                          //                 maxLines: 3,
                          //                 scale: 2.2,
                          //               ),
                          //               SizedBox(
                          //                 height: 10.0,
                          //               ),
                          //               Row(
                          //                 mainAxisAlignment:
                          //                     MainAxisAlignment
                          //                         .spaceBetween,
                          //                 children: [
                          //                   Expanded(
                          //                     flex: 4,
                          //                     child: Row(
                          //                       mainAxisAlignment:
                          //                           MainAxisAlignment
                          //                               .spaceBetween,
                          //                       children: [
                          //                         Expanded(
                          //                           flex: 1,
                          //                           child: CircleAvatar(
                          //                             maxRadius: 20,
                          //                             backgroundImage:
                          //                                 NetworkImage(
                          //                                     dt.photo),
                          //                           ),
                          //                         ),
                          //                         Expanded(
                          //                           flex: 5,
                          //                           child: CustomText(
                          //                             dt.ligue,
                          //                             color: Colors.red,
                          //                             scale: 1.5,
                          //                             textAlign:
                          //                                 TextAlign.center,
                          //                           ),
                          //                         )
                          //                       ],
                          //                     ),
                          //                   ),
                          //                   Expanded(
                          //                     flex: 1,
                          //                     child: Padding(
                          //                       padding:
                          //                           const EdgeInsets.all(
                          //                               8.0),
                          //                       child: Card(
                          //                         color: Colors.white54,
                          //                         child: (dt.validate ==
                          //                                 "1")
                          //                             ? Padding(
                          //                                 padding:
                          //                                     const EdgeInsets
                          //                                         .all(8.0),
                          //                                 child: Icon(
                          //                                   Icons.check,
                          //                                   color: Colors
                          //                                       .green,
                          //                                 ),
                          //                               )
                          //                             : Padding(
                          //                                 padding:
                          //                                     const EdgeInsets
                          //                                         .all(8.0),
                          //                                 child: Icon(
                          //                                   FontAwesomeIcons
                          //                                       .question,
                          //                                   color: Colors
                          //                                       .white,
                          //                                 ),
                          //                               ),
                          //                       ),
                          //                     ),
                          //                   )
                          //                 ],
                          //               ),
                          //               SizedBox(
                          //                 height: 5.0,
                          //               ),
                          //               Row(
                          //                 mainAxisAlignment:
                          //                     MainAxisAlignment
                          //                         .spaceBetween,
                          //                 children: [
                          //                   Expanded(
                          //                     flex: 4,
                          //                     child: Row(
                          //                       mainAxisAlignment:
                          //                           MainAxisAlignment
                          //                               .spaceBetween,
                          //                       children: [
                          //                         Expanded(
                          //                           flex: 1,
                          //                           child: Center(),
                          //                         ),
                          //                         Expanded(
                          //                           flex: 5,
                          //                           child: CustomText(
                          //                             dt.equipes,
                          //                             color: Colors.black,
                          //                             scale: 1.5,
                          //                             textAlign:
                          //                                 TextAlign.center,
                          //                           ),
                          //                         )
                          //                       ],
                          //                     ),
                          //                   ),
                          //                   Expanded(
                          //                     flex: 1,
                          //                     child: Padding(
                          //                       padding:
                          //                           const EdgeInsets.all(
                          //                               8.0),
                          //                       child: Card(
                          //                           color: Colors.white54,
                          //                           child: Padding(
                          //                             padding:
                          //                                 const EdgeInsets
                          //                                     .all(8.0),
                          //                             child: CustomText(
                          //                               dt.cote,
                          //                               color: Colors.black,
                          //                               scale: 1.5,
                          //                             ),
                          //                           )),
                          //                     ),
                          //                   )
                          //                 ],
                          //               ),
                          //               SizedBox(
                          //                 height: 5.0,
                          //               ),
                          //               Row(
                          //                 mainAxisAlignment:
                          //                     MainAxisAlignment
                          //                         .spaceBetween,
                          //                 children: [
                          //                   Expanded(
                          //                     flex: 4,
                          //                     child: Row(
                          //                       mainAxisAlignment:
                          //                           MainAxisAlignment
                          //                               .spaceBetween,
                          //                       children: [
                          //                         Expanded(
                          //                           flex: 1,
                          //                           child: Center(),
                          //                         ),
                          //                         Expanded(
                          //                           flex: 5,
                          //                           child: CustomText(
                          //                             "Winner : " +
                          //                                 dt.winner,
                          //                             color: Colors.black,
                          //                             scale: 1.5,
                          //                             textAlign:
                          //                                 TextAlign.center,
                          //                           ),
                          //                         )
                          //                       ],
                          //                     ),
                          //                   ),
                          //                   Expanded(
                          //                     flex: 1,
                          //                     child: Padding(
                          //                       padding:
                          //                           const EdgeInsets.all(
                          //                               8.0),
                          //                       child: Card(
                          //                           color: Colors.white54,
                          //                           child: Padding(
                          //                             padding:
                          //                                 const EdgeInsets
                          //                                     .all(8.0),
                          //                             child: CustomText(
                          //                               dt.score,
                          //                               color: Colors.black,
                          //                               scale: 1.5,
                          //                             ),
                          //                           )),
                          //                     ),
                          //                   )
                          //                 ],
                          //               ),
                          //               SizedBox(
                          //                 height: 5.0,
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       );
                          //     });
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
}
