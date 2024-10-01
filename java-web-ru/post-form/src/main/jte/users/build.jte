@import exercise.dto.users.UsersPage
@param UsersPage page
@template.layout.page(content = @`
    <form action="/users" method="post">
        <div><label><input type="text" required name="firstName"></label></div>
        <div><label><input type="text" required name="lastName"></label></div>
        <div><label><input type="email" required name="email"></label></div>
        <div><label><input type="password" required name="password"></label></div>
        <input type="submit" value="Зарегистрировать">
    </form>

    `
)
