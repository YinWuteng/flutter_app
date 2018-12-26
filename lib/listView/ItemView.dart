import 'package:flutter/material.dart';
import 'package:flutter_app/listView/Building.dart';

//定义回调接口
typedef OnItemClickListener = void Function(int position);


//定义每一行的布局显示及响应事件监听
class ItemView extends StatelessWidget {
  final int position;
  final Building building;
  final OnItemClickListener listener;

  ItemView(this.position, this.building, this.listener);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final icon = Icon(
      building.type == BuildingType.restaurant
          ? Icons.restaurant
          : Icons.theaters,
      color: Colors.blue[500],
    );
    final widget = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(16.0),
          child: icon,
        ),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  building.title,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                Text(building.address)
              ],
            ))
      ],
    );
    //设置监听事件
    return InkWell(
      onTap: () => listener(position),
      child: widget,
    );
  }
}

//listView ，
class BuildingListView extends StatelessWidget {
  final List<Building> buildings;
  final OnItemClickListener listener;

  BuildingListView(this.buildings,this.listener);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //listView.builder可以按需求生成子空间
    return ListView.builder(
        itemCount: buildings.length,
        itemBuilder: (context, index) {
          return new ItemView(index, buildings[index],listener);
        });
  }
}
