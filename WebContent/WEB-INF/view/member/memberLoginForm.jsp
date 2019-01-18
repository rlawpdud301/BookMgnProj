<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<c:if test="${Error != null }">
   <script>
      alert("${Error}");
   </script>
</c:if>
<style>
   @import
      url("//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css");
   
   .login-block {
      float: left;
      width: 100%;
      padding: 50px 0;
   }
   
   .banner-sec {
      background: url(../images/library.jpg)
         no-repeat left bottom;
      background-size: cover;
      min-height: 500px;
      border-radius: 0 10px 10px 0;
      padding: 0;
   }
   
   .container {
      background: #fff;
      border-radius: 10px;
      box-shadow: 15px 20px 0px rgba(0, 0, 0, 0.1);
   }
   
   .carousel-inner {
      border-radius: 0 10px 10px 0;
   }
   
   .carousel-caption {
      text-align: left;
      left: 5%;
   }
   
   .login-sec {
      padding: 50px 30px;
      position: relative;
   }
   
   .login-sec .copy-text {
      position: absolute;
      width: 80%;
      bottom: 20px;
      font-size: 13px;
      text-align: center;
   }
   
   .login-sec .copy-text i {
      color: #FEB58A;
   }
   
   .login-sec .copy-text a {
      color: #E36262;
   }
   
   .login-sec h2 {
      margin-bottom: 30px;
      font-weight: 800;
      font-size: 30px;
      color: #DE6262;
   }
   
   .login-sec h2:after {
      content: " ";
      width: 100px;
      height: 5px;
      background: #FEB58A;
      display: block;
      margin-top: 20px;
      border-radius: 3px;
      margin-left: auto;
      margin-right: auto
   }
   
   .btn-login {
      background: #DE6262;
      color: #fff;
      font-weight: 600;
   }
   
   .banner-text {
      width: 70%;
      position: absolute;
      bottom: 40px;
      padding-left: 20px;
   }
   
   .banner-text h2 {
      color: #fff;
      font-weight: 600;
   }
   
   .banner-text h2:after {
      content: " ";
      width: 100px;
      height: 5px;
      background: #FFF;
      display: block;
      margin-top: 20px;
      border-radius: 3px;
   }
   
   .banner-text p {
      color: #fff;
   }
   
   #option {
      padding: 0;
   }
   
   #option a {
      font-size: 14px;
   }
</style>
</head>
<body>
   <header>
      <jsp:include page="../FooterHeader/header.jsp" flush="false" />  
   </header>

   <section class="login-block">
      <div class="container">
         <div class="row">
            <div class="col-md-4 login-sec">
               <h2 class="text-center">Login Now</h2>
               <form class="login-form" action="login.do" method="post">
                  <div class="form-group">
                     <label for="exampleInputEmail1" class="text-uppercase">Member</label>
                     <input type="text" class="form-control" name="id" placeholder="">
                  </div>
                  <div class="form-group">
                     <label for="exampleInputPassword1" class="text-uppercase">Password</label>
                     <input type="password" class="form-control" name="password"
                        placeholder="">
                  </div>


                  <div class="form-check" id="option">
                     <a href="${pageContext.request.contextPath}/member/insert.do">회원가입하기</a> &nbsp;
                     <a href="${pageContext.request.contextPath}/member/find.do">ID/PW찾기</a>
                     <button type="submit" class="btn btn-login float-right">Submit</button>
                  </div>

               </form>
               <div class="copy-text">
                  Created with <i class="fa fa-heart"></i> by <a
                     href="http://grafreez.com">Grafreez.com</a>
               </div>
            </div>
            <div class="col-md-8 banner-sec">
               <div id="carouselExampleIndicators" class="carousel slide"
                  data-ride="carousel">
                  <ol class="carousel-indicators">
                     <li data-target="#carouselExampleIndicators" data-slide-to="0"
                        class="active"></li>
                     <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                     <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                  </ol>
                  <div class="carousel-inner" role="listbox">
                     <div class="carousel-item active">
                        <div class="carousel-caption d-none d-md-block">
                        </div>
                     </div>
                  </div>

               </div>
            </div>
         </div>
      </div>
   </section>

   <footer>
      <jsp:include page="../FooterHeader/footer.jsp" flush="false" />
   </footer>
</body>
</html>