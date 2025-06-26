import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:getwidget/components/carousel/gf_items_carousel.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:smartcampus/common/widgets/padding.dart';
import '../../constants/lists.dart';

class SchoolEventsCarousel extends StatefulWidget {
  final double h;
  final double w;

  const SchoolEventsCarousel({Key? key, required this.h, required this.w})
    : super(key: key);

  @override
  _SchoolEventsCarouselState createState() => _SchoolEventsCarouselState();
}

class _SchoolEventsCarouselState extends State<SchoolEventsCarousel> {
  bool isMoreOn = false;

  @override
  Widget build(BuildContext context) {
    return GFItemsCarousel(
      rowCount: 1,
      itemHeight: isMoreOn ? widget.h * 0.47 : widget.h * 0.25,
      children: schoolEventsDetails.map((event) {
        log(event.toString());
        return Container(
          width: widget.w * 0.7,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blue.shade300, width: 1.5),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: schoolEventsDetails.isEmpty
              ? const Text('No Events!')
              : GFAccordion(
                  titleChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event['Event Name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      CommonPadding.topPadding4,
                      const Text('Start Date'),
                      CommonPadding.topPadding4,
                      Row(
                        children: [
                          const Icon(Icons.today),
                          Text('${event['Start Date']}'),
                          CommonPadding.leftPadding8,
                          Icon(MdiIcons.clock),
                          Text('${event['Start Time']}'),
                        ],
                      ),
                      CommonPadding.topPadding16,
                      const Text('End Date'),
                      CommonPadding.topPadding4,
                      Row(
                        children: [
                          const Icon(Icons.today),
                          Text('${event['End Date']}'),
                          CommonPadding.leftPadding8,
                          Icon(MdiIcons.clock),
                          Text('${event['End Time']}'),
                        ],
                      ),
                    ],
                  ),
                  contentChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonPadding.topPadding16,
                      const Text('Descriptions'),
                      CommonPadding.topPadding4,
                      Row(
                        children: [
                          const Icon(Icons.description),
                          Text('${event['Description']}'),
                          CommonPadding.leftPadding8,
                        ],
                      ),
                      CommonPadding.topPadding16,
                      const Text('Location/Venue'),
                      CommonPadding.topPadding4,
                      Row(
                        children: [
                          const Icon(Icons.location_on),
                          Text('${event['Location/Venue']}'),
                          CommonPadding.leftPadding8,
                        ],
                      ),
                      CommonPadding.topPadding16,
                      const Text('Audience'),
                      CommonPadding.topPadding4,
                      Row(
                        children: [
                          const Icon(Icons.people),
                          Text('${event['Audience']}'),
                          CommonPadding.leftPadding8,
                        ],
                      ),
                    ],
                  ),
                  collapsedIcon: const Text('More'),
                  expandedIcon: const Text('Less'),
                  onToggleCollapsed: (value) {
                    setState(() {
                      isMoreOn = value;
                    });
                  },
                ),
        );
      }).toList(),
    );
  }
}
