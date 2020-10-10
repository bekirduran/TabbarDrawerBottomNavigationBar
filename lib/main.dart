
import 'package:flutter/material.dart';
import 'Model/data_model.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primaryColor: null,
      ),
      home: MyHomePage(),
    );
  }


}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {

  TabController tabController;
  final GlobalKey<ScaffoldState> myKey = new GlobalKey<ScaffoldState>();
  String selection;
  int selectedItem;

  @override
  void initState() {
    tabController = TabController(
      length: buildTabs().length,
      vsync: this,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    selection = DataModel.selection;

    return Scaffold(
      key: myKey,
      appBar: AppBar(
          leading: InkWell(
            onTap: ()=>myKey.currentState.openDrawer(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(backgroundImage: AssetImage("assets/images/foto.jpg"),),
            ),
          ),
          title: buildTextField(),
          titleSpacing: 35,
          bottom: buildTabBar(),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blueGrey.shade200, Colors.blueGrey.shade900]
              )
          ),
        ),
      ),

      drawer: Drawer(
        child: Column(
          children: [
            topStaticSection(),
            bottomDynamicSection(),
          ],
        ),
      ),
      body: buildBody(),//buildTabBarBodyView(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildTextField() {
    return Container(
      height: 32,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: Colors.blueGrey.shade700),
      child: TextField(
        style: TextStyle(fontSize: 15,color: Colors.white),
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search,color: Colors.white,),
          hintText: "Search ...",
          hintStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  TabBar buildTabBar() {
    return TabBar(

      indicatorColor: Colors.transparent,
      onTap: (index){
        setState(() {
          listProducts(index);
        });
      },
      tabs: buildTabs(),
      controller: tabController,
      isScrollable: true,
    );
  }

  List<Widget> buildTabs() {
    return [
      Tab(
        text: "Electronics",
        icon: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.phone_iphone,
            color: Colors.blueAccent.shade400,
          ),
        ),
      ),
      Tab(
        text: "Vehicle",
        icon: CircleAvatar(
          child: Icon(Icons.directions_car),
        ),
      ),
      Tab(
        text: "Furniture",
        icon: CircleAvatar(
          backgroundColor: Colors.green.shade400,
          child: Icon(Icons.event_seat, color: Colors.limeAccent),
        ),
      ),
      Tab(
        text: "Services",
        icon: CircleAvatar(
          backgroundColor: Colors.deepPurple[200],
          child: Icon(Icons.handyman_rounded, color: Colors.black87),
        ),
      ),
      Tab(
        text: "Books",
        icon: CircleAvatar(
          backgroundColor: Colors.teal.shade100,
          child: Icon(Icons.menu_book, color: Colors.green.shade900),
        ),
      ),
      Tab(
        text: "Estate",
        icon: CircleAvatar(
          backgroundColor: Colors.orange.shade50,
          child: Icon(
            Icons.home_work_outlined,
            color: Colors.red.shade900,
          ),
        ),
      ),
      Tab(
        text: "Others",
        icon: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.shopping_cart,
            color: Colors.blueGrey,
          ),
        ),
      ),
    ];
  }

  Widget buildTabBarBodyView() {
   return TabBarView(
      controller: tabController,
      children:  [
      Container(
        color: Colors.yellow[100],
        child: Center(
            child: Text(DataModel.selection==null?
          "Electronics":DataModel.selection,
          style: TextStyle(fontSize: 50),
        )),
      ),
      Container(
        color: Colors.blue.shade50,
        child: Center(
          child: Text(
            "Vehicle",
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
      Container(
        color: Colors.green.shade100,
        child: Center(
          child: Text(
            "Furniture",
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
      Container(
        color: Colors.deepPurple[50],
        child: Center(
          child: Text(
            "Services",
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
      Container(
        color: Colors.teal.shade100,
        child: Center(
          child: Text(
            "Books",
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
      Container(
        color: Colors.orange.shade50,
        child: Center(
          child: Text(
            "Estate",
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
      Container(
        color: Colors.blueGrey.shade50,
        child: Center(
          child: Text(
            "Others",
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    ]
   );
  }

 Widget buildBody(){
    return Container(
      color: Colors.blueGrey[100],
      child: Center(
          child: Text(selection==null?
          "Hello World":selection,
            style: TextStyle(fontSize: 50),
          )),
    );

}

  Widget topStaticSection() {

  return SingleChildScrollView(
    child: Container(
     width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blueGrey.shade200, Colors.blueGrey.shade900]
          )
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 50, 5, 5),
        child: Column(children: [
          CircleAvatar(backgroundImage: AssetImage("assets/images/foto.jpg"),minRadius: 10, maxRadius: 40,),
          Text("Bekir DURAN",style: TextStyle(color: Colors.white),),
          Text("bekirduran2@gmail.com",style: TextStyle(color: Colors.white),),
        ],),
      ),
    ),
  );


  }

  Widget bottomDynamicSection() {
    return Expanded(

        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blueGrey.shade900, Colors.blueGrey.shade200]
              )
          ),
          child: ListView(
            children: [
              InkWell(
                child: ListTile(
                  leading: Icon(Icons.home_filled),
                  title: Text("Home"),
                  trailing: Icon(Icons.arrow_right_rounded),
                ),
                onTap: () {
                  setState(() {
                    DataModel.selection = "Home Page Opened";
                    Navigator.pop(context);
                  });
                },
                splashColor: Colors.blueGrey,
              ),
              InkWell(
                child: ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text("Notifications"),
                  trailing: Container(
                    height: 30,
                    width: 30,
                    child: Center(child: Text("1",style: TextStyle(color: Colors.white,fontSize: 20),)),
                    decoration: BoxDecoration(
                      color: Colors.red,
                    shape: BoxShape.circle
                  )

                    ,),
                ),
                onTap: () {
                  setState(() {
                    DataModel.selection = "Notifications Page Opened";
                    Navigator.pop(context);
                  });
                },
                splashColor: Colors.blueGrey,
              ),
              InkWell(
                child: ListTile(
                  leading: Icon(Icons.message),
                  title: Text("Messages"),
                  trailing: Icon(Icons.arrow_right_rounded),
                ),
                onTap: () {
                  setState(() {
                    DataModel.selection = "Messages Page Opened";
                    Navigator.pop(context);
                  });
                },
                splashColor: Colors.blueGrey,
              ),
              InkWell(
                child: ListTile(
                  leading: Icon(Icons.post_add_sharp),
                  title: Text("My Postings"),
                  trailing: Icon(Icons.arrow_right_rounded),
                ),
                onTap: () {
                  setState(() {
                    DataModel.selection = "My Postings Page Opened";
                    Navigator.pop(context);
                  });
                },
                splashColor: Colors.blueGrey,
              ),
              InkWell(
                child: ListTile(
                  leading: Icon(Icons.credit_card),
                  title: Text("My Profile"),
                  trailing: Icon(Icons.arrow_right_rounded),
                ),
                onTap: () {
                  setState(() {
                    DataModel.selection = "My Profile Page Opened";
                    Navigator.pop(context);
                  });
                },
                splashColor: Colors.blueGrey,
              ),
              InkWell(
                child: ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text("Favorite"),
                  trailing: Icon(Icons.arrow_right_rounded),
                ),
                onTap: () {
                  setState(() {
                    DataModel.selection = "My Favorite Page Opened";
                    Navigator.pop(context);
                  });
                },
                splashColor: Colors.blueGrey,
              ),
              AboutListTile(
                icon: Icon(Icons.account_box_outlined),
                applicationName: "BekirDURAN",
                applicationIcon: Icon(Icons.legend_toggle_outlined),
                applicationLegalese: "Application Legalese",
                applicationVersion: "1.0",
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Center(child:
                  FlatButton(onPressed: ()=>print("log out"), child: Icon(Icons.logout,size: 35,color: Colors.red.shade800,),)

                ,)
              ),
            ],
          ),
        ));
  }

  void listProducts(int index) {
    switch(index){
      case 0: DataModel.selection = "Electronics Products Listing"; break;
      case 1: DataModel.selection = "Vehicle Products Listing"; break;
      case 2: DataModel.selection = "Furniture Products Listing"; break;
      case 3: DataModel.selection = "Services Products Listing"; break;
      case 4: DataModel.selection = "Books Products Listing"; break;
      case 5: DataModel.selection = "Estate Products Listing"; break;
      case 6: DataModel.selection = "Others Products Listing"; break;
    }
  }

  Widget buildBottomNavigationBar() {

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blueGrey.shade200, Colors.blueGrey.shade900]
          )
      ),
      child: BottomNavigationBar(
        elevation: 0,
        showUnselectedLabels: false,
        backgroundColor: Colors.transparent,
        unselectedItemColor: Colors.white,
        items: myNavigationBarItems(),
        currentIndex: selectedItem==null?2:selectedItem,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            print(index.toString());
            selectedItem = index;
            goToPage(index);
          });
        },
        showSelectedLabels: false,
        selectedIconTheme: IconThemeData(size: 40,color: Colors.cyan),
      ),
    );
  }

  List<BottomNavigationBarItem> myNavigationBarItems() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notifications"),
      BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: "Share"),
      BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Messages"),
      BottomNavigationBarItem(icon: Icon(Icons.table_chart_rounded), label: "My Shared")
    ];
  }

  void goToPage(int index) {
    switch (index){
      case 0: DataModel.selection = "Home\nScreen"; break;
      case 1: DataModel.selection = "Notifications\nScreen"; break;
      case 2: DataModel.selection = "Share\nScreen"; break;
      case 3: DataModel.selection = "Messages\nScreen"; break;
      case 4: DataModel.selection = "My Shared\nScreen"; break;
    }
  }
}
