package com.fire.service;

import com.fire.mapper.UserMapper;
import com.fire.pojo.User;
import com.fire.pojo.vo.MessageModel;
import com.fire.utils.MybatisUtils;
import com.fire.utils.StringUtil;
import org.apache.ibatis.session.SqlSession;

public class UserService {

    /**
     * 用户登录
     * @param uname
     * @param upwd
     * @return
     */
    public MessageModel userLogin(String uname,String upwd){


        MessageModel messageModel = new MessageModel();

        User u = new User();
        u.setUserName(uname);
        u.setUserPwd(upwd);
        messageModel.setObject(u);



        if (StringUtil.isEmpty(uname) || StringUtil.isEmpty(upwd)) {

            messageModel.setCode(0);
            messageModel.setMsg("用户名或者密码错误");

            return messageModel;
        }



        SqlSession sqlSession = MybatisUtils.getSqlSession();

        UserMapper mapper =  sqlSession.getMapper(UserMapper.class);

        User user =  mapper.queryUserByName(uname);


        sqlSession.close();





        if (user == null) {
            messageModel.setCode(0);
            messageModel.setMsg("用户不存在");
            return messageModel;
        }


        if(!upwd.equals(user.getUserPwd())){
            messageModel.setCode(0);
            messageModel.setMsg("用户密码不正确");
            return messageModel;
        }

        messageModel.setCode(1);
        messageModel.setMsg("登录成功");

        messageModel.setObject(user);

        return messageModel;
    }

}
