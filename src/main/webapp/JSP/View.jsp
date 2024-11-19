<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

    <title>
    	<c:if test = "${ type eq 'FREE' }">
    		자유 게시판
    	</c:if>
    	<c:if test = "${ type eq 'QNA' }">
    		Q&amp;A 게시판
    	</c:if>
    	<c:if test = "${ type eq 'DATA' }">
    		자료실 게시판
    	</c:if>
    </title>

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
              <a href="${pageContext.request.contextPath}/list.do?type=FREE" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Elements">자유 게시판</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/list.do?type=QNA" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Elements">Q&amp;A 게시판</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/list.do?type=DATA" class="menu-link">
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
		                    <a class="dropdown-item" href="${pageContext.request.contextPath}/JSP/Login.jsp">
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
              <h4 class="fw-bold py-3 mb-4">
              	<span class="text-muted fw-light">
              		<c:if test = "${ type eq 'FREE' }">
			    		자유 게시판
			    	</c:if>
			    	<c:if test = "${ type eq 'QNA' }">
			    		Q&amp;A 게시판
			    	</c:if>
			    	<c:if test = "${ type eq 'DATA' }">
			    		자료실 게시판
			    	</c:if>
              		/
              	</span> ${ dto.title }
              </h4>

              <div class="row" style = "display: flex; justify-content: center;">
                <!-- Form controls -->
                <div class="col-md-6">
                  <div class="card mb-4">
                    <div class="card-body">
                    	<form name = "listInfo" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/edit.do" onsubmit="return validateForm(this);">
	                     	<input type="hidden" name="idx" value="${ dto.idx }"/>
							<input type="hidden" name="authorid" value="${ dto.authorid }"/>
							<input type="hidden" name="prevOfile" value="${ dto.ofile }" />
							<input type="hidden" name="prevSfile" value="${ dto.sfile }" />
							<input type="hidden" name="type" value="${ dto.listtype }" />
                      <div class="mb-3" style = "display: flex; justify-content: space-between;">
                      	<span>작성자 : ${ dto.authorname }</span>
                        <span>작성일 : ${ dto.postdate }</span>
                        <span>조회수 : ${ dto.visitcount }</span>
                      </div>
                      <div>
                      	<label class = "form-label" for = "title" style = "width: 100%; text-align: center; font-size: 16px;">제목</label>
                      	<input class="form-control" id = "title" name = "title" type = "text" value = "${ dto.title }" <c:if test = "${ dto.authorid ne sessionScope.UserId }">readonly</c:if> />
                      </div>
                      <div style = "margin-top: 2em;">
                      	<label class = "form-label" for = "content" style = "width: 100%; text-align: center; font-size: 16px;">내용</label>
                        <textarea class="form-control" id="content" name = "content" <c:if test = "${ dto.authorid ne sessionScope.UserId }">readonly</c:if>>${ dto.content }</textarea>
                        <c:if test = "${ not empty dto.ofile and (isImage eq true or not empty mimeType) }">
			        		<div style="text-align: center;">
				        		<c:choose>
				        			<c:when test = "${ mimeType eq 'img' }">
				        				<img src = "${pageContext.request.contextPath}/Uploads/${ dto.sfile }" style = "max-width : 70%;" />
				        			</c:when>
				        			<c:when test = "${ mimeType eq 'audio' }">
				        				<audio controls = "controls">
				        					<source src = "${pageContext.request.contextPath}/Uploads/${ dto.sfile }" type = "audio/mp3" />
				        				</audio>
				        			</c:when>
				        			<c:when test = "${ mimeType eq 'video' }">
				        				<video controls>
				        					<source src = "${pageContext.request.contextPath}/Uploads/${ dto.sfile }" type = "video/mp4" />
				        					Your browser does not support the video tag.
				        				</video>
				        			</c:when>
				        		</c:choose>
				        		<c:if test = "${ dto.authorid eq sessionScope.UserId }">
					        		<div>
					        		  <div class="input-group">
				                        <input type="file" class="form-control" id="ofile" name = "ofile" />
				                        <label class="input-group-text" for="ofile">파일 업로드</label>
				                      </div>
					        		</div>
				        		</c:if>
				        		<div style = "margin-top: 2em;">
				        			<p>첨부파일 다운로드 수 : ${ dto.downcount }</p>
				        			<button class="btn btn-l btn-primary" type="button">다운로드</button>
				        		</div>
			        		</div>
			        	</c:if>
                      </div>
                      <div style = "text-align: center; margin-top: 2em; display: flex; justify-content: space-between;">
				        <button class="btn btn-l btn-primary" type="button" onclick="toList('<%=request.getParameter("type")%>')">
				            목록 바로가기
				        </button>
				        <c:if test = "${ dto.authorid eq sessionScope.UserId }">
				        	<button class="btn btn-l btn-primary" type="submit">수정하기</button>
				        </c:if>
                      </div>
                      </form>
                    </div>
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
  
  <script>
	  function validateForm(form) {  // 필수 항목 입력 확인
	      if (form.title.value == "") {
	          alert("제목을 입력하세요.");
	          form.title.focus();
	          return false;
	      }
	      if (form.content.value == "") {
	          alert("내용을 입력하세요.");
	          form.content.focus();
	          return false;
	      }
	  }
  
  	function toList(type) { location.href= '${pageContext.request.contextPath}/list.do?type=' + type; }
  </script>
</html>