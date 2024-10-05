package exercise.controller;

import org.apache.commons.lang3.StringUtils;
import exercise.util.Security;
import exercise.model.User;
import exercise.util.NamedRoutes;
import static io.javalin.rendering.template.TemplateUtil.model;
import exercise.repository.UserRepository;
import exercise.dto.users.UserPage;
import io.javalin.http.NotFoundResponse;
import io.javalin.http.Context;


public class UsersController {

    public static void build(Context ctx) throws Exception {
        ctx.render("users/build.jte");
    }

    // BEGIN
    public static void create(Context ctx) {
        var firstName = ctx.formParam("firstName");
        var lastName = ctx.formParam("lastName");
        var email = ctx.formParam("email");
        var password = ctx.formParam("password");
        var token = Security.generateToken();
        ctx.cookie("token", token);
        var user = new User(firstName, lastName, email, password, token);
        UserRepository.save(user);
        var userId = UserRepository.search(firstName).get(0).getId();
        ctx.redirect(NamedRoutes.userPath(userId));
    }

    public static void show(Context ctx) {
        var id = ctx.pathParam("id");
        var user = UserRepository.find(Long.valueOf(id))
                .orElseThrow(() -> new NotFoundResponse("User " + id + " was not found"));
        var userToken = user.getToken();
        var userCookie = ctx.cookie("token");
        if (userToken.equals(userCookie)) {
            var page = new UserPage(user);
            ctx.render("users/show.jte", model("page", page));
        } else {
            ctx.redirect(NamedRoutes.buildUserPath());
        }
    }
    // END
}
