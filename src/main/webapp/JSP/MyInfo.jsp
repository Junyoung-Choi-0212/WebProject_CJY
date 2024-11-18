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
  class="light-style layout-menu-fixed"
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

    <title>내 정보</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->
        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <ul class="menu-inner py-1">
            <li class="menu-header small text-uppercase">
            	<span class="menu-header-text">내 정보</span>
            </li>
            
            <li class="menu-item">
            	<a href = "${pageContext.request.contextPath}/myinfo.do" class = "menu-link">
            		<i class="menu-icon tf-icons bx bx-file"></i>
                	<div data-i18n="Documentation">내 정보</div>
            	</a>
            </li>
            
            <li class="menu-header small text-uppercase">
              <span class="menu-header-text">게시판</span>
            </li>
            
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/JSP/FreeList.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Elements">자유 게시판</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/JSP/QnAList.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Elements">Q&amp;A 게시판</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/JSP/DataList.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Elements">자료실 게시판</div>
              </a>
            </li>
          </ul>
        </aside>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->

          <nav
            class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
            id="layout-navbar"
          >
            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
              <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                <i class="bx bx-menu bx-sm"></i>
              </a>
            </div>

            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
              <ul class="navbar-nav flex-row align-items-center ms-auto">
                <!-- User -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                      <img src="${pageContext.request.contextPath}/assets/img/avatars/default.png" alt class="w-px-40 h-auto rounded-circle" />
                    </div>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                      <a class="dropdown-item" href="#">
                        <div class="d-flex">
                           <div class="flex-shrink-0 me-3">
                            <div class="avatar avatar-online">
                              <img src="${pageContext.request.contextPath}/assets/img/avatars/default.png" alt class="w-px-40 h-auto rounded-circle" />
                            </div>
                          </div> 
                          <% if (session.getAttribute("UserId") == null) { %>
							 <div class="flex-grow-1">
	                           <span class="fw-semibold d-block">Guest</span>
	                         </div>
                          <% } else { %>
	                          <div class="flex-grow-1">
	                            <span class="fw-semibold d-block"><%= session.getAttribute("UserName") %></span>
	                            <small class="text-muted"><%= session.getAttribute("UserEmail") %></small>
	                          </div>
                          <% } %>
                        </div>
                      </a>
                    </li>
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                    <li>
                      <% if (session.getAttribute("UserId") == null) { %>
                    		  <div class="dropdown-item" onclick = "alert('해당 기능은 로그인 이후 사용 가능합니다.');">
		                        <i class="bx bx-user me-2"></i>
		                        <span class="align-middle">내 정보</span>
		                      </div>
                    	<% } else { %>
		                      <a class="dropdown-item" href="${pageContext.request.contextPath}/myinfo.do">
		                        <i class="bx bx-user me-2"></i>
		                        <span class="align-middle">내 정보</span>
		                      </a>
                      	<% } %>
                    </li>
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                    <li>
                    	<% if (session.getAttribute("UserId") == null) { %>
		                    <a class="dropdown-item" href="Login.jsp">
		                        <i class="bx bx-power-off me-2"></i>
		                        <span class="align-middle">로그인</span>
		                    </a>
                      	<% } else { %>
                      		<a class="dropdown-item" href="${pageContext.request.contextPath}/JSP/Logout.jsp">
		                        <i class="bx bx-power-off me-2"></i>
		                        <span class="align-middle">로그아웃</span>
		                    </a>
                      	<% } %>
                    </li>
                  </ul>
                </li>
                <!--/ User -->
              </ul>
            </div>
          </nav>

          <!-- / Navbar -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">내 정보 /</span> 회원 정보 조회 및 수정</h4>

              <div class="row" style = "display: flex; justify-content: center;">
                <div class="col-md-6">
                  <div class="card mb-4">
                    <h5 class="card-header">회원 정보</h5>
                    <div class="card-body">
                    	<form id = "info" method = "post" action = "${pageContext.request.contextPath}/myinfo.do" onsubmit = "return form_chk();">
                    		<input type = "hidden" id = "idx" name = "idx" value = "${ user.idx }"/>
                    		<div class="mb-3">
		                        <label for="id" class="form-label">아이디</label>
		                        <input
		                          class="form-control"
		                          type="text"
		                          id="id"
		                          name = "id"
		                          value = "${ user.id }"
		                          readonly
		                        />
		                      </div>
	                      <div class = "form-password-toggle">
	                      	<label for="password" class="form-label">비밀번호</label>
			                  <div class="input-group">
		                          <input
		                            type="password"
		                            class="form-control"
		                            id="password"
		                            name = "password"
		                            placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
		                            value = "${ user.password }"
		                            aria-describedby="basic-default-password2"
		                          />
		                          <span id="basic-default-password2" class="input-group-text cursor-pointer"
		                            ><i class="bx bx-hide"></i
		                          ></span>
		                      </div>
	                      </div>
	                      <div>
	                        <label for="name" class="form-label">이름</label>
	                        <input
	                          type="text"
	                          class="form-control"
	                          id="name"
	                          name="name"
	                          aria-describedby="defaultFormControlHelp"
	                          value = "${ user.name }"
	                        />
	                      </div>
	                      <div class="mb-3">
			                  <label for="email" class="form-label">이메일</label>
			                  <input
			                    type="text"
			                    class="form-control"
			                    id="email"
			                    name="email"
			                    value = "${ user.email }"
			                  />
			                </div>
			              <div class="mb-3">
			                  <label for="email" class="form-label">전화번호</label>
			                  <input
			                    type="text"
			                    class="form-control"
			                    id="phone"
			                    name="phone"
			                    value = "${ user.phone }"
			                    oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
			                  />
			                </div>
			                <div class = "mb-3">
			                	<button style = "width: 100%; margin-top : 1.6em;" type="submit" class="btn btn-xl btn-primary" form ="info">정보 수정</button>
			                </div>
                    	</form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- / Content -->

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="${pageContext.request.contextPath}/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/libs/popper/popper.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="${pageContext.request.contextPath}/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

    <!-- Page JS -->

    <script src="${pageContext.request.contextPath}/assets/js/form-basic-inputs.js"></script>

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
  			alert("이메일을 입력해주세요!");
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
  		
  		alert("회원 정보 수정이 완료되었습니다!");
  		
  		return true;
  	}
  </script>
</html>