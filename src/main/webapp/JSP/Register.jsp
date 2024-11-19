<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

    <title>회원가입</title>

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
          <!-- Register Card -->
          <div class="card">
            <div class="card-body">
              <h4 class="mb-2">회원가입 🚀</h4>
              <p class="mb-4">게시판의 모든 기능을 사용하기 위해서는 회원가입을 진행해주세요.</p>

              <form id="formAuthentication" class="mb-3" action="../register.do" method="POST" onsubmit = "return form_chk();">
                <div class="mb-3">
                  <label for="email" class="form-label">아이디</label>
                  <input
                    type="text"
                    class="form-control"
                    id="id"
                    name="id"
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
                  <label for="email" class="form-label">이름</label>
                  <input
                    type="text"
                    class="form-control"
                    id="name"
                    name="name"
                    placeholder="이름을 입력하세요."
                    autofocus
                  />
                </div>
                <div class="mb-3">
                  <label for="email" class="form-label">이메일</label>
                  <input
                    type="text"
                    class="form-control"
                    id="email"
                    name="email"
                    placeholder="이메일을 입력하세요."
                    autofocus
                  />
                </div>
                <div class="mb-3">
                  <label for="email" class="form-label">전화번호</label>
                  <input
                    type="text"
                    class="form-control"
                    id="phone"
                    name="phone"
                    placeholder="전화번호를 숫자만 입력하세요."
                    autofocus
                    oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                  />
                </div>
                
                <button class="btn btn-primary d-grid w-100">회원가입</button>
              </form>

              <p class="text-center">
                <span>이미 회원이신가요?</span>
                <a href="javascript:history.back();">
                  <span>로그인 하러 가기</span>
                </a>
              </p>
            </div>
          </div>
          <!-- Register Card -->
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
  		if (!document.getElementById("name").value) {
  			alert("이름을 입력해주세요!");
  			document.getElementById("name").focus();
  			return false;
  		}
  		if (!document.getElementById("email").value) {
  			alert("이메일을 입력해주세요!");
  			document.getElementById("email").focus();
  			return false;
  		}
  		if (!document.getElementById("phone").value) {
  			alert("전화번호를 입력해주세요!");
  			document.getElementById("phone").focus();
  			return false;
  		}
  		
  		// 이메일, 전화번호 형식 체크
  		var emailRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
  		var phoneRegex = /[0-9]{11}/;
  		
  		if (!document.getElementById("email").value.match(emailRegex)) {
  			alert("이메일 형식에 맞는 값을 입력해주세요!");
  			document.getElementById("email").focus();
  			return false;
  		}
  		if (!document.getElementById("phone").value.match(phoneRegex)) {
  			alert("전화번호 형식에 맞는 값을 입력해주세요!");
  			document.getElementById("phone").focus();
  			return false;
  		}
  		
  		return true;
  	}
  </script>
</html>