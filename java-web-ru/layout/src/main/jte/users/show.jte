@import exercise.dto.users.UserPage
@param UserPage page

@template.layout.page(
content = @`

    <div><h1>${page.getUser().getFirstName()} ${page.getUser().getLastName()}</h1></div>

`
)