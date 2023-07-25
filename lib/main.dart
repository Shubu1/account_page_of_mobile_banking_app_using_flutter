import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:task_dashboard/newpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: 160,
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: InkWell(
                child: const Icon(Icons.keyboard_backspace),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BankingDashboard()));
                },
              ),
              toolbarHeight: 80,
              title: const Text('My Limits'),
              centerTitle: true,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  //color: Color.fromRGBO(15, 60, 183, 0.938),
                  color: Color.fromRGBO(17, 46, 128, 0.813),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Card(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 246, 251, 253),
                        borderRadius: BorderRadius.circular(6.0),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        indicator: BoxDecoration(
                          //color: const Color.fromARGB(250, 88, 187, 240),
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        labelColor: Colors.blueAccent,
                        unselectedLabelColor:
                            const Color.fromARGB(255, 80, 113, 129),
                        tabs: const [
                          Tab(
                            text: 'Mobile Banking',
                          ),
                          Tab(
                            text: 'Internet Banking',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      elevation: 0,
                      clipBehavior: Clip.antiAlias,
                      child: TabBarView(
                        controller: _tabController,
                        children: const [
                          MobileBankingTab(),
                          InternetBankingTab(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MobileBankingTab extends StatelessWidget {
  const MobileBankingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listNames = [
      "Payments",
      "Fund Transfer",
      "Send Money(Same Bank)",
      "FonePay(Inter Bank)",
      "IPS Transfer",
      "NPS Transfer",
      "Load Wallet",
      "Schedule Payments"
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 130.0),
              child: Text(
                "Mobile Banking Limits",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(left: 25.0, top: 30.0),
                child: Stack(
                  children: [
                    CircularSeekBar(
                      width: double.infinity,
                      height: 110,
                      progress: 80,
                      barWidth: 8,
                      startAngle: 89,
                      sweepAngle: 180,
                      strokeCap: StrokeCap.round,
                      progressColor: Colors.green,
                      trackColor: Colors.blueGrey,
                    ),
                    Positioned(
                      top: 40, // Adjust the position of the label as needed
                      left: 0,
                      right: 0,
                      child: Text(
                        '150/200',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40.0, top: 70.0),
                      child: Text(
                        "Total Transactions left today",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ),
                  ],
                )),
            const Padding(
              padding: EdgeInsets.only(
                  top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
              child: Row(
                children: [
                  Text(
                    "Today",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0),
                  ),
                  Spacer(),
                  Text(
                    "Rs. 50,000 / 1,00,000",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0),
                  ),
                ],
              ),
            ),
            LinearPercentIndicator(
              barRadius: const Radius.circular(6.0),
              lineHeight: 10,
              percent: 0.6,
              progressColor: Colors.green,
              backgroundColor: Colors.grey[40],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 2.0, left: 10.0, right: 10.0),
              child: Row(
                children: [
                  Text(
                    "Transferrable Amount",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0),
                  ),
                  Spacer(),
                  Text(
                    "Rs. 50,000",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  top: 30.0, left: 10.0, right: 10.0, bottom: 10.0),
              child: Row(
                children: [
                  Text(
                    "This Month",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0),
                  ),
                  Spacer(),
                  Text(
                    "Rs. 50,000 / 1,00,000",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0),
                  ),
                ],
              ),
            ),
            LinearPercentIndicator(
              barRadius: const Radius.circular(6.0),
              lineHeight: 10,
              percent: 0.1,
              progressColor: Colors.green,
              backgroundColor: Colors.grey[40],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 2.0, left: 10.0, right: 10.0),
              child: Row(
                children: [
                  Text(
                    "Transferrable Amount",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0),
                  ),
                  Spacer(),
                  Text(
                    "Rs. 9,50,000",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
                height: 1,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Row(
                children: [
                  Text(
                    "Max. Per Transaction",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 4.0, left: 10.0, right: 10.0),
              child: Row(
                children: [
                  Text(
                    "Rs. 50,000",
                    style: TextStyle(
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                        fontSize: 19.0),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
                height: 1,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12.0, right: 10.0, left: 10.0),
              child: Row(
                children: [
                  Text(
                    "Transaction Types",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 500,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: listNames.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          enableDrag: false,
                          context: context,
                          backgroundColor: Colors.white,
                          builder: (context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 15.0,
                                    left: 15.0,
                                    right: 15.0,
                                  ),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Fund Transfer Limits",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19.0),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          icon: const Icon(Icons.close)),
                                    ],
                                  ),
                                ),
                                const Padding(
                                    padding:
                                        EdgeInsets.only(left: 25.0, top: 10.0),
                                    child: Stack(
                                      children: [
                                        CircularSeekBar(
                                          width: double.infinity,
                                          height: 110,
                                          progress: 6,
                                          barWidth: 8,
                                          startAngle: 89,
                                          sweepAngle: 180,
                                          strokeCap: StrokeCap.round,
                                          progressColor: Colors.red,
                                          trackColor: Color.fromARGB(
                                              254, 222, 218, 218),
                                        ),
                                        Positioned(
                                          top:
                                              40, // Adjust the position of the label as needed
                                          left: 0,
                                          right: 0,
                                          child: Text(
                                            '1/10',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 90.0, top: 70.0),
                                          child: Text(
                                            "Transactions left today",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                          ),
                                        ),
                                      ],
                                    )),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.0,
                                      left: 15.0,
                                      right: 15.0,
                                      bottom: 10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Today",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19.0),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Rs. 35,000 / 50,000",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 19.0),
                                      ),
                                    ],
                                  ),
                                ),
                                LinearPercentIndicator(
                                  barRadius: const Radius.circular(6.0),
                                  lineHeight: 10,
                                  percent: 0.8,
                                  progressColor: Colors.redAccent,
                                  backgroundColor: Colors.grey[40],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.0,
                                      left: 15.0,
                                      right: 15.0,
                                      bottom: 10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Transferrable Amount",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19.0),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Rs. 15,000",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 19.0),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.0,
                                      left: 15.0,
                                      right: 15.0,
                                      bottom: 10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "This Month",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19.0),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Rs. 35,000/1,00,000",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 19.0),
                                      ),
                                    ],
                                  ),
                                ),
                                LinearPercentIndicator(
                                  barRadius: const Radius.circular(6.0),
                                  lineHeight: 10,
                                  percent: 0.1,
                                  progressColor: Colors.green,
                                  backgroundColor: Colors.grey[40],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.0,
                                      left: 15.0,
                                      right: 15.0,
                                      bottom: 10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Transferrable Amount",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19.0),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Rs. 65,000",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 19.0),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 15.0, right: 15.0, left: 15.0),
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                    height: 1,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      right: 190.0,
                                      bottom: 10.0,
                                      left: 18.0,
                                      top: 10.0),
                                  child: Text(
                                    "Max. Per Transaction",
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19.0),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    right: 10.0,
                                    bottom: 10.0,
                                    left: 19.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Rs. 1,00,000",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 19.0),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 15.0, right: 15.0, left: 15.0),
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                    height: 1,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      right: 220.0,
                                      bottom: 10.0,
                                      left: 18.0,
                                      top: 10.0),
                                  child: Text(
                                    "Transaction Fees",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19.0),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.0,
                                      left: 15.0,
                                      right: 15.0,
                                      bottom: 10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "1. Rs. 0 - 1,00,000",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 19.0),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Rs. 10",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 19.0),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.0,
                                      left: 15.0,
                                      right: 15.0,
                                      bottom: 10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "2. Rs. 1,00,000- 10,00,000",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 19.0),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Rs. 10",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 19.0),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.0,
                                      left: 15.0,
                                      right: 15.0,
                                      bottom: 10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "3. Rs. 10,00,000- 100,00,000",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 19.0),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Rs. 100",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 19.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: ListTile(
                            title: Text(
                              listNames[index],
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Divider(
                      height: 1,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InternetBankingTab extends StatelessWidget {
  const InternetBankingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listNames = [
      "Payments",
      "Fund Transfer",
      "Send Money(Same Bank)",
      "FonePay(Inter Bank)",
      "IPS Transfer",
      "NPS Transfer",
      "Load Wallet",
      "Schedule Payments"
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 130.0),
              child: Text(
                "Internet Banking Limits",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(left: 25.0, top: 30.0),
                child: Stack(
                  children: [
                    CircularSeekBar(
                      width: double.infinity,
                      height: 110,
                      progress: 70,
                      barWidth: 8,
                      startAngle: 89,
                      sweepAngle: 180,
                      strokeCap: StrokeCap.round,
                      progressColor: Colors.green,
                      trackColor: Colors.blueGrey,
                    ),
                    Positioned(
                      top: 40, // Adjust the position of the label as needed
                      left: 0,
                      right: 0,
                      child: Text(
                        '120/200',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40.0, top: 70.0),
                      child: Text(
                        "Total Transactions left today",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ),
                  ],
                )),
            const Padding(
              padding: EdgeInsets.only(
                  top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
              child: Row(
                children: [
                  Text(
                    "Today",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0),
                  ),
                  Spacer(),
                  Text(
                    "Rs. 40,000 / 1,00,000",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0),
                  ),
                ],
              ),
            ),
            LinearPercentIndicator(
              barRadius: const Radius.circular(6.0),
              lineHeight: 10,
              percent: 0.5,
              progressColor: Colors.green,
              backgroundColor: Colors.grey[40],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 2.0, left: 10.0, right: 10.0),
              child: Row(
                children: [
                  Text(
                    "Transferrable Amount",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0),
                  ),
                  Spacer(),
                  Text(
                    "Rs. 60,000",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  top: 30.0, left: 10.0, right: 10.0, bottom: 10.0),
              child: Row(
                children: [
                  Text(
                    "This Month",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0),
                  ),
                  Spacer(),
                  Text(
                    "Rs. 40,000 / 1,00,000",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0),
                  ),
                ],
              ),
            ),
            LinearPercentIndicator(
              barRadius: const Radius.circular(6.0),
              lineHeight: 10,
              percent: 0.1,
              progressColor: Colors.green,
              backgroundColor: Colors.grey[40],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 2.0, left: 10.0, right: 10.0),
              child: Row(
                children: [
                  Text(
                    "Transferrable Amount",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0),
                  ),
                  Spacer(),
                  Text(
                    "Rs. 9,50,000",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
                height: 1,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Row(
                children: [
                  Text(
                    "Max. Per Transaction",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 4.0, left: 10.0, right: 10.0),
              child: Row(
                children: [
                  Text(
                    "Rs. 50,000",
                    style: TextStyle(
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                        fontSize: 19.0),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
                height: 1,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12.0, right: 10.0, left: 10.0),
              child: Row(
                children: [
                  Text(
                    "Transaction Types",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 500,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: listNames.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          enableDrag: false,
                          context: context,
                          backgroundColor: Colors.white,
                          builder: (context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 15.0,
                                    left: 15.0,
                                    right: 15.0,
                                  ),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Fund Transfer Limits",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19.0),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          icon: const Icon(Icons.close)),
                                    ],
                                  ),
                                ),
                                const Padding(
                                    padding:
                                        EdgeInsets.only(left: 25.0, top: 10.0),
                                    child: Stack(
                                      children: [
                                        CircularSeekBar(
                                          width: double.infinity,
                                          height: 110,
                                          progress: 6,
                                          barWidth: 8,
                                          startAngle: 89,
                                          sweepAngle: 180,
                                          strokeCap: StrokeCap.round,
                                          progressColor: Colors.orange,
                                          trackColor: Color.fromARGB(
                                              254, 222, 218, 218),
                                        ),
                                        Positioned(
                                          top:
                                              40, // Adjust the position of the label as needed
                                          left: 0,
                                          right: 0,
                                          child: Text(
                                            '1/10',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 90.0, top: 70.0),
                                          child: Text(
                                            "Transactions left today",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                          ),
                                        ),
                                      ],
                                    )),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.0,
                                      left: 15.0,
                                      right: 15.0,
                                      bottom: 10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Today",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19.0),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Rs. 35,000 / 50,000",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 19.0),
                                      ),
                                    ],
                                  ),
                                ),
                                LinearPercentIndicator(
                                  barRadius: const Radius.circular(6.0),
                                  lineHeight: 10,
                                  percent: 0.8,
                                  progressColor: Colors.redAccent,
                                  backgroundColor: Colors.grey[40],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.0,
                                      left: 15.0,
                                      right: 15.0,
                                      bottom: 10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Transferrable Amount",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19.0),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Rs. 15,000",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 19.0),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.0,
                                      left: 15.0,
                                      right: 15.0,
                                      bottom: 10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "This Month",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19.0),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Rs. 35,000/1,00,000",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 19.0),
                                      ),
                                    ],
                                  ),
                                ),
                                LinearPercentIndicator(
                                  barRadius: const Radius.circular(6.0),
                                  lineHeight: 10,
                                  percent: 0.1,
                                  progressColor: Colors.green,
                                  backgroundColor: Colors.grey[40],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.0,
                                      left: 15.0,
                                      right: 15.0,
                                      bottom: 10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Transferrable Amount",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19.0),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Rs. 65,000",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 19.0),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 15.0, right: 15.0, left: 15.0),
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                    height: 1,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      right: 190.0,
                                      bottom: 10.0,
                                      left: 18.0,
                                      top: 10.0),
                                  child: Text(
                                    "Max. Per Transaction",
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19.0),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    right: 10.0,
                                    bottom: 10.0,
                                    left: 19.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Rs. 1,00,000",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 19.0),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 15.0, right: 15.0, left: 15.0),
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                    height: 1,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      right: 220.0,
                                      bottom: 10.0,
                                      left: 18.0,
                                      top: 10.0),
                                  child: Text(
                                    "Transaction Fees",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19.0),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.0,
                                      left: 15.0,
                                      right: 15.0,
                                      bottom: 10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "1. Rs. 0 - 1,00,000",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 19.0),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Rs. 10",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 19.0),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.0,
                                      left: 15.0,
                                      right: 15.0,
                                      bottom: 10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "2. Rs. 1,00,000- 10,00,000",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 19.0),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Rs. 10",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 19.0),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.0,
                                      left: 15.0,
                                      right: 15.0,
                                      bottom: 10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "3. Rs. 10,00,000- 100,00,000",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 19.0),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Rs. 100",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 19.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: ListTile(
                            title: Text(
                              listNames[index],
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Divider(
                      height: 1,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
