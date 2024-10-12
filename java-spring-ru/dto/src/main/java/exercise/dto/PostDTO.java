package exercise.dto;

import java.util.List;

import exercise.model.Comment;
import lombok.Getter;
import lombok.Setter;

// BEGIN
@Getter
@Setter
public class PostDTO {
    private Long id;
    private String title;
    private String body;
    private List<CommentDTO> comments;
}
// END
