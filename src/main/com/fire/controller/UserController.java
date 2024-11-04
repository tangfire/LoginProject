package com.fire.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fire.pojo.vo.MessageModel;
import com.fire.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class UserController extends HttpServlet {

    private UserService userService = new UserService();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uname = req.getParameter("account");
        String upwd = req.getParameter("password");

        MessageModel messageModel =  userService.userLogin(uname,upwd);


        // 设置响应类型为 JSON
        resp.setContentType("application/json;charset=utf-8");
        resp.setCharacterEncoding("UTF-8");

        ObjectMapper objectMapper = new ObjectMapper();

        if (messageModel.getCode() == 1) {
            req.getSession().setAttribute("user", messageModel.getObject());
            String jsonResponse = objectMapper.writeValueAsString(messageModel);

            resp.getWriter().write(jsonResponse);
        } else {
            String jsonResponse = objectMapper.writeValueAsString(messageModel);
            resp.getWriter().write(jsonResponse);
        }

    }
}
