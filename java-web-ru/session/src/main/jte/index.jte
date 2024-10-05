@import exercise.dto.MainPage
@param MainPage page
@template.layout.page(content = @`
    <div class="mx-auto p-4 py-md-5">
        @if(page.getName() != null)
            <div class="mb-3">
                Имя: ${page.getName().toString()}
            </div>
            <form method="post" action="/sessions/delete">
                <button type="submit">Выйти</button>
            </form>
        @endif
        @if(page.getName() == null)
            <a href="/sessions/build">Войти</a>
        @endif
    </div>
`)
