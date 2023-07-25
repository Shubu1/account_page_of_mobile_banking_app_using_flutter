import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({final Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(77, 206, 204, 204),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 35,
            child: Container(
              width: 394,
              height: 90,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(17, 46, 128, 0.813),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 18.0, right: 8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.sunny_snowing),
                        color: Colors.white,
                        iconSize: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0, right: 80),
                        child: Column(
                          children: [
                            Text(
                              "Good Morning,",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text("Hari Bahadur",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    overflow: TextOverflow.fade)),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.redeem),
                        color: Colors.white,
                        iconSize: 28,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_none),
                        color: Colors.white,
                        iconSize: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: CircularProfileAvatar(
                          'https://avatars0.githubusercontent.com/u/8264639?s=460&v=4',
                          radius: 18, // sets radius, default 50.0
                          backgroundColor: Colors
                              .transparent, // sets background color, default Colors.white
                          borderWidth: 1, // sets border, default 0.0
                          borderColor: Colors
                              .white, // sets border color, default Colors.white
                          elevation:
                              5.0, // sets elevation (shadow of the profile picture), default value is 0.0
                          foregroundColor: Colors.brown.withOpacity(
                              0.5), //sets foreground colour, it works if showInitialTextAbovePicture = true , default Colors.transparent
                          cacheImage:
                              true, // allow widget to cache image against provided url
                          imageFit: BoxFit.cover,
                          initialsText: const Text("HB"),
                          onTap: () {},
                          showInitialTextAbovePicture: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top:
                90, // Adjust the top value to create a gap of 8 between the two cards
            child: Column(
              children: [
                Container(
                  height: 80,
                  width: 370,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Card(
                        surfaceTintColor: Colors.white,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        shadowColor: Colors.white,
                        elevation: 4.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.search),
                                    color: Colors.blue,
                                  ),
                                  const FittedBox(
                                    child: SizedBox(
                                      width: 280,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Search',
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.mic),
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(8), // Gap of 8 between the two cards
                Container(
                  height: 120,
                  width: 350,
                  child: const Card(
                    elevation: 4.0,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(10),
                        Row(
                          children: [
                            Gap(10),
                            Icon(
                              Icons.save,
                              color: Colors.grey,
                            ),
                            Gap(4),
                            Text(
                              'Saving Account',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                        Gap(4),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            "1091212221233234",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0),
                          ),
                        ),
                        Gap(10),
                        Row(
                          children: [
                            Gap(10),
                            Text(
                              'NPR.',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                            Gap(1),
                            Text(
                              '1,09,124.56',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 21.0),
                            ),
                            Gap(8),
                            Icon(
                              Icons.remove_red_eye,
                              color: Colors.blue,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const Gap(10),
                SizedBox(
                  height: 100,
                  width: 350,
                  child: GridView(
                    // physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                    ),
                    children: [
                      Container(
                        height: 90,
                        width: 70,
                        child: const Card(
                          elevation: 4,
                          child: Column(
                            children: [
                              Gap(20),
                              Icon(
                                Icons.people_alt_outlined,
                                color: Colors.blue,
                              ),
                              Gap(12),
                              Text(
                                'Accounts',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 90,
                        child: const Card(
                          elevation: 4,
                          child: Column(
                            children: [
                              Gap(20),
                              Icon(
                                Icons.note_sharp,
                                color: Colors.blue,
                              ),
                              Gap(12),
                              Text(
                                'Statement',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 70,
                        child: const Card(
                          elevation: 4,
                          child: Column(
                            children: [
                              Gap(20),
                              Icon(
                                Icons.mobile_friendly_outlined,
                                color: Colors.blue,
                              ),
                              Gap(12),
                              Text(
                                'Topup',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        child: const Card(
                          elevation: 4,
                          child: Column(
                            children: [
                              Gap(20),
                              Icon(
                                Icons.account_balance_wallet_sharp,
                                color: Colors.blue,
                              ),
                              Gap(12),
                              Text(
                                'Load Wallet',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(17),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent Transactions',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Gap(60),
                    Text(
                      'View All',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Gap(12),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
                const Gap(2),
                SizedBox(
                  height: 100,
                  width: 360,
                  child: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 100,
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.blue, width: 1.0),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: const Row(
                            children: [
                              Gap(40),
                              Text(
                                'All',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 120,
                        child: const Card(
                          elevation: 4,
                          child: Row(
                            children: [
                              Gap(8),
                              Icon(
                                Icons.arrow_circle_up_rounded,
                                color: Colors.green,
                              ),
                              Gap(7),
                              Text(
                                'Income',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 70,
                          width: 130,
                          child: const Card(
                            elevation: 4,
                            child: Row(
                              children: [
                                Gap(6),
                                Icon(
                                  Icons.arrow_circle_down_rounded,
                                  color: Colors.red,
                                ),
                                Gap(7),
                                Expanded(
                                  child: Text(
                                    'Expenses',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 180,
                  width: 350,
                  child: const SingleChildScrollView(
                    child: Card(
                      elevation: 4.0,
                      child: Column(
                        children: [
                          Gap(10),
                          Row(
                            children: [
                              Gap(10),
                              Text(
                                'Salary for Jan 2021',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                              Gap(40),
                              Text(
                                'NPR.',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Gap(3),
                              Text(
                                '25,121.12',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                  child: Icon(
                                Icons.more_horiz_outlined,
                                color: Colors.grey,
                              ))
                            ],
                          ),
                          Row(
                            children: [
                              Gap(10),
                              Text(
                                'Jan 01, 2020 at 10:00 AM',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                              Gap(10),
                              Text(
                                'Balance.NPR.',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Gap(3),
                              Expanded(
                                child: Text(
                                  '1,896',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Gap(10),
                          Row(
                            children: [
                              Gap(10),
                              Text(
                                'Payment for Nt Prepaid Topup',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                              Gap(17),
                              Text(
                                'NPR.',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              Gap(3),
                              Text(
                                '500.0',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                  child: Icon(
                                Icons.more_horiz_outlined,
                                color: Colors.grey,
                              ))
                            ],
                          ),
                          Row(
                            children: [
                              Gap(10),
                              Text(
                                'Jan 01, 2020 at 10:00 AM',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                              Gap(10),
                              Text(
                                'Balance.NPR.',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Gap(3),
                              Expanded(
                                child: Text(
                                  '1,896',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Gap(10),
                          Row(
                            children: [
                              Gap(10),
                              Text(
                                'Transfer from Madan',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                              Gap(30),
                              Text(
                                'NPR.',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Gap(3),
                              Text(
                                '10,00,000',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: Icon(
                                  Icons.more_horiz_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Gap(10),
                              Text(
                                'Jan 01, 2020 at 10:00 AM',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                              Gap(10),
                              Text(
                                'Balance.NPR.',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Gap(3),
                              Expanded(
                                child: Text(
                                  '1,896',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Gap(10),
                          Row(
                            children: [
                              Gap(10),
                              Text(
                                'Paid for Groceries',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                              Gap(80),
                              Text(
                                'NPR.',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              Gap(3),
                              Text(
                                '1,278.5',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                  child: Icon(
                                Icons.more_horiz_outlined,
                                color: Colors.grey,
                              ))
                            ],
                          ),
                          Row(
                            children: [
                              Gap(10),
                              Text(
                                'Jan 01, 2020 at 10:00 AM',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                              Gap(10),
                              Text(
                                'Balance.NPR.',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Gap(3),
                              Expanded(
                                child: Text(
                                  '1,896',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Row(
                            children: [
                              Gap(10),
                              Text(
                                'Load to Esewa',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                              Gap(120),
                              Text(
                                'NPR.',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              Gap(3),
                              Text(
                                '250.0',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                  child: Icon(
                                Icons.more_horiz_outlined,
                                color: Colors.grey,
                              ))
                            ],
                          ),
                          Row(
                            children: [
                              Gap(10),
                              Text(
                                'Jan 01, 2020 at 10:00 AM',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                              Gap(10),
                              Text(
                                'Balance.NPR.',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Gap(3),
                              Expanded(
                                child: Text(
                                  '1,200',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
