@import exercise.dto.posts.PostsPage
@param PostsPage page
@template.layout.page(content = @`
    <ol>
    @for(var post : page.getPosts())
        <li>
            <a href="/posts/${post.getId()}">${post.getName()}</a>
        </li>
    @endfor
    </ol>

    <nav aria-label="Page navigation example">
        <ul class="pagination">
            @if(page.getPage() - 1 == 0)
                <li class="page-item"><a class="page-link" href="/posts?page=1">Previous</a></li>
            @else
                <li class="page-item"><a class="page-link" href="/posts?page=${page.getPage() - 1}">Previous</a></li>
            @endif
            <li class="page-item"><a class="page-link" href="/posts?page=1">1</a></li>
            <li class="page-item"><a class="page-link" href="/posts?page=2">2</a></li>
            <li class="page-item"><a class="page-link" href="/posts?page=3">3</a></li>
            <li class="page-item"><a class="page-link" href="/posts?page=4">4</a></li>
            <li class="page-item"><a class="page-link" href="/posts?page=5">5</a></li>
            <li class="page-item"><a class="page-link" href="/posts?page=6">6</a></li>
            <li class="page-item"><a class="page-link" href="/posts?page=7">7</a></li>
            <li class="page-item"><a class="page-link" href="/posts?page=8">8</a></li>
            <li class="page-item"><a class="page-link" href="/posts?page=${page.getPage() + 1}">Next</a></li>
        </ul>
    </nav>
`)
