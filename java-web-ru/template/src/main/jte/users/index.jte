@import exercise.dto.users.UsersPage
@param UsersPage page
<!doctype html>
<html lang="en">
    <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title></title>
    </head>
    <body>
        <div class="list-group">
        @for(var user : page.getUsers())
            <a href="/users/${user.getId()}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
                <div class="d-flex gap-2 w-100 justify-content-between">
                    <div>
                        <h6 class="mb-0">${user.getFirstName()} ${user.getLastName()}</h6>
                        <p class="mb-0 opacity-75">${user.getEmail()}</p>
                    </div>
                    <small class="opacity-50 text-nowrap">${user.getId()}</small>
                </div>
            </a>
        @endfor
        </div>
    </body>
</html>