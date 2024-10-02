@import exercise.dto.posts.EditPostPage
@param EditPostPage page
@template.layout.page(content = @`
    @if(page.getErrors() != null)
        @for(var validator : page.getErrors().values())
            @for(var error : validator)
                <li>${error.getMessage()}</li>
            @endfor
        @endfor
    @endif

    <form action="/posts/${page.getPost().getId()}" method="post">
        <div class="form-group">
            <label for="title">
                <input type="text" class="form-control" placeholder="enter name" required name="name" value="${page.getPost().getName()}">
            </label>
        </div>
        <div class="form-group">
            <label for="content">
                <textarea name="body" required>${page.getPost().getBody()}</textarea>
            </label>
        </div>
        <input type="submit" class="btn btn-primary" value="submit">
    </form>
`)
