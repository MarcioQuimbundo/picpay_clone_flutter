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
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Text("Itens");
                      },
                    ),
                  ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Atividades"),
          TabBar(
            isScrollable: true,
            labelColor: Theme.of(context).primaryColor,
            indicatorColor: Theme.of(context).primaryColor,
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
