@import gg.jte.Content
@param Content content

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Hexlet Javalin Example</title>
</head>
<body>
    <p>
        <a href="/">Главная страница</a>
        <a href="/users">Пользователи</a>
    </p>
${content}
    <p>
        <a href="https://github.com/hexlet-components/java-javalin-example/blob/main/src/main/jte/layout/page.jte">Ебучая ссылка</a>
    </p>
</body>
</html>