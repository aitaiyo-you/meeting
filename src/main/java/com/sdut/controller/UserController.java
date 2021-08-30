package com.sdut.controller;

import com.github.pagehelper.PageInfo;
import com.sdut.pojo.Meeting;
import com.sdut.pojo.Users;
import com.sdut.service.MeetingService;
import com.sdut.service.UsersService;
import com.sdut.util.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UsersService usersService;
    @Autowired
    private MeetingService meetingService;

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/doLogin")
    public ModelAndView doLogin(String phone, String password, ModelAndView modelAndView, HttpSession session) {
        String pass = MD5Utils.md5(password);
        Users users = new Users();
        users.setUtel(phone);
        users.setUpwd(pass);
        users.setUemail(phone);
        Users users1 = usersService.login(users);
        if (users1 != null) {
            if (users1.getUstatus() == 2) {
                if (users1.getUauth() == 1) {
                    session.setAttribute("user", users1);
                    modelAndView.setViewName("admin");
                } else if (users1.getUauth() == 2) {
                    session.setAttribute("user", users1);
                    modelAndView.setViewName("userMain");
                }
            } else if (users1.getUauth() == 1) {
                session.setAttribute("message", "用户尚未通过审核，请待通过审核后重新登录！");
                modelAndView.setViewName("error");
            } else {
                session.setAttribute("message", "用户审核未通过！");
                modelAndView.setViewName("error");
            }
        } else {
            session.setAttribute("message", "用户名或密码输入错误，登录失败！");
            modelAndView.setViewName("error");
        }
        return modelAndView;
    }

    @RequestMapping("/exitLogin")
    public String exit(HttpSession session) {
        session.removeAttribute("user");
        return "index";
    }
    @RequestMapping("/register")
    public String register() {
        return "register";
    }
    @RequestMapping("/doRegister")
    public ModelAndView doRegister(String name, String password, String phone, String email, ModelAndView modelAndView, HttpSession session) {
        String pass = MD5Utils.md5(password);
        Users users = new Users();
        users.setUname(name);
        users.setUpwd(pass);
        users.setUtel(phone);
        users.setUemail(email);
        int user1 = usersService.register(users);
        if (user1 == 1) {
            session.setAttribute("message", "success");
            modelAndView.setViewName("registerResult");
        } else {
            session.setAttribute("message", "failed");
            modelAndView.setViewName("registerResult");
        }
        return modelAndView;
    }
    @RequestMapping("/information")
    public String information(Integer id, HttpSession session) {
        Users users = usersService.selectByUid(id);
        session.setAttribute("user1", users);
        return "userInform";
    }
    @RequestMapping("/updatePwd")
    public String updatePwd(Integer id, HttpSession session) {
        Users users = usersService.selectByUid(id);
        session.setAttribute("user1", users);
        return "updatePwd";
    }

    @RequestMapping("/admin")
    public String admin() {
        return "admin";
    }

    @RequestMapping("/userMain")
    public String userMain() {
        return "userMain";
    }

    @RequestMapping("/auditUser")
    public String auditUser(
            @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
            @RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNum,
            Model model
    ) {
        PageInfo<Users> sh = usersService.getAuditPage(pageNum, 5, keyword);
        model.addAttribute("auditInfo", sh);
        model.addAttribute("keyword1", keyword);
        return "adminAudit";
    }

    @RequestMapping("/adminUser")
    public String adminUser(
            @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
            @RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNum,
            Model model
    ) {
        PageInfo<Users> sh = usersService.getUserPage(pageNum, 5, keyword);
        model.addAttribute("userInfo", sh);
        model.addAttribute("keyword2", keyword);
        return "adminUser";
    }

    @RequestMapping("/adminMeeting")
    public String adminMeeting(
            @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
            @RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNum,
            Model model
    ) {
        PageInfo<Meeting> sh = meetingService.getMeetingPage(pageNum, 5, keyword);
        model.addAttribute("meetingInfo", sh);
        model.addAttribute("keyword3", keyword);
        return "adminMeeting";
    }

    @PostMapping("/passAudit")
    @ResponseBody
    public String passAudit(
            @RequestParam("uid") Integer id
    ) {
        int flag = usersService.passAudit(id);
        if (flag == 1) {
            return "success";
        } else {
            return "failed";
        }
    }
    @PostMapping("/failAudit")
    @ResponseBody
    public String failAudit(
            @RequestParam("uid") Integer uid
    ) {
        int flag = usersService.failAudit(uid);
        if (flag == 1) {
            return "success";
        } else {
            return "failed";
        }
    }
    @PostMapping("/passAllAudit")
    @ResponseBody
    public String passAllAudit(
            @RequestParam("ids[]") List<Integer> ids
    ) {
        int flag = usersService.passAllAudit(ids);
        if (flag > 0) {
            return "success";
        } else {
            return "failed";
        }
    }
    @PostMapping("/failAllAudit")
    @ResponseBody
    public String failAllAudit(
            @RequestParam("ids[]") List<Integer> ids
    ) {
        int flag = usersService.failAllAudit(ids);
        if (flag > 0) {
            return "success";
        } else {
            return "failed";
        }
    }
    @PostMapping("/deleteUser")
    @ResponseBody
    public String deleteUser(
            @RequestParam("uid") Integer uid
    ) {
        int flag = usersService.deleteUser(uid);
        if (flag == 1) {
            return "success";
        } else {
            return "failed";
        }
    }
    @PostMapping("/deleteAllUser")
    @ResponseBody
    public String deleteAllUser(
            @RequestParam("ids[]") List<Integer> ids
    ) {
        int flag = usersService.deleteAllUser(ids);
        if (flag > 0) {
            return "success";
        } else {
            return "failed";
        }
    }
    @PostMapping("/selectRepeat")
    @ResponseBody
    public String selectRepeat(
            @RequestParam(value = "phone", required = false, defaultValue = "") String phone,
            @RequestParam(value = "email", required = false, defaultValue = "") String email
    ) {
        Users users = new Users();
        users.setUtel(phone);
        users.setUemail(email);
        Users users1 = usersService.selectRepeat(users);
        if (users1 != null) {
            return "repeat";
        } else {
            return "success";
        }
    }
    @PostMapping("/addUser")
    @ResponseBody
    public String addUser(
            @RequestParam(value = "name", required = false, defaultValue = "") String name,
            @RequestParam(value = "password", required = false, defaultValue = "") String password,
            @RequestParam(value = "sex", required = false, defaultValue = "") String sex,
            @RequestParam(value = "phone", required = false, defaultValue = "") String phone,
            @RequestParam(value = "email", required = false, defaultValue = "") String email,
            @RequestParam(value = "birthday", required = false, defaultValue = "") String birthday
    ) {
        Users users = new Users();
        users.setUname(name);
        String pass = MD5Utils.md5(password);
        users.setUpwd(pass);
        users.setUtel(phone);
        users.setUemail(email);
        if (!sex.equals("")) {
            users.setUsex(sex);
        }
        if (!birthday.equals("")) {
            users.setUbirth(birthday);
        }
        int flag = usersService.addUser(users);
        if (flag == 1) {
            return "success";
        } else {
            return "failed";
        }
    }
    @PostMapping("/updateUser")
    @ResponseBody
    public String updateUser(
            @RequestParam("id") Integer id,
            @RequestParam(value = "name", required = false, defaultValue = "") String name,
            @RequestParam(value = "sex", required = false, defaultValue = "") String sex,
            @RequestParam(value = "phone", required = false, defaultValue = "") String phone,
            @RequestParam(value = "email", required = false, defaultValue = "") String email,
            @RequestParam(value = "birthday", required = false, defaultValue = "") String birthday
    ) {
        Users users = new Users();
        users.setUid(id);
        users.setUname(name);
        users.setUtel(phone);
        users.setUemail(email);
        if (!sex.equals("")) {
            users.setUsex(sex);
        }
        if (!birthday.equals("")) {
            users.setUbirth(birthday);
        }
        int flag = usersService.updateUser(users);
        if (flag == 1) {
            return "success";
        } else {
            return "failed";
        }
    }
    @PostMapping("/updatePass")
    @ResponseBody
    public String updatePass(
            @RequestParam("newPwd") String newPwd,
            @RequestParam("oldPwd") String oldPwd,
            @RequestParam("id") Integer id
    ) {
        String New = MD5Utils.md5(newPwd);
        String Old = MD5Utils.md5(oldPwd);
        int flag = usersService.updatePwd(New, id, Old);
        if (flag == 1) {
            return "success";
        } else {
            return "failed";
        }
    }
    @PostMapping("/selectUserByMid")
    @ResponseBody
    public PageInfo<Users> selectUserByMid(
            @RequestParam("id") Integer id,
            @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
            @RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNum
    ) {
        PageInfo<Users> usersList = usersService.selectUserById(pageNum, 5, keyword, id);
        return usersList;
    }

}
