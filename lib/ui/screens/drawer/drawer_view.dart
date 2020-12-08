import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/screens/home/home_viewmodel.dart';
import 'package:svuce_app/ui/screens/placements/placements_view.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/widgets/drawer_item.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiHelpers = UIHelpers.fromContext(context);

    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.getCurrentUserDetails(),
      builder: (context, model, child) => Drawer(
        child: Container(
            color: backgroundColor,
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: <Widget>[
                ListTile(
                  onTap: () => model.viewUserProfile(),
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                  leading: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(uiHelpers.scalingHelper.size(80)),
                    child: model.currentUser?.profileImg != null
                        ? Image.network(model.currentUser.profileImg,
                            fit: BoxFit.cover, width: 50, height: 50)
                        : SizedBox(),
                  ),
                  title: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: model.currentUser.fullName ?? "Harry Potter",
                      style: uiHelpers.title.apply(color: textPrimaryColor),
                    ),
                    TextSpan(
                      text: "\n",
                    ),
                    TextSpan(
                      text: model.currentUser.rollNo ?? "Hogwarts",
                      style: uiHelpers.body.apply(color: primaryColor),
                    ),
                  ])),
                  trailing: IconButton(
                      icon: Icon(
                        backIcon,
                        color: textSecondaryColor,
                      ),
                      onPressed: () {}),
                ),
                Divider(
                  color: textSecondaryColor,
                ),
                DrawerItem(
                  title: "Faculty",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlacementView()));
                  },
                  iconData: facultyIcon,
                ),
                DrawerItem(
                  title: "Explore Clubs",
                  onTap: () {},
                  iconData: clubsIcon,
                ),
                DrawerItem(
                  title: "Timetable",
                  onTap: () => model.viewTimeTable(),
                  iconData: timeTableIcon,
                ),
                DrawerItem(
                  title: "Attendance",
                  onTap: () => model.viewAttendance(),
                  iconData: attendanceIcon,
                ),
                DrawerItem(
                  title: "Campus Map",
                  onTap: () {},
                  iconData: campusIcon,
                ),
                DrawerItem(
                  title: "About College",
                  onTap: () {},
                  iconData: schoolIcon,
                ),
                DrawerItem(
                  title: "About App",
                  onTap: () {},
                  iconData: infoIcon,
                ),
              ],
            )),
      ),
    );
  }
}
