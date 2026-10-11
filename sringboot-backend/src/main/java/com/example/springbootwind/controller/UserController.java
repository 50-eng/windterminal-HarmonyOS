package com.example.springbootwind.controller;

import com.example.springbootwind.demand.User;
import com.example.springbootwind.mapper.UserXmlMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

//@RequiredArgsConstructor //lombok提供的构造方法，代替@Autowired
@RestController
//@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserXmlMapper userxmlmapper; // 这里的类型必须是UserXmlMapper的全限定类名
    @RequestMapping("/all")
    public List<User> findall(){
        List<User> userall = userxmlmapper.findall();
        return userall;
    }

    @PostMapping("/login")
    // 把返回值类型从User改为Map<String, Object>，和插入接口保持一致
    public Map<String, Object> user1(@RequestBody(required = false) User usercondition) {
        // 1. 创建返回结果的Map，和插入接口的格式统一
        Map<String, Object> result = new HashMap<>();

        // 2. 打印传入参数（保留原有逻辑）
        System.out.println("传入参数：");
        if (usercondition != null) {
            System.out.println("id: " + usercondition.getId());
            System.out.println("username: " + usercondition.getUsername());
            System.out.println("password: " + usercondition.getPassword());
        } else {
            System.out.println("未传入任何参数");
        }

        try {
            // 3. 参数校验：登录时用户名和密码是核心参数，不能为空
            if (usercondition == null || usercondition.getUsername() == null || usercondition.getUsername().isEmpty()
                    || usercondition.getPassword() == null || usercondition.getPassword().isEmpty()) {
                result.put("code", 400); // 400：请求参数错误
                result.put("msg", "用户名和密码不能为空");
                result.put("data", null);
                return result;
            }

            // 4. 调用mapper查询用户
            User result1 = userxmlmapper.selectUserByCondition(usercondition);
            System.out.println("返回值：" + result1);

            // 5. 根据查询结果封装返回数据
            if (result1 != null) {
                result.put("code", 200); // 200：成功
                result.put("msg", "登录成功/用户查询成功");
                result.put("data", result1); // data中存放查询到的用户对象

                // ========== 打印data中的id值 ==========
                Object dataObj = result.get("data");
                User dataUser = (User) dataObj;
                System.out.println("查询到用户的id值：" + dataUser.getId());
                System.out.println("查询到用户的username值：" + dataUser.getUsername());
                System.out.println("查询到用户的password值：" + dataUser.getPassword());
            } else {
                result.put("code", 404); // 404：用户不存在/账号密码错误
                result.put("msg", "用户名或密码错误，用户不存在");
                result.put("data", null);
            }
        } catch (Exception e) {
            // 6. 捕获异常，返回错误信息
            result.put("code", 500); // 500：服务器内部错误
            result.put("msg", "查询失败：" + e.getMessage());
            result.put("data", null);
            // 打印异常堆栈，便于调试
            e.printStackTrace();
        }

        // 7. 返回统一格式的Map
        return result;
    }

    @PostMapping("/add")
    public Map<String, Object> addUser(@RequestBody User user) {
        Map<String, Object> result = new HashMap<>();
        try {
            if (user.getUsername() == null || user.getUsername().isEmpty() || user.getPassword() == null || user.getPassword().isEmpty()) {
                result.put("code", 400);
                result.put("msg", "用户名和密码不能为空");
                result.put("data", null);
            } else {
                int rows = userxmlmapper.insertUser(user);
                if (rows > 0) {
                    result.put("code", 200);
                    result.put("msg", "用户新增成功");
                    result.put("data", user); // data是新增的User对象，含自增id

                    // ========== 打印data中的id值 ==========
                    Object dataObj = result.get("data");
                    User dataUser = (User) dataObj;
                    System.out.println("新增用户的id值：" + dataUser.getId());

                    // ======================================
                } else {
                    result.put("code", 500);
                    result.put("msg", "用户新增失败");
                    result.put("data", null);
                }
            }
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "新增失败：" + e.getMessage());
            result.put("data", null);
        }
        return result;
    }

}
