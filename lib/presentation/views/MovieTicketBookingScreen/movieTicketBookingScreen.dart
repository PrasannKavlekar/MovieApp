import 'package:flutter/material.dart';
import 'package:tentwenty_movie_app/config/color_constants.dart';
import 'package:tentwenty_movie_app/domain/models/generic/movieDetailsModel.dart';
import 'package:tentwenty_movie_app/utils/dateutils/dateUtils.dart';

class MovieTicketBookingScreen extends StatefulWidget {
  final MovieDetailsModel data;
  const MovieTicketBookingScreen({super.key, required this.data});

  @override
  State<MovieTicketBookingScreen> createState() =>
      _MovieTicketBookingScreenState();
}

class _MovieTicketBookingScreenState extends State<MovieTicketBookingScreen> {
  @override
  void initState() {
    super.initState();
  }

  int selectedIndex = 0;
  DateTime selectedDate = DateTime.now();

  // List<Widget> generateDateChips(BuildContext context) {
  //   return List<Widget>.generate(
  //     10,
  //     (int idx) {
  //       return Chip(
  //           label: Text(options[idx]),
  //          );
  //     },
  //   ).toList();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 80,
        flexibleSpace: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.data.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'In Theaters ${MovieDateUtils.formatReleaseDate(widget.data.releaseDate)}',
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.ttLightBlue,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: AppColors.ttOffWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Date',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  // Calculate the next day's date
                  DateTime nextDay = DateTime.now().add(Duration(days: index));

                  // Format the date using intl package
                  String formattedDate =
                      MovieDateUtils.formatBasicDate(nextDay);

                  // Create a chip for each day
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ChoiceChip(
                      label: Text(formattedDate),
                      // backgroundColor: AppColors.ttOffWhite,
                      labelStyle: selectedIndex == index
                          ? const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )
                          : const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      selectedColor: AppColors.ttLightBlue,
                      selected: selectedIndex == index,
                      onSelected: (bool selected) {
                        setState(() {
                          selectedIndex = selected ? index : -1;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  DateTime timeRightNow = DateTime.now();

                  timeRightNow.add(
                    Duration(hours: index + 2),
                  );

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(MovieDateUtils.formatBasicTime(timeRightNow)),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: AppColors.ttLightBlue,
                              ),
                            ),
                            width: MediaQuery.of(context).size.width / 2,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width - 50, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Select Seats'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
