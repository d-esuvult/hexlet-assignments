@import exercise.dto.articles.BuildArticlePage
@param BuildArticlePage page
@template.layout.page(content = @`
    @if(page.getErrors() != null)
        <ul>
            @for(var validator : page.getErrors().values())
                @for(var error : validator)
                    <li>${error.getMessage()}</li>
                @endfor
            @endfor
        </ul>
    @endif

    <form action="/articles" method="post">
        <div class="form-group">
            <label for="title">
                <input type="text" class="form-control" placeholder="enter title" required name="title" value="${page.getTitle()}">
            </label>
        </div>
        <div class="form-group">
            <label for="content">
                <textarea name="content" required>${page.getContent()}</textarea>
            </label>
        </div>
        <input type="submit" class="btn btn-primary" value="submit">
    </form>
`)
