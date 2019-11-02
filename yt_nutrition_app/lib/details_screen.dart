import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String heroTag;
  final String foodName;
  final String foodPrice;

  DetailsScreen(
      {@required this.heroTag,
      @required this.foodName,
      @required this.foodPrice});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String selectedCard = 'WEIGHT';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7FA2FB),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Details',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            color: Colors.white,
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 80,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 75.0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(45),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 30,
                left: (MediaQuery.of(context).size.width / 2) - 100,
                child: Hero(
                  tag: widget.heroTag,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(widget.heroTag),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 250.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.foodName,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          widget.foodPrice,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20.0,
                              color: Colors.grey),
                        ),
                        Container(
                          height: 25,
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        Container(
                          height: 40,
                          width: 125,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: Color(0xFF7FA2FB),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Color(0xFF7FA2FB),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                onTap: () {},
                              ),
                              Text(
                                '2',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontSize: 15.0,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 25.0,
                                  width: 25.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Color(0xFF7FA2FB),
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 50),
                    Container(
                      height: 150.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          buildInfoCard(
                              cardTitle: 'WEIGHT', info: '300', unit: 'G'),
                          SizedBox(width: 10),
                          buildInfoCard(
                              cardTitle: 'CALORIES', info: '267', unit: 'CAL'),
                          SizedBox(width: 10),
                          buildInfoCard(
                              cardTitle: 'VITAMINS',
                              info: 'A, B6',
                              unit: 'VIT'),
                          SizedBox(width: 10),
                          buildInfoCard(
                              cardTitle: 'AVAIL', info: 'NO', unit: 'AV'),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 75,
                      child: Center(
                        child: Text(
                          '\$ 52.0',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF160B24),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildInfoCard(
      {@required String cardTitle,
      @required String info,
      @required String unit}) {
    return InkWell(
      onTap: () {
        selectCard(cardTitle);
      },
      child: AnimatedContainer(
        duration: Duration(microseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: cardTitle == selectedCard ? Color(0xFF7FA2FB) : Colors.white,
          border: Border.all(
            style: BorderStyle.solid,
            width: 0.75,
            color: cardTitle == selectedCard
                ? Colors.transparent
                : Colors.grey.withOpacity(0.3),
          ),
        ),
        height: 100.0,
        width: 100.0,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                cardTitle,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  color: selectedCard == cardTitle
                      ? Colors.white
                      : Colors.grey.withOpacity(0.8),
                ),
              ),
              Spacer(),
              Text(
                info,
                style: TextStyle(
                  fontSize: 19,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color:
                      selectedCard == cardTitle ? Colors.white : Colors.black,
                ),
              ),
              Text(
                unit,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  color:
                      selectedCard == cardTitle ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}
