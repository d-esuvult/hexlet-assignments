@import exercise.dto.users.UsersPage
@param UsersPage page

@template.layout.page(
content = @`
    @for(var user : page.getUsers())
        <h1>${user.getFirstName()} ${user.getLastName()}</h1>
    @endfor

    `
)
