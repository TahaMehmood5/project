import 'package:discipline_committee/Global/NotificationModel/Notification_Model.dart';
import 'package:discipline_committee/Global/constant.dart';
import 'package:flutter/material.dart';

class Notification_Screen extends StatefulWidget {
  const Notification_Screen({Key? key}) : super(key: key);

  @override
  State<Notification_Screen> createState() => _Notification_ScreenState();
}

class _Notification_ScreenState extends State<Notification_Screen> {
  bool? alrt;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Notifications",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: txtColor,
                fontSize: 25,
              ),
            ),
          ),
          // body: RefreshConfiguration(
          //   footerTriggerDistance: 15,
          //   dragSpeedRatio: 0.91,
          //   headerBuilder: () => const MaterialClassicHeader(),
          //   footerBuilder: () => const ClassicFooter(),
          //   enableLoadingWhenNoData: false,
          //   enableRefreshVibrate: false,
          //   enableLoadMoreVibrate: false,
          //   shouldFooterFollowWhenNotFull: (state) {
          //     // If you want load more with noMoreData state ,may be you should return false
          //     return false;
          //   },
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: notifitems.length,
              itemBuilder: (context, index) {
                return Card(
                  color: notifitems[index].alert! ? bkColor : null,
                  //                           <-- Card widget
                  child: ListTile(
                    leading: notifitems[index].alert!
                        ? Icon(
                            Icons.warning,
                            color: btnColor,
                            size: 35,
                          )
                        : Icon(
                            Icons.campaign_rounded,
                            color: btnColor,
                            size: 35,
                          ),
                    title: Text(
                      "${notifitems[index].title}",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: notifitems[index].alert! ? btnColor : txtColor,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Text(
                      "${notifitems[index].datetime!.day}-${notifitems[index].datetime!.month}-${notifitems[index].datetime!.year}",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: txtColor,
                        fontSize: 12,
                      ),
                    ),
                    trailing: notifitems[index].alert!
                        ? TextButton(
                            onPressed: () {},
                            child: Text(
                              "Take Action",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: notifitems[index].alert!
                                    ? btnColor
                                    : txtColor,
                                fontSize: 13,
                              ),
                            ),
                          )
                        : TextButton(
                            onPressed: () {},
                            child: Text(
                              "View Detail",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: notifitems[index].alert!
                                    ? btnColor
                                    : txtColor,
                                fontSize: 10,
                              ),
                            ),
                          ),
                  ),
                );
              },
            ),
          ),
          // ),
        ),
      ),
    );
  }
}
