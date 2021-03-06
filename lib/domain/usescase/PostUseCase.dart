import 'package:DemoFlutter/domain/entities/Post.dart';
import 'package:DemoFlutter/domain/repository/post/PostRepositoryRemote.dart';

class PostUseCase {
  PostRepositoryRemote postRepositoryRemote;

  PostUseCase(this.postRepositoryRemote);

  Future<List<Post>> getPosts() async {
    return await this.postRepositoryRemote.getPosts();
  }
}
