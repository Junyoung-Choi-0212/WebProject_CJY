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
            
			<form id = "search" method = "get" style = "width: 100%;">
	            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse" style = "width: 100%;">
	              <!-- Search -->
	              <div class="navbar-nav align-items-center" style = "width: 100%;">
	                <div class="nav-item d-flex align-items-center" style = "width: 100%;">
	                	<c:if test = "${ type eq 'FREE' }">
				    		<input type = "hidden" name = "type" value = "FREE"/>
				    	</c:if>
				    	<c:if test = "${ type eq 'QNA' }">
				    		<input type = "hidden" name = "type" value = "QNA"/>
				    	</c:if>
				    	<c:if test = "${ type eq 'DATA' }">
				    		<input type = "hidden" name = "type" value = "DATA"/>
				    	</c:if>
		                <select name="searchField" style = "width: 7%; margin: 0 1em 0 0.5em; border: 1px solid blue; border-radius: 10%;">
			                <option value="title">제목</option>
			                <option value="content">내용</option>
			                <option value="authorname">작성자</option>
			            </select>
	                  	<i class="bx bx-search fs-4 lh-0"></i>
	                  	<input
	                    type="text"
	                    class="form-control border-0 shadow-none"
	                    placeholder="검색어 입력..."
	                    aria-label="검색어 입력..."
	                    name="searchWord"
	                    style = "width: 75%;"
	                  	/>
	                  	<button type="submit" class="btn btn-l btn-primary" form = "search">검색</button>
	                </div>
	              </div>
	              
	              <!-- /Search -->
	
	              <ul class="navbar-nav flex-row align-items-center ms-auto" style = "float: right;">
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
            </form>
          </nav>
          <!-- / Navbar -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <!-- Bootstrap Dark Table -->
              <div class="card">
                <h5 class="card-header" style = "text-align: center;">
                	<c:if test = "${ type eq 'FREE' }">
                		자유
                	</c:if>
                	<c:if test = "${ type eq 'QNA' }">
                		Q&amp;A
                	</c:if>
                	<c:if test = "${ type eq 'DATA' }">
                		자료실
                	</c:if>
                	 게시판
                </h5>
                <div class="table-responsive text-nowrap">
                  <table class="table table-dark">
                    <thead>
                      <tr>
                        <th width="5%" style = "text-align: center;">번호</th>
			            <th width="*" style = "text-align: center;">제목</th>
			            <th width="10%" style = "text-align: center;">작성자</th>
			            <th width="10%" style = "text-align: center;">조회수</th>
			            <th width="15%" style = "text-align: center;">작성일</th>
			            <th width="5%" style = "text-align: center;">삭제</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                    	<c:choose>
                    		<c:when test = "${ empty list }">
                    			<tr>
						            <td colspan="6" align="center">
						                등록된 게시물이 없습니다^^*
						            </td>
						        </tr>
                    		</c:when>
                    		<c:otherwise>
                    			<c:forEach items = "${ list }" var = "row" varStatus = "loop">
                    				<tr align = "center">
	                    				<td style = "text-align: center;">${ map.totalCount - (((map.pageNum - 1) * map.pageSize) + loop.index) }</td>
	                    				<td  style = "text-align: center;">
	                    					<c:if test = "${ type eq 'FREE' }">
									    		<a href = "${pageContext.request.contextPath}/view.do?type=FREE&idx=${ row.idx }"><strong>${ row.title }</strong></a>
									    	</c:if>
									    	<c:if test = "${ type eq 'QNA' }">
									    		<a href = "${pageContext.request.contextPath}/view.do?type=QNA&idx=${ row.idx }"><strong>${ row.title }</strong></a>
									    	</c:if>
									    	<c:if test = "${ type eq 'DATA' }">
									    		<a href = "${pageContext.request.contextPath}/view.do?type=DATA&idx=${ row.idx }"><strong>${ row.title }</strong></a>
									    	</c:if>
							            </td> 
							            <td style = "text-align: center;">
							            	<ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center" style = "display: flex; justify-content: center;">
							            		<li
					                              data-bs-toggle="tooltip"
					                              data-popup="tooltip-custom"
					                              data-bs-placement="top"
					                              class="avatar avatar-xs pull-up"
					                              title="${ row.authorname }"
					                            >
					                              <img src="${pageContext.request.contextPath}/assets/img/avatars/default.png" alt="Avatar" class="rounded-circle" />
					                            </li>
							            	</ul>
							            </td>
							            <td style = "text-align: center;">${ row.visitcount }</td>
							            <td style = "text-align: center;">${ row.postdate }</td>
							            <c:choose>
							            	<c:when test = "${ row.authorid eq sessionScope.UserId }">
								            	<td 
								            		style = "text-align: center;"
								            		onclick = "if(confirm('정말로 글을 삭제하시겠습니까?\n해당 작업은 복구 불가능합니다!')) { location.href='${pageContext.request.contextPath}/delete.do?type=${ type }&idx=${ row.idx }' } else { alert('삭제를 취소하셨습니다.'); }"
								            	>
								            		<span class="badge bg-label-danger me-1">삭제하기</span>
								            	</td>
								            </c:when>
								            <c:otherwise>
								            	<td></td>
								            </c:otherwise>
							            </c:choose>
	                    			</tr>
                    			</c:forEach>
                    		</c:otherwise>
                    	</c:choose>
                    </tbody>
                  </table>
                  
                  <table class="table table-dark" width="100%">
			        <tr align="center">
			            <td> ${ map.pagingImg } </td>
			            <td width="100">
			            	<c:if test = "${ type eq 'FREE' }">
					    		<button type="button" class="btn btn-l btn-primary" onclick="location.href='${pageContext.request.contextPath}/write.do?type=FREE';">글쓰기</button>
					    	</c:if>
					    	<c:if test = "${ type eq 'QNA' }">
					    		<button type="button" class="btn btn-l btn-primary" onclick="location.href='${pageContext.request.contextPath}/write.do?type=QNA';">글쓰기</button>
					    	</c:if>
					    	<c:if test = "${ type eq 'DATA' }">
					    		<button type="button" class="btn btn-l btn-primary" onclick="location.href='${pageContext.request.contextPath}/write.do?type=DATA';">글쓰기</button>
					    	</c:if>
			            </td>
			        </tr>
			      </table>
                </div>
              </div>
              <!--/ Bootstrap Dark Table -->
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

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>