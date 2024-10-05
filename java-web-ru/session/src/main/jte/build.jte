@import exercise.dto.LoginPage
@import exercise.util.NamedRoutes
@param LoginPage page
@template.layout.page(content = @`
    <div class="mx-auto p-4 py-md-5">
        @if(page != null)
            <p>${page.getError()}</p>
        @endif
        <form action="${NamedRoutes.loginPath()}" method="post">
            <div class="mb-3">
                <label class="form-label">
                    Name
                    <input placeholder="Enter name here" type="text" class="form-control" required name="name"" />
                </label>
            </div>
            <div class="mb-3">
                <label class="form-label">
                    Password
                    <input placeholder="Enter password here" type="text" class="form-control" required name="password" />
                </label>
            </div>
            <input type="submit" class="btn btn-primary" value="Login" />
        </form>
    </div>
`)
