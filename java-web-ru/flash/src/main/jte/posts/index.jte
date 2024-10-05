@import exercise.dto.posts.PostsPage
@import exercise.util.NamedRoutes
@param PostsPage page
@template.layout.page(
    page = page,
    content = @`
    @if(page.getPosts() != null)
        @for(var post : page.getPosts())
            <a href="${NamedRoutes.postPath(post.getId())}">${post.getName()}</a>
        @endfor
    @endif
    <br>
    <a href="${NamedRoutes.buildPostPath()}">Create new post</a>

`)
