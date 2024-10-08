package exercise;

import exercise.model.Address;
import exercise.annotation.Inspect;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class Application {
    public static void main(String[] args) {
        var address = new Address("London", 12345678);

        // BEGIN
        for (var method : Address.class.getDeclaredMethods()) {
            if (method.isAnnotationPresent(Inspect.class)) {
                try {
                    method.invoke(address);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                var returnType = method.getReturnType().toString();
                if (returnType.contains("java.lang")) {
                    returnType = returnType.replace("class java.lang.", "");
                }
                System.out.printf("Method %s returns a value of type %s%n", method.getName(), returnType);
            }
        }
        // END
    }
}
