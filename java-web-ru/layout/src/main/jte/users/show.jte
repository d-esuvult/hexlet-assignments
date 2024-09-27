@import exercise.dto.users.UserPage
@param UserPage page

@template.layout.page(
content = @`

    <div><h1>${page.getUser().getFirstName()}</h1></div>

`
)