import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:net_demo/model/post_model.dart';
import 'package:net_demo/services/http_servic.dart';

class HomePage extends StatefulWidget {
  static const String id="HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String data="";

  void _apiPostList(Post post){
    Network.GET(Network.API_LIST_2+post.id.toString(), Network.paramsEmpty()).then((response) => {
      _showResponse(response!)
    });
  }

  void _apiCreatePost(Post post){
    Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((response) => {
      _showResponse(response!)
    });
  }

  void _apiUpdatePost(Post post){
    Network.PUT(Network.API_UPDATE+post.id.toString(), Network.paramsUpdate(post)).then((response) => {
      _showResponse(response!)
    });
  }

  void _apiDeletePost(Post post){
    Network.GET(Network.API_DELETE+post.id.toString(), Network.paramsEmpty()).then((response) => {
      _showResponse(response!)
    });
  }

  void _showResponse(String response){
    setState(() {
      data=response;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var post=Post(name: "test", salary: 123, age: 23, id: 2, image: '', );
    _apiUpdatePost(post);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: Center(
          child: Text(data != null ? data : "No Data"),
        ),
      ),
    );
  }
}
