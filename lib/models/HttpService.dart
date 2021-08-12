import 'dart:convert';
import 'package:hrmsapp/GlobalVar/Globalvireables.dart';
import 'package:http/http.dart';
import 'Post.dart';
//get work state data
class HttpService {

  Uri postsURL = Uri.parse(Globalvireable.workstateapi+Globalvireable.id);
  // Uri  postsURL = Uri.parse("https://jsonplaceholder.typicode.com/posts");


 // final String postsURL = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> getPosts() async {
    Response res = await get(postsURL);

    if (res.statusCode == 200) {
      print("object11");

      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
      )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
      print("object");
    }
  }
}