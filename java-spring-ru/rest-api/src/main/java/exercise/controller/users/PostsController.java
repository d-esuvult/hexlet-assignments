package exercise.controller.users;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.GetMapping;

import exercise.model.Post;
import exercise.Data;

// BEGIN
@RestController
@RequestMapping("/api")
public class PostsController {
    private static List<Post> posts = Data.getPosts();

    @GetMapping("/users/{id}/posts")
    public List<Post> getPosts(@PathVariable Integer id) {
        var userPosts = posts.stream()
                .filter(p -> p.getUserId() == id)
                .toList();
        return userPosts;
    }

    @PostMapping("/users/{id}/posts")
    public ResponseEntity create(@PathVariable Integer id, @RequestBody Post post) throws URISyntaxException {
         posts.add(post);
         post.setUserId(id);
         return ResponseEntity.created(new URI("/users")).body(post);
    }
}
// END
