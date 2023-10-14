import 'package:d_chart/commons/config_render.dart';
import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/time/line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slicing_test/data/leaderboard_model.dart';
import 'package:slicing_test/data/recent_lead_model.dart';

import '../data/performance_model.dart';

// ignore: must_be_immutable
class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  List<TimeData> timeDataList = [
    TimeData(domain: DateTime(2023, 8, 26), measure: 250.000),
    TimeData(domain: DateTime(2023, 8, 27), measure: 450.000),
    TimeData(domain: DateTime(2023, 8, 29), measure: 270.000),
    TimeData(domain: DateTime(2023, 9, 1), measure: 800.000),
  ];

  final List<PerformanceModel> dataPerformances = [
    PerformanceModel(
        imageName: "ic_total_lead",
        titleName: "Total Lead",
        valueName: "57",
        timeName: "Last Month",
        percentValue: "+3.5%"),
    PerformanceModel(
        imageName: "ic_hot_lead",
        titleName: "Hot Lead",
        valueName: "28",
        timeName: "Last Month",
        percentValue: "-1.25%"),
    PerformanceModel(
        imageName: "ic_total_deals",
        titleName: "Total Deals",
        valueName: "100",
        timeName: "Last Month",
        percentValue: "0%"),
  ];

  final List<RecentLeadModel> dataRecents = [
    RecentLeadModel(
        imageName: "avatar_1",
        userName: "Shinta Alexandra",
        dateName: "31 January 2023",
        iconName: "ic_star_white",
        buttonColor: Color.fromRGBO(120, 100, 230, 1),
        descIcon: "New Lead",
        value: "Rp. 13.000.000"),
    RecentLeadModel(
        imageName: "avatar_2",
        userName: "Vita Arsalansia",
        dateName: "31 January 2023",
        iconName: "ic_hot_lead_white",
        buttonColor: Color.fromRGBO(235, 115, 160, 1),
        descIcon: "Hot Lead",
        value: "Rp. 13.000.000"),
    RecentLeadModel(
        imageName: "avatar_5",
        userName: "Meriko Yolanda",
        dateName: "31 January 2023",
        iconName: "ic_cold_lead_white",
        buttonColor: Color.fromRGBO(237, 173, 96, 1),
        descIcon: "Cold Lead",
        value: "Rp. 13.000.000"),
  ];

  final List<LeaderboardsModel> dataLeaderboards = [
    LeaderboardsModel(
        imageName: "avatar_1",
        userName: "Shinta Alexandra",
        dateName: "31 January 2023",
        value: "45"),
    LeaderboardsModel(
        imageName: "avatar_2",
        userName: "Jonathan Zegwin",
        dateName: "23 January 2023",
        value: "41"),
    LeaderboardsModel(
        imageName: "avatar_3",
        userName: "Vita Arsalansia",
        dateName: "15 January 2023",
        value: "34"),
    LeaderboardsModel(
        imageName: "avatar_4",
        userName: "Meriko Yolanda",
        dateName: "17 January 2023",
        value: "30"),
    LeaderboardsModel(
        imageName: "avatar_5",
        userName: "Higuain Morelan",
        dateName: "22 January 2023",
        value: "25"),
  ];

  @override
  Widget build(BuildContext context) {
    final timeGroupList = [
      TimeGroup(
        id: '1',
        data: timeDataList,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Icon(
                  Icons.notifications_rounded,
                  color: Colors.white,
                  size: 24,
                ),
                const SizedBox(
                  width: 12,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/images/avatar_profile.png",
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.purple),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Total Revenue",
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        )),
                        const Icon(
                          Icons.more_horiz_rounded,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Rp 257.500.000",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.purple),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: DChartLineT(
                              fillColor: (group, ordinalData, index) {
                                if (ordinalData.measure > 400) return Colors.red;
                                return Colors.blue;
                              },
                              groupList: timeGroupList,
                              configRenderLine: ConfigRenderLine(
                                includePoints: true,
                                includeArea: true,
                                radiusPx: 12,
                                roundEndCaps: true,
                              ),
                              areaColor: (group, ordinalData, index) {
                                return Colors.white.withOpacity(0.3);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/ic_performance.png",
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Text(
                            "Key Performance Indicator",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(53, 32, 63, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 120.0, // Height of the horizontal ListView
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                            child: ListView.builder(
                              scrollDirection: Axis
                                  .horizontal, // Set the scroll direction to horizontal
                              itemCount: dataPerformances
                                  .length, // Replace with the number of items you need
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    // border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey, // Warna bayangan
                                        blurRadius: 2, // Jarak bayangan
                                        offset: Offset(0,
                                            2), // Geser bayangan horizontal dan vertikal
                                      ),
                                    ],
                                  ),
                                  width: 120.0,
                                  height: 95.0,
                                  margin: const EdgeInsets.all(4),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 3),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                                "assets/icons/${dataPerformances[index].imageName}.png"),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              dataPerformances[index].titleName,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              dataPerformances[index].valueName,
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 27,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              dataPerformances[index].timeName,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              dataPerformances[index]
                                                  .percentValue,
                                              style: GoogleFonts.poppins(
                                                fontSize: 9,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Recent Lead",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(53, 32, 63, 1),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.purple.shade50,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 16,
                                  color: Colors.purple,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 265.0, // Height of the horizontal ListView
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                            child: ListView.builder(
                              scrollDirection: Axis
                                  .vertical, // Set the scroll direction to vertical

                              itemCount: dataRecents
                                  .length, // Replace with the number of items you need
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    // border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey, // Warna bayangan
                                        blurRadius: 1, // Jarak bayangan
                                        offset: Offset(0,
                                            1), // Geser bayangan horizontal dan vertikal
                                      ),
                                    ],
                                  ),
                                  width: 120.0,
                                  height: 72.0,
                                  margin: const EdgeInsets.all(4),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/${dataRecents[index].imageName}.png",
                                          width: 40,
                                          height: 40,
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    " ${dataRecents[index].userName}",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: const Color(
                                                            0xff35203F)),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 2,
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons
                                                        .calendar_month_rounded,
                                                    size: 11,
                                                  ),
                                                  const SizedBox(
                                                    width: 2,
                                                  ),
                                                  Text(
                                                    dataRecents[index].dateName,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor: Colors.white,
                                                backgroundColor: dataRecents[
                                                        index]
                                                    .buttonColor, // Warna teks
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                minimumSize: const Size(82, 22),
                                              ),
                                              onPressed: () {},
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                      "assets/icons/${dataRecents[index].iconName}.png"),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(dataRecents[index]
                                                      .descIcon),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              dataRecents[index].value,
                                              style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Leaderboards",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(53, 32, 63, 1),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.purple.shade50,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 16,
                                  color: Colors.purple,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                            child: ListView.builder(
                              scrollDirection: Axis
                                  .vertical, // Set the scroll direction to vertical

                              itemCount: dataLeaderboards
                                  .length, // Replace with the number of items you need
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  // decoration: BoxDecoration(
                                  //   color: Colors.white,
                                  //   // border: Border.all(color: Colors.black),
                                  //   // borderRadius: BorderRadius.circular(8),
                                  //   boxShadow: const [
                                  //     BoxShadow(
                                  //       color: Colors.grey, // Warna bayangan
                                  //       blurRadius: 1, // Jarak bayangan
                                  //       offset: Offset(0,
                                  //           1), // Geser bayangan horizontal dan vertikal
                                  //     ),
                                  //   ],
                                  // ),
                                  width: 120.0,
                                  height: 72.0,
                                  margin: const EdgeInsets.all(4),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 12,
                                              child: Text(
                                                "${index + 1}",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color(
                                                        0xffC440A6)),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 16,
                                            ),
                                            Image.asset(
                                              "assets/images/${dataLeaderboards[index].imageName}.png",
                                              width: 40,
                                              height: 40,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        dataLeaderboards[index]
                                                            .userName,
                                                        style: GoogleFonts.poppins(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: const Color(
                                                                0xff35203F)),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 2,
                                                  ),
                                                  Text(
                                                    dataLeaderboards[index]
                                                        .dateName,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  dataLeaderboards[index].value,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        const Color(0xffC440A6),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  "Deals",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Divider(
                                          color: Colors.grey,
                                          height: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
