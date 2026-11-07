import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
import '../views/widgets/header_image_widget.dart';
import '../views/widgets/title_section_widget.dart';
import '../views/widgets/action_bar_widget.dart';
import '../views/widgets/booking_controls_widget.dart';
import '../views/widgets/description_widget.dart';

class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;
  const CruiseBookingScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sibu River Cruise & Heritage'),
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return ListView(
              children: _buildContentList(context),
            );
          } else {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: HeaderImageWidget(destination: viewModel.destination),
                ),
                Expanded(
                  flex: 1,
                  child: ListView(
                    children: _buildContentList(context, skipImage: true),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  List<Widget> _buildContentList(BuildContext context, {bool skipImage = false}) {
    List<Widget> widgets = [];

    if (!skipImage) {
      widgets.add(HeaderImageWidget(destination: viewModel.destination));
    }

    widgets.addAll([
      TitleSectionWidget(
        destination: viewModel.destination,
        starCount: viewModel.starCount,
        onStarClicked: () => viewModel.incrementStar(),
      ),
      const Divider(indent: 16, endIndent: 16),
      const ActionBarWidget(),
      const Divider(indent: 16, endIndent: 16),
      DescriptionWidget(description: viewModel.destination.description),
      BookingControlsWidget(viewModel: viewModel),
    ]);

    return widgets;
  }
}