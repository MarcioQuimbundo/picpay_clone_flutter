import 'package:flutter/material.dart';
import 'package:picpay_clone_flutter/pages/home/home_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  MyHomePageBloc bloc = MyHomePageBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: Scaffold(
          body: DefaultTabController(
              length: 2,
              child: CustomScrollView(
                physics: ClampingScrollPhysics(),
                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: 40.0,
                    backgroundColor: Colors.grey[200],
                    leading: IconButton(
                      color: Theme.of(context).primaryColor,
                      icon: Icon(Icons.queue),
                      onPressed: ()=>print("qrbutton"),
                    ),
                    actions: <Widget>[
                      IconButton(
                        color: Theme.of(context).primaryColor,
                        icon: Icon(Icons.person_add),
                        onPressed: ()=>print("add person button"),
                      )
                    ],
                    pinned: false,
                    elevation: 0.0,
                    forceElevated: true,
                    floating: false,
                    flexibleSpace: Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 40.0,
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Meu saldo",
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "R\$ 35,02",
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        )
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor
                      ),
                      child: Text("fsdfs"),
                    )
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: Tabs(50.0),
                  ),
                  SliverFillRemaining(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _tabView(),
                    ),
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}

class Tabs extends SliverPersistentHeaderDelegate {
  final double size;

  Tabs(this.size);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).backgroundColor,
      height: size,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Atividades",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold
            ),
          ),
          TabBar(
            isScrollable: true,
            labelColor: Theme.of(context).primaryColor,
            indicatorColor: Theme.of(context).primaryColor,
            indicatorPadding: EdgeInsets.all(0),
            indicatorSize: TabBarIndicatorSize.label,
            tabs: <Widget>[
              Tab(
                text: "Todas",
              ),
              Tab(
                text: "Minhas",
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => size;

  @override
  double get minExtent => size;

  @override
  bool shouldRebuild(Tabs oldDelegate) {
    return oldDelegate.size != size;
  }
}

Widget _tabView() {
  return TabBarView(
    children: <Widget>[
      Container(
        child: _listActivities(),
      ),
      Container(
        child: _listActivities(),
      ),
    ],
  );
}

List activities = [
  {"foto": "alfredo", "remetente": "@alfredorose", "destinatario": "@jackbyrd", "timestamp": "2 dias atrás", "typeTransaction": "pagou a", "comentarios": 2, "likes": 5, "toMe": true, "value": "R\$ 50,00" },
  {"foto": "diane", "remetente": "@dianekuhn", "destinatario": "@alfredorose", "timestamp": "3 dias atrás", "typeTransaction": "pagou a", "comentarios": 2, "likes": 5, "toMe": false, "value": "R\$ 50,00" },
];

Widget _listActivities(){
  return ListView.builder(
    itemBuilder: (context, position){
      return _cardItem(activities[position], context);
    },
    itemCount: activities.length,
  );
}

Widget _cardItem(activity, context){
  return Card(
    child: Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  child: Image.asset("assets/${activity["foto"]}.jpg", height: 60.0,),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              RichText(
                text: TextSpan(
                    text: "${activity["remetente"]} ",
                    style: TextStyle(
                        color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(text: "${activity["typeTransaction"]} ",
                        style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                      TextSpan(text:"${activity["destinatario"]} ",
                        style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ]
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.people_outline, color: Colors.grey,),
                    Text(
                      " ${activity["timestamp"]} ",
                      style: TextStyle(
                        color: Colors.grey
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.chat, color: Colors.grey,),
                    Padding(
                      padding: const EdgeInsets.only(left: 3, right: 8),
                      child: Text(
                        activity["comentarios"].toString(),
                        style: TextStyle(
                          color: Colors.grey
                        ),
                      ),
                    ),
                    Icon(Icons.favorite_border, color: Colors.grey,),
                    Padding(
                      padding: const EdgeInsets.only(left: 3, right: 8),
                      child: Text(
                        activity["likes"].toString(),
                        style: TextStyle(
                          color: Colors.grey
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
    ),
  );
}
