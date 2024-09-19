import 'package:flutter/material.dart';
import 'package:teachers_marks/constants.dart';

class DateDetailView extends StatefulWidget {
  final DateTime date;
  const DateDetailView({super.key, required this.date});

  @override
  State<DateDetailView> createState() => _DateDetailViewState();
}

class _DateDetailViewState extends State<DateDetailView> {
  double h = 1;
  double w = 1;
  TextEditingController _searchController = TextEditingController();
  List<String> _contacts = [
    ' أحمد ',
    'إيهاب',
    'إبراهيم صالحاني عمران',
    'باسم',
    'بدر',
    'جمال',
    'جهاد',
    'داليا',
    'زينب',
    'عمر',
    'عمر',
    'عمر',
    'عمر',
    'عمر',
    'عمر',
    'فاطمة',
    'غسان',
    'كريم',
    'ليلى',
    'محمود',
    'محمود',
    'محمود',
    'محمود',
    'محمود',
    'محمود',
    'محمود',
    'محمود',
    'محمود',
    'نادية',
    'هالة',
    'يوسف',
  ];

  late List<String> _filteredContacts = [];
  late List<String> selectedIcons;

  @override
  void initState() {
    super.initState();
    _filteredContacts = _contacts;
    selectedIcons = List<String>.filled(
        _filteredContacts.length, ''); // Initialize with empty strings

    print('Contacts $_filteredContacts');
  }

  void _filterContacts(String query) {
    setState(() {
      _filteredContacts = _contacts
          .where(
              (contact) => contact.toLowerCase().contains(query.toLowerCase()))
          .toList();
      print('Filtered $_filteredContacts');
    });
  }

  void _scrollToLetter(String letter) {
    int index =
        _filteredContacts.indexWhere((contact) => contact.startsWith(letter));
    if (index != -1) {
      _scrollController
          .jumpTo(index * 60.0); // Assuming each item has a height of 60.0
    }
  }

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                stops: [0.1, 0.6],
                tileMode: TileMode.repeated,
                colors: [kButtonColorBlue1, kButtonColorBlue2],
              ),
            ),
          ),
          title: Text('الطلاب (${_contacts.length})'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'بحث',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: _filterContacts,
              ),
            ),
          ),
        ),
        body: Row(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _filteredContacts.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(_filteredContacts[index][0]),),
                        title: FittedBox(
                          fit:BoxFit.scaleDown,
                          child: Text(_filteredContacts[index]),
                        // alignment: Alignment.center,
                        ),
                        // trailing: ,
                        subtitle: Row(
                          // mainAxisSize: MainAxisSize/.,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              // constraints: BoxConstraints(),
                              // iconSize:20,
                              // padding: EdgeInsets.all(0),
                              icon: Icon(Icons.check_circle,
                                  color: selectedIcons[index] == 'حضور'
                                      ? Colors.green
                                      : Colors.grey),
                              onPressed: () {
                                setState(() {
                                  selectedIcons[index] = 'حضور';
                                });
                              },
                            ),
                            IconButton(
                              // constraints: BoxConstraints(),
                              // iconSize:20,
                              // padding: EdgeInsets.all(0),
                              icon: Icon(Icons.cancel,
                                  color: selectedIcons[index] == 'غياب'
                                      ? Colors.red
                                      : Colors.grey),
                              onPressed: () {
                                setState(() {
                                  selectedIcons[index] = 'غياب';
                                });
                              },
                            ),
                            IconButton(
                              // constraints: BoxConstraints(),
                              // iconSize:20,
                              // padding: EdgeInsets.all(0),
                              icon: Icon(Icons.info,
                                  color: selectedIcons[index] == 'غياب مبرر'
                                      ? Colors.blue
                                      : Colors.grey),
                              onPressed: () {
                                setState(() {
                                  selectedIcons[index] = 'غياب مبرر';
                                });
                              },
                            ),
                            IconButton(
                              // constraints: BoxConstraints(),
                              // iconSize:20,
                              // padding: EdgeInsets.all(0),
                              icon: Icon(Icons.access_time,
                                  color: selectedIcons[index] == 'متأخر'
                                      ? Colors.orange
                                      : Colors.grey),
                              onPressed: () {
                                setState(() {
                                  selectedIcons[index] = 'متأخر';
                                });
                              },
                            ),
                          ],),),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
            Container(
              width: w * 0.1,
              child: ListView(
                children:
                    'ابتثجحخدذرزسشصضطظعغفقكلمنهوي'.split('').map((letter) {
                  return GestureDetector(
                    onTap: () => _scrollToLetter(letter),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(letter, textAlign: TextAlign.center),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
