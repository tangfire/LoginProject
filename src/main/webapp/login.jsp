<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2024/11/3
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style>


    body{
      margin: 0;
      padding: 0;
      height: 100vh;
      background: linear-gradient(to right,#EDD3DC,#C8DFED);

    }

    .box{
      width: 950px;
      height: 450px;
      /* border: 1px solid red; */
      position: fixed;
      top: 50%;
      left: 50%;
      transform: translate(-50%,-50%);
      box-shadow: 0 0 15px rgba(255, 255, 255, .5);
      display: flex;
    }

    .box>div{

      width: 50%;
      height: 100%;
      /* border: 1px solid red; */
    }

    .left{
      background-color: #EDD3DC;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .leftBox *{
      color: #fff;
      text-align: center;

    }

    .leftBox>img{
      width: 30%;
      border-radius: 100%;
      margin: auto;
      display: block;
    }


    .leftBox>.tit{
      font-size: 30px;
      letter-spacing: 2px;

    }

    .leftBox>.name{
      font-size: 18px;
      letter-spacing: 2px;
      margin: 10px 0;
    }


    .right{
      background-color: #fff;
    }

    .input{
      height: 40px;
      border: none;
      border-bottom: 3px solid #B3A5FC;
      padding-left: 5px;
      width: 90%;
      outline: none;
      margin: auto;
      display: block;
      font-size: 18px;
      margin-bottom: 18px;

    }

    h1{
      color: #9C3493;
      text-align: center;
      padding: 25px 0;
    }

    .btn{
      margin: auto;
      height: 50px;
      width: 80%;
      display: flex;
      justify-content: center;
      align-items: center;
      background: linear-gradient(to right,#EDD3DC,#C8DFED);
      font-size: 18px;
      color: #9C3493;
      border-radius: 30px;
      border: none;
      margin-top: 50px;
      font-weight: bold;
    }


    /* 适配pc */
    @media screen and (min-width:960px){
      .box{
        width: 60%;
        max-width: 950px;
        min-width: 650px;
      }
    }

    /* 适配pad */
    @media screen and (max-width:960px){
      .box{
        display: block;
        height: auto;
        width: 60%;

      }

      .box>div{
        width: 100%;
      }

      h1{
        margin: 0;
      }

      .left{
        padding: 20px 0;
      }

      .right{
        padding-bottom: 20px;
      }
    }

    /* 适配移动 */
    @media screen and (max-width:750px){
      .box{
        width: 80%;
      }
    }


  </style>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <script>
    $(function(){
      $('.btn').click(function(){
        let account = $('.account').val();
        let password = $('.password').val();
        if(account == '' || password == ''){
          alert("文本输入为空!");
          return;
        }
        $.ajax({
          url:'/lp/login',
          data:{
            account:account,
            password:password
          },
          type: 'post', // 改为 POST 请求
          dataType:'json',
          success:function(dt){
            if(dt.code === 0){
              alert('账号密码输入有误!登录失败!')
            }else{
              alert('欢迎用户:'+dt.object.userName+'登录!')
              window.location.href = '/lp/index.jsp'; // 可以根据需要重定向
            }
          },
          error: function(xhr, status, error) {
            alert('请求失败: ' + error); // 处理请求失败的情况
          }
        })
      })
    })
  </script>
  <!-- <script>
      window.onload=function(){
          let user = {
              account:'admin',
              password:'123456'
          }

          document.querySelector('.btn').onclick=function(){
              let account = document.querySelector('.account').value;
              let password = document.querySelector('.password').value;
              if(account == '' || password == ''){
                  alert('文本输入有空!');
                  return;
              }
              if(account!=user.account || password != user.password){
                  alert('账号或者密码输入有误!');
                  return;
              }
              alert("登录成功");
              document.querySelector('.account').value='';
              document.querySelector('.password').value='';
          }
      }
  </script> -->
</head>
<body>
<div class="box">
  <div class="left">
    <div class="leftBox">
      <div class="tit">WELCOME</div>
      <div class="name">tangfire</div>
      <img src="img/user.jpg" alt="">
    </div>
  </div>
  <div class="right">
    <h1>Login</h1>
    <input type="text" name="uname" class="input account" placeholder="your account">
    <input type="password" name="upwd" class="input password" placeholder="your password">
    <button class="btn">Login</button>
  </div>
</div>
</body>
</html>
