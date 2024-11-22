<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "util.CookieManager" %>

<%
	String loginId = CookieManager.readCookie(request, "loginId"); // loginId 라는 쿠키 값이 있는지 확인

	String cookieCheck = "";
	if (!loginId.equals("")) cookieCheck = "checked"; // 이미 loginId 쿠키가 생성되었다면 checked 속성값을 추가한다.
%>

<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
 -->
<!-- beautify ignore:start -->
<html
  lang="en"
  class="light-style customizer-hide"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>로그인</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="../assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="../assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="../assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->
    <!-- Page -->
    <link rel="stylesheet" href="../assets/vendor/css/pages/page-auth.css" />
    <!-- Helpers -->
    <script src="../assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../assets/js/config.js"></script>
  </head>

  <body>
    <!-- Content -->
    <div class="container-xxl">
      <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner">
          <!-- Register -->
          <div class="card">
            <div class="card-body">
              <h4 class="mb-2">어서오세요! 👋</h4>
              <p class="mb-4">게시판의 모든 기능을 사용하기 위해서는 로그인이 필요합니다.</p>

              <form id="formAuthentication" class="mb-3" action="../login.do" method="POST" onsubmit = "return form_chk();">
                <div class="mb-3">
                  <label for="email" class="form-label">아이디</label>
                  <input
                    type="text"
                    class="form-control"
                    id="id"
                    name="id"
                    value = "<%= loginId %>"
                    placeholder="아이디를 입력하세요."
                    autofocus
                  />
                </div>
                <div class="mb-3 form-password-toggle">
                  <div class="d-flex justify-content-between">
                    <label class="form-label" for="password">비밀번호</label>
                    
                  </div>
                  <div class="input-group input-group-merge">
                    <input
                      type="password"
                      id="password"
                      class="form-control"
                      name="password"
                      placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                      aria-describedby="password"
                    />
                    <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                  </div>
                </div>
                <div class="mb-3">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="remember" name = "remember" value = "Y" <%= cookieCheck %> />
                    <label class="form-check-label" for="remember"> 아이디 저장하기 </label>
                  </div>
                </div>
                <div class="mb-3">
                  <button class="btn btn-primary d-grid w-100" type="submit">로그인</button>
                </div>
              </form>
              <div class = "text-center" style = "text-align: center; margin-top: 1.5em; margin-bottom: 1.5em;">
            	<a href="javascript:forgotPassword();">
	                비밀번호를 잊어버리셨나요?
	              </a>
              </div>

              <p class="text-center">
                <span>회원이 아니신가요?</span>
                <a href="Register.jsp">
                  <span>회원가입</span>
                </a>
              </p>
            </div>
          </div>
          <!-- /Register -->
        </div>
      </div>
    </div>
    <!-- / Content -->

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="../assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../assets/vendor/libs/popper/popper.js"></script>
    <script src="../assets/vendor/js/bootstrap.js"></script>
    <script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="../assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="../assets/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
  
  <script type="text/javascript">
  	function forgotPassword() {
  		var id = document.getElementById("id");
  		if (id.value == "") {
  			alert("아이디를 입력해주세요!");
  			id.focus();
  			return false;
  		}
  		
  		if (confirm("확인 버튼 클릭 시 임시 비밀번호를 입력하셨던 이메일로 발송드립니다.")) {
  			$.ajax({
  				url: "../forgotpassword.do",
  				type: "post",
  				data: {id: id.value},
  				dataType: "text",
  				success: function(response){
  					alert("임시 비밀번호 발송이 완료되었습니다.");
  				},
  				error: function(xhr, status, error) {
  					alert("임시 비밀번호 발송 중 오류가 발생했습니다.\n" + error);
  				}
  			});
  		}
  		else {
  			alert("임시 비밀번호 발급을 취소하셨습니다.");
  			return false;
  		}
  	}
  
  	function form_chk() {
  		// 기본적인 입력 체크
  		if (!document.getElementById("id").value) {
  			alert("아이디를 입력해주세요!");
  			document.getElementById("id").focus();
  			return false;
  		}
  		if (!document.getElementById("password").value) {
  			alert("비밀번호를 입력해주세요!");
  			document.getElementById("password").focus()
  			return false;
  		}
  		
  		return true;
  	}
  </script>
</html>