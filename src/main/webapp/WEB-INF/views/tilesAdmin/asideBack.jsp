<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style>
.mypage-aside-con{
/*  	background-color: #fafafa; */
	background-color: #fafafa1f;
	width: 260px;
	padding: 30px;
}
.aside-name{
	font-size:24px;
	margin-bottom: 32px;
	text-align: center;
	padding: 4px;
}
.sub-title{
	font-size:22px;
}
.sub-title:hover{
	text-decoration: none;
}
.sub-inner{
	font-size:20px;
}

.mem-ul{
	margin-bottom: 16px;
}

.mem-ul li{
	padding: 4px 4px 2px 16px;  
}

.memActive{
 	color: #6d82f3; 
}

.ul-set {
	display: flex;
    flex-direction: column;
    gap: 24px;
}
.admin-a{
	display: inline-block;
	text-align: center;
	margin-left: 16px;
}
.span-pd{
	padding-right: 8px;

}
.ul-set ul li {
	display: flex;
    align-items: center;
    margin-top: 4px;
}
</style>
<div class="mypage-aside-con">
			<p class="aside-name">관리자설정</p>
		<div class="ul-set">
			<ul class="mem-ul">
				<span class="span-pd">
					<svg width="20" height="20" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
						<path d="M23.7 20.308a11.919 11.919 0 0 0-5.342-7.466 8 8 0 1 0-12.709 0 11.894 11.894 0 0 0-5.344 7.465 3.01 3.01 0 0 0 .582 2.561A2.977 2.977 0 0 0 3.23 24h17.54a2.977 2.977 0 0 0 2.343-1.132 3.008 3.008 0 0 0 .587-2.56ZM12 2a6 6 0 1 1-6 6 6.006 6.006 0 0 1 6-6Zm9.549 19.623a.982.982 0 0 1-.779.377H3.23a.982.982 0 0 1-.779-.377 1.026 1.026 0 0 1-.2-.87A9.9 9.9 0 0 1 7.1 14.306a7.949 7.949 0 0 0 9.813 0 9.925 9.925 0 0 1 4.838 6.45 1.024 1.024 0 0 1-.202.867Z" data-name="31. User" fill="#8d9ea5" class="fill-000000"></path>
					</svg>
				</span>
				<a href="#" class="sub-title">일반회원관리</a>
				<li>
					<svg width="24" heigh="20" viewBox="0 0 16 16" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 16 16">
						<path d="M15.375 7 10 2.54C9.695 2.287 9.461 2 9 2c-.625 0-1 .516-1 1v3H1c-.55 0-1 .45-1 1v2c0 .55.45 1 1 1h7v3c0 .484.375 1 1 1 .461 0 .695-.287 1-.54L15.375 9c.383-.312.625-.555.625-1s-.242-.687-.625-1z" fill="#8d9ea5" class="fill-000000"></path>
					</svg>
					<a href="/admin/adminMemberMyPage" class="sub-inner my-title admin-a">일반회원</a>
				</li>
			</ul>
			<ul class="mem-ul">
				<span class="span-pd">
					<svg width="20" height="20" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
						<path d="M23.7 20.308a11.919 11.919 0 0 0-5.342-7.466 8 8 0 1 0-12.709 0 11.894 11.894 0 0 0-5.344 7.465 3.01 3.01 0 0 0 .582 2.561A2.977 2.977 0 0 0 3.23 24h17.54a2.977 2.977 0 0 0 2.343-1.132 3.008 3.008 0 0 0 .587-2.56ZM12 2a6 6 0 1 1-6 6 6.006 6.006 0 0 1 6-6Zm9.549 19.623a.982.982 0 0 1-.779.377H3.23a.982.982 0 0 1-.779-.377 1.026 1.026 0 0 1-.2-.87A9.9 9.9 0 0 1 7.1 14.306a7.949 7.949 0 0 0 9.813 0 9.925 9.925 0 0 1 4.838 6.45 1.024 1.024 0 0 1-.202.867Z" data-name="31. User" fill="#8d9ea5" class="fill-000000"></path>
					</svg>
				</span>
				<a href="#" class="sub-title">상담사회원관리</a>
				<li>
					<svg width="24" heigh="20" viewBox="0 0 16 16" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 16 16">
						<path d="M15.375 7 10 2.54C9.695 2.287 9.461 2 9 2c-.625 0-1 .516-1 1v3H1c-.55 0-1 .45-1 1v2c0 .55.45 1 1 1h7v3c0 .484.375 1 1 1 .461 0 .695-.287 1-.54L15.375 9c.383-.312.625-.555.625-1s-.242-.687-.625-1z" fill="#8d9ea5" class="fill-000000"></path>
					</svg>
					<a href="#" class="sub-inner my-title admin-a">상담회원</a>
				</li>
				<li>
					<svg width="24" heigh="20" viewBox="0 0 16 16" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 16 16">
						<path d="M15.375 7 10 2.54C9.695 2.287 9.461 2 9 2c-.625 0-1 .516-1 1v3H1c-.55 0-1 .45-1 1v2c0 .55.45 1 1 1h7v3c0 .484.375 1 1 1 .461 0 .695-.287 1-.54L15.375 9c.383-.312.625-.555.625-1s-.242-.687-.625-1z" fill="#8d9ea5" class="fill-000000"></path>
					</svg>
					<a href="#" class="sub-inner my-title admin-a">승인요청</a>
				</li>
			</ul>	
			<ul class="mem-ul">
				<span class="span-pd">
					<svg width="20" height="20" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
						<path d="M23.7 20.308a11.919 11.919 0 0 0-5.342-7.466 8 8 0 1 0-12.709 0 11.894 11.894 0 0 0-5.344 7.465 3.01 3.01 0 0 0 .582 2.561A2.977 2.977 0 0 0 3.23 24h17.54a2.977 2.977 0 0 0 2.343-1.132 3.008 3.008 0 0 0 .587-2.56ZM12 2a6 6 0 1 1-6 6 6.006 6.006 0 0 1 6-6Zm9.549 19.623a.982.982 0 0 1-.779.377H3.23a.982.982 0 0 1-.779-.377 1.026 1.026 0 0 1-.2-.87A9.9 9.9 0 0 1 7.1 14.306a7.949 7.949 0 0 0 9.813 0 9.925 9.925 0 0 1 4.838 6.45 1.024 1.024 0 0 1-.202.867Z" data-name="31. User" fill="#8d9ea5" class="fill-000000"></path>
					</svg>
				</span>
				<a href="#" class="sub-title">기업회원관리</a>
				<li>
					<svg width="24" heigh="20" viewBox="0 0 16 16" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 16 16">
						<path d="M15.375 7 10 2.54C9.695 2.287 9.461 2 9 2c-.625 0-1 .516-1 1v3H1c-.55 0-1 .45-1 1v2c0 .55.45 1 1 1h7v3c0 .484.375 1 1 1 .461 0 .695-.287 1-.54L15.375 9c.383-.312.625-.555.625-1s-.242-.687-.625-1z" fill="#8d9ea5" class="fill-000000"></path>
					</svg>
					<a href="#" class="sub-inner my-title admin-a">기업회원</a>
				</li>
				<li>
					<svg width="24" heigh="20" viewBox="0 0 16 16" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 16 16">
						<path d="M15.375 7 10 2.54C9.695 2.287 9.461 2 9 2c-.625 0-1 .516-1 1v3H1c-.55 0-1 .45-1 1v2c0 .55.45 1 1 1h7v3c0 .484.375 1 1 1 .461 0 .695-.287 1-.54L15.375 9c.383-.312.625-.555.625-1s-.242-.687-.625-1z" fill="#8d9ea5" class="fill-000000"></path>
					</svg>
					<a href="#" class="sub-inner my-title admin-a">승인요청</a>
				</li>
				<li>
					<svg width="24" heigh="20" viewBox="0 0 16 16" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 16 16">
						<path d="M15.375 7 10 2.54C9.695 2.287 9.461 2 9 2c-.625 0-1 .516-1 1v3H1c-.55 0-1 .45-1 1v2c0 .55.45 1 1 1h7v3c0 .484.375 1 1 1 .461 0 .695-.287 1-.54L15.375 9c.383-.312.625-.555.625-1s-.242-.687-.625-1z" fill="#8d9ea5" class="fill-000000"></path>
					</svg>
					<a href="#" class="sub-inner my-title admin-a">채용공고</a>
				</li>
			</ul>
			<ul class="mem-ul">
				<span class="span-pd">
					<svg width="20" height="20" viewBox="0 0 48 48" xml:space="preserve" xmlns="http://www.w3.org/2000/svg">
						<path d="M27.75 9.652V1.304h-7.37v8.348h-5.135l9.033 9.522 8.608-9.522zM24.978 26.805v19.89H40.75V26.805H24.979zM7.25 26.805v19.89h15.771V26.805H7.25zM40.714 24.326 48 16.129H32.151l-7.173 8.198.001-.001zM0 16.129l7.286 8.197H23.022l-7.173-8.197z" fill="#8d9ea5" class="fill-000000"></path>
					</svg>
				</span>
				<a href="#" class="sub-title">상품관리</a>
				<li>
					<svg width="24" heigh="20" viewBox="0 0 16 16" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 16 16">
						<path d="M15.375 7 10 2.54C9.695 2.287 9.461 2 9 2c-.625 0-1 .516-1 1v3H1c-.55 0-1 .45-1 1v2c0 .55.45 1 1 1h7v3c0 .484.375 1 1 1 .461 0 .695-.287 1-.54L15.375 9c.383-.312.625-.555.625-1s-.242-.687-.625-1z" fill="#8d9ea5" class="fill-000000"></path>
					</svg>
					<a href="#" class="sub-inner my-title admin-a">기업상품</a>
				</li>
				<li>
					<svg width="24" heigh="20" viewBox="0 0 16 16" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 16 16">
						<path d="M15.375 7 10 2.54C9.695 2.287 9.461 2 9 2c-.625 0-1 .516-1 1v3H1c-.55 0-1 .45-1 1v2c0 .55.45 1 1 1h7v3c0 .484.375 1 1 1 .461 0 .695-.287 1-.54L15.375 9c.383-.312.625-.555.625-1s-.242-.687-.625-1z" fill="#8d9ea5" class="fill-000000"></path>
					</svg>
					<a href="#" class="sub-inner my-title admin-a">상담상품</a>
				</li>
			</ul>		
			<ul class="mem-ul">
				<span class="span-pd">
				<svg width="20" height="20" viewBox="0 0 846.66 846.66" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" image-rendering="optimizeQuality" fill-rule="evenodd" clip-rule="evenodd">
					<path d="M31.17 74.04h784.32c11.39 0 20.63 9.24 20.63 20.63v657.32c0 11.39-9.24 20.63-20.63 20.63H31.17c-11.39 0-20.63-9.24-20.63-20.63V94.67c0-11.39 9.24-20.63 20.63-20.63zm277.48 445.64c-27.13 0-27.13-41.26 0-41.26h76.34c27.14 0 27.14 41.26 0 41.26h-76.34zm0 82.53c-27.13 0-27.13-41.27 0-41.27h76.34c27.14 0 27.14 41.27 0 41.27h-76.34zm0 82.52c-27.13 0-27.13-41.26 0-41.26h76.34c27.14 0 27.14 41.26 0 41.26h-76.34zM147.73 519.68c-27.14 0-27.14-41.26 0-41.26h76.33c27.14 0 27.14 41.26 0 41.26h-76.33zm0 82.53c-27.14 0-27.14-41.27 0-41.27h76.33c27.14 0 27.14 41.27 0 41.27h-76.33zm0 82.52c-27.14 0-27.14-41.26 0-41.26h76.33c27.14 0 27.14 41.26 0 41.26h-76.33zm258.71-516.76c8.9-1.35 17.96 3.3 21.84 11.9l18.51 40.93c11.13 24.7-26.43 41.62-37.56 16.92l-2.7-5.98-80.14 127.89c-6.5 12.24-23.23 14.77-33.01 4.61l-59.52-62.12-39.72 100.92c-9.85 25.23-48.21 10.24-38.36-14.99l51.51-130.88c5.67-14.5 24.63-17.54 34.66-6.09l62.88 65.63 63.39-101.16-5.53.86c-26.82 4.02-32.94-36.76-6.12-40.78l49.87-7.66zm171.57 196.02c0-27.14 41.27-27.14 41.27 0v9.09h39.33c27.13 0 27.13 41.26 0 41.26h-39.33v48.94h9.6c36.2 0 65.73 29.53 65.73 65.73 0 36.19-29.53 65.72-65.73 65.72h-9.6v9.1c0 27.13-41.27 27.13-41.27 0v-9.1h-39.32c-27.14 0-27.14-41.26 0-41.26h39.32v-48.93h-9.6c-36.19 0-65.73-29.54-65.73-65.73 0-36.2 29.53-65.73 65.73-65.73h9.6v-9.09zm41.27 140.55v48.93h9.6c13.42 0 24.47-11.05 24.47-24.46s-11.06-24.47-24.47-24.47h-9.6zm-41.27-41.26v-48.94h-9.6c-13.41 0-24.47 11.06-24.47 24.47 0 13.41 11.06 24.47 24.47 24.47h9.6zM794.86 115.3H51.8v616.06h743.06V115.3z" fill="#8d9ea5" fill-rule="nonzero" class="fill-000000"></path>
				</svg>
				</span>
				<a href="#" class="sub-title">통계</a>
				<li>
					<svg width="24" heigh="20" viewBox="0 0 16 16" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 16 16">
						<path d="M15.375 7 10 2.54C9.695 2.287 9.461 2 9 2c-.625 0-1 .516-1 1v3H1c-.55 0-1 .45-1 1v2c0 .55.45 1 1 1h7v3c0 .484.375 1 1 1 .461 0 .695-.287 1-.54L15.375 9c.383-.312.625-.555.625-1s-.242-.687-.625-1z" fill="#8d9ea5" class="fill-000000"></path>
					</svg>
					<a href="#" class="sub-inner my-title admin-a">기업</a>
				</li>
				<li>
					<svg width="24" heigh="20" viewBox="0 0 16 16" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 16 16">
						<path d="M15.375 7 10 2.54C9.695 2.287 9.461 2 9 2c-.625 0-1 .516-1 1v3H1c-.55 0-1 .45-1 1v2c0 .55.45 1 1 1h7v3c0 .484.375 1 1 1 .461 0 .695-.287 1-.54L15.375 9c.383-.312.625-.555.625-1s-.242-.687-.625-1z" fill="#8d9ea5" class="fill-000000"></path>
					</svg>
					<a href="#" class="sub-inner my-title admin-a">상담사</a>
				</li>
				
				<li>
					<svg width="25" heigh="20" viewBox="0 0 16 16" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 16 16">
						<path d="M15.375 7 10 2.54C9.695 2.287 9.461 2 9 2c-.625 0-1 .516-1 1v3H1c-.55 0-1 .45-1 1v2c0 .55.45 1 1 1h7v3c0 .484.375 1 1 1 .461 0 .695-.287 1-.54L15.375 9c.383-.312.625-.555.625-1s-.242-.687-.625-1z" fill="#8d9ea5" class="fill-000000"></path>
					</svg>
					<a href="#" class="sub-inner my-title admin-a">총 매출</a>
				</li>
			</ul>	
			<ul class="mem-ul">
				<span class="span-pd">
				<svg width="20" height="20" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><g data-name="Layer 2">
					<path d="M21 16h-1v-6a8 8 0 0 0-16 0v6H3a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1h18a1 1 0 0 0 1-1v-4a1 1 0 0 0-1-1ZM6 10a6 6 0 0 1 12 0v6H6Zm14 10H4v-2h16Z" fill="#8d9ea5" class="fill-000000"></path>
					<path d="M8 10h2a2 2 0 0 1 2-2V6a4 4 0 0 0-4 4Z" fill="#8d9ea5" class="fill-000000"></path></g>
				</svg>
				</span>
				<a href="#" class="sub-title">신고관리</a>
				<li>
					<svg width="24" heigh="20" viewBox="0 0 16 16" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 16 16">
						<path d="M15.375 7 10 2.54C9.695 2.287 9.461 2 9 2c-.625 0-1 .516-1 1v3H1c-.55 0-1 .45-1 1v2c0 .55.45 1 1 1h7v3c0 .484.375 1 1 1 .461 0 .695-.287 1-.54L15.375 9c.383-.312.625-.555.625-1s-.242-.687-.625-1z" fill="#8d9ea5" class="fill-000000"></path>
					</svg>
					<a href="#" class="sub-inner my-title admin-a">신고목록</a>
				</li>
				<li>
					<svg width="24" heigh="20" viewBox="0 0 16 16" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 16 16">
						<path d="M15.375 7 10 2.54C9.695 2.287 9.461 2 9 2c-.625 0-1 .516-1 1v3H1c-.55 0-1 .45-1 1v2c0 .55.45 1 1 1h7v3c0 .484.375 1 1 1 .461 0 .695-.287 1-.54L15.375 9c.383-.312.625-.555.625-1s-.242-.687-.625-1z" fill="#8d9ea5" class="fill-000000"></path>
					</svg>
					<a href="#" class="sub-inner my-title admin-a">블랙리스트관리</a>
				</li>
			</ul>	
			
			<ul class="mem-ul">
				<span class="span-pd">
				<svg width="20" height="20" viewBox="0 0 128 128" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 128 128">
					<path d="m36.866 54.009-19.149 2.59A2.965 2.965 0 0 0 15.938 56c-1.654 0-3 1.346-3 3a2.99 2.99 0 0 0 1.531 2.6l3.542 23.549a1 1 0 0 0 1.124.842l22-3a.999.999 0 0 0 .854-1.138l-4-27a1.003 1.003 0 0 0-1.123-.844zM15.938 58a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm3.904 25.876-3.299-21.938A3.005 3.005 0 0 0 18.937 59c0-.185-.022-.365-.055-.54l17.272-2.337 3.707 25.022-20.019 2.731zM70 40c-.669 0-1.281.227-1.78.599l-19.149-2.59a1.003 1.003 0 0 0-1.123.845l-4 27a1.002 1.002 0 0 0 .854 1.138l22 3a1 1 0 0 0 1.124-.844L71.468 45.6A2.987 2.987 0 0 0 73 43c0-1.654-1.346-3-3-3zm1 3a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm-4.904 24.876-20.021-2.73 3.707-25.022 17.272 2.337A2.985 2.985 0 0 0 67 43a3.004 3.004 0 0 0 2.394 2.938l-3.298 21.938z" fill="#8d9ea5" class="fill-000000"></path>
					<path d="M127 22a.996.996 0 0 0-1-1H2a.996.996 0 0 0-1 1v84a.996.996 0 0 0 1 1h124a.996.996 0 0 0 1-1V22zM8 28h112v72H8V28zm112.586-2H7.414l-3-3h119.172l-3 3zM6 27.414v73.172l-3 3V24.414l3 3zM7.414 102h113.172l3 3H4.414l3-3zM122 100.586V27.414l3-3v79.172l-3-3z" fill="#8d9ea5" class="fill-000000"></path>
					<path d="M114 34c-.883 0-1.67.391-2.22 1H81.22A2.983 2.983 0 0 0 79 34c-1.654 0-3 1.346-3 3 0 .883.391 1.67 1 2.22V88a1 1 0 0 0 1 1h37a1 1 0 0 0 1-1V39.22c.609-.549 1-1.337 1-2.22 0-1.654-1.346-3-3-3zm0 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-35 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm35 51H79V40c1.654 0 3-1.346 3-3h29c0 1.654 1.346 3 3 3v47z" fill="#8d9ea5" class="fill-000000"></path>
					<path d="M111 47H82a1 1 0 1 0 0 2h29a1 1 0 1 0 0-2zM111 52H82a1 1 0 1 0 0 2h29a1 1 0 1 0 0-2zM111 57H82a1 1 0 1 0 0 2h29a1 1 0 1 0 0-2zM111 62H82a1 1 0 1 0 0 2h29a1 1 0 1 0 0-2zM111 67H82a1 1 0 1 0 0 2h29a1 1 0 1 0 0-2zM111 72H82a1 1 0 1 0 0 2h29a1 1 0 1 0 0-2z" fill="#8d9ea5" class="fill-000000"></path>
				</svg>
				</span>
				<a href="#" class="sub-title">게시판관리</a>
				<li>
					<svg width="24" heigh="20" viewBox="0 0 16 16" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 16 16">
						<path d="M15.375 7 10 2.54C9.695 2.287 9.461 2 9 2c-.625 0-1 .516-1 1v3H1c-.55 0-1 .45-1 1v2c0 .55.45 1 1 1h7v3c0 .484.375 1 1 1 .461 0 .695-.287 1-.54L15.375 9c.383-.312.625-.555.625-1s-.242-.687-.625-1z" fill="#8d9ea5" class="fill-000000"></path>
					</svg>
					<a href="#" class="sub-inner my-title admin-a">공지사항</a>
				</li>
				<li>
					<svg width="24" heigh="20" viewBox="0 0 16 16" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 16 16">
						<path d="M15.375 7 10 2.54C9.695 2.287 9.461 2 9 2c-.625 0-1 .516-1 1v3H1c-.55 0-1 .45-1 1v2c0 .55.45 1 1 1h7v3c0 .484.375 1 1 1 .461 0 .695-.287 1-.54L15.375 9c.383-.312.625-.555.625-1s-.242-.687-.625-1z" fill="#8d9ea5" class="fill-000000"></path>
					</svg>
					<a href="#" class="sub-inner my-title admin-a">1 : 1문의</a>
				</li>
				<li>
					<svg width="24" heigh="20" viewBox="0 0 16 16" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 16 16">
						<path d="M15.375 7 10 2.54C9.695 2.287 9.461 2 9 2c-.625 0-1 .516-1 1v3H1c-.55 0-1 .45-1 1v2c0 .55.45 1 1 1h7v3c0 .484.375 1 1 1 .461 0 .695-.287 1-.54L15.375 9c.383-.312.625-.555.625-1s-.242-.687-.625-1z" fill="#8d9ea5" class="fill-000000"></path>
					</svg>
					<a href="#" class="sub-inner my-title admin-a">취업Q&A</a>
				</li>
				<li>
					<svg width="24" heigh="20" viewBox="0 0 16 16" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 16 16">
						<path d="M15.375 7 10 2.54C9.695 2.287 9.461 2 9 2c-.625 0-1 .516-1 1v3H1c-.55 0-1 .45-1 1v2c0 .55.45 1 1 1h7v3c0 .484.375 1 1 1 .461 0 .695-.287 1-.54L15.375 9c.383-.312.625-.555.625-1s-.242-.687-.625-1z" fill="#8d9ea5" class="fill-000000"></path>
					</svg>
					<a href="#" class="sub-inner my-title admin-a">커리어성장</a>
				</li>
			</ul>	
		</div>
	
</div>
 <script src="/resources/js/jquery-3.6.3.min.js"></script>
 
<script>
$(document).ready(function(){
	

	console.log("ㅎㅇㅎㅇ");
	
	$('.mem-ul li').hide();
	$(".sub-title").click(function(e){
		 e.preventDefault();
		 var $this = $(this);
		 
		 // 클릭된 요소에 글꼴 굵기 추가
		 $this.css('font-weight', 'bold');
		    
		    // 나머지 요소의 글꼴 굵기 제거
		 $(".sub-title").not($this).css('font-weight', 'normal');
		 
		 
         var $parent = $this.closest('ul');
         
         $('.mem-ul').not($parent).find('li').hide();
         
         $this.nextAll('li').toggle();
         $(this).siblings().removeClass('memActive');
         
	});

	$(".my-title").click(function(e){
        e.preventDefault();
        var $this = $(this);
        
    	// 클릭한 요소에 글꼴 굵기 추가
        $this.css('font-weight', 'bold');
        
        // 나머지 요소의 글꼴 굵기 제거
        $(".my-title").not($this).css('font-weight', 'normal');
        
        $this.addClass('memActive');
        
        $(".my-title").not($this).removeClass('memActive');
        
        $('svg path').attr('fill', '#8d9ea5');
        
        var blacklistPath = $this.prev('svg').find('path'); // SVG의 path 요소 찾기
        blacklistPath.attr('fill', '#6d82f3'); // 색상 변경
    });
	
	
});


</script>
