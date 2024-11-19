<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판 선택</title>
		
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
	
	    <!-- Helpers -->
	    <script src="../assets/vendor/js/helpers.js"></script>
	
	    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
	    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
	    <script src="../assets/js/config.js"></script>
	    
	    <style>
	    	#base { margin : auto; padding : 1em; }
	    	.card-header { text-align: center; }
	    </style>
	</head>
	
	<body>
		<div id = "base" class="container-xxl flex-grow-1 container-p-y">
			<div class="col-12">
	          <div class="card mb-4">
	            <h5 class="card-header">게시판 선택</h5>
	            <div class="card-body">
	            	<div class="d-grid gap-2 col-lg-6 mx-auto">
	            		<button type="button" class="btn btn-xl btn-primary" onclick = "location.href='../list.do?type=FREE'">자유 게시판</button>
			            <button type="button" class="btn btn-xl btn-primary" onclick = "location.href='../list.do?type=QNA'">Q&A 게시판</button>
			            <button type="button" class="btn btn-xl btn-primary" onclick = "location.href='../list.do?type=DATA'">자료실 게시판</button>
	            	</div>
	            </div>
	          </div>
	        </div>
	    </div>
        
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
</html>