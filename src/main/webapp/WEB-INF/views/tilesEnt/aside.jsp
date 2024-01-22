<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="mypage-aside-con">
	<div class="mem-ul-set">
		<ul class="mem-ul">
			<span>
				<svg width="20" height="20" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><g stroke-width="1.04125">
					<path d="M91.5 41.414v1.795h-3.135v2.047h-1.668v6.371h-1.482v-2.016h-1v2.016h-2.319v10.959h20.208V51.627h-2.385v-2.016h-1v2.016h-1.543v-6.371H95.38v-2.047H92.5v-1.795zm-2.135 2.795h5.016v1.047h-5.016zm-1.668 2.049h8.477v15.326h-2.36v-3.715H90.06v3.715h-2.36v-9.957h-.002zm-4.8 6.37h3.8v8.956h-3.8zm14.279 0h3.928v8.956h-3.928zm-6.115 6.243h1.751v2.713h-1.751z" style="line-height:normal;font-variant-ligatures:normal;font-variant-position:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-alternates:normal;font-variant-east-asian:normal;font-feature-settings:normal;font-variation-settings:normal;text-indent:0;text-align:start;text-decoration-line:none;text-decoration-style:solid;text-decoration-color:#000;text-transform:none;text-orientation:mixed;white-space:normal;shape-padding:0;shape-margin:0;inline-size:0;isolation:auto;mix-blend-mode:normal;solid-color:#000;solid-opacity:1" transform="matrix(1 0 0 1 -80 -40)" color="#000000" font-style="normal" font-variant="normal" font-weight="400" font-stretch="normal" font-size="medium" font-family="sans-serif" text-decoration="none" letter-spacing="normal" word-spacing="normal" writing-mode="lr-tb" direction="ltr" dominant-baseline="auto" baseline-shift="baseline" text-anchor="start" clip-rule="nonzero" display="inline" overflow="visible" visibility="visible" opacity="1" color-interpolation="sRGB" color-interpolation-filters="linearRGB" vector-effect="none" fill="#444444" fill-opacity="1" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="square" stroke-linejoin="miter" stroke-miterlimit="4" stroke-dasharray="none" stroke-dashoffset="0" stroke-opacity="1" paint-order="stroke fill markers" color-rendering="auto" image-rendering="auto" shape-rendering="auto" text-rendering="auto" enable-background="accumulate" stop-color="#444444" stop-opacity="1" class="fill-000000 stop-color-000000"></path><path d="M10.479 6.979v3.173h5.042V6.98H10.48zM11.52 8.02h2.958v1.09H11.52v-1.09zM10.479 11.848v3.173h5.042v-3.173H10.48zm1.042 1.04h2.958v1.09H11.52v-1.09z" style="line-height:normal;font-variant-ligatures:normal;font-variant-position:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-alternates:normal;font-variant-east-asian:normal;font-feature-settings:normal;font-variation-settings:normal;text-indent:0;text-align:start;text-decoration-line:none;text-decoration-style:solid;text-decoration-color:#000;text-transform:none;text-orientation:mixed;white-space:normal;shape-padding:0;shape-margin:0;inline-size:0;isolation:auto;mix-blend-mode:normal;solid-color:#000;solid-opacity:1" transform="matrix(.96034 0 0 .96043 -.611 .955)" color="#000000" font-style="normal" font-variant="normal" font-weight="400" font-stretch="normal" font-size="medium" font-family="sans-serif" text-decoration="none" letter-spacing="normal" word-spacing="normal" writing-mode="lr-tb" direction="ltr" dominant-baseline="auto" baseline-shift="baseline" text-anchor="start" clip-rule="nonzero" display="inline" overflow="visible" visibility="visible" opacity="1" color-interpolation="sRGB" color-interpolation-filters="linearRGB" vector-effect="none" fill="#444444" fill-opacity="1" fill-rule="nonzero" stroke="none" stroke-width="1.04125" stroke-linecap="square" stroke-linejoin="miter" stroke-miterlimit="4" stroke-dasharray="none" stroke-dashoffset="0" stroke-opacity="1" paint-order="stroke fill markers" color-rendering="auto" image-rendering="auto" shape-rendering="auto" text-rendering="auto" enable-background="accumulate" stop-color="#444444" stop-opacity="1" class="fill-000000 stop-color-000000"></path><path d="M4.611 16.296v1.041h2.041v-1.04h-2.04zM4.611 14.032v1.043h2.041v-1.043h-2.04zM4.611 18.558v1.04h2.041v-1.04h-2.04zM19.545 16.296v1.041h2.04v-1.04h-2.04zM19.545 14.032v1.043h2.04v-1.043h-2.04zM19.545 18.558v1.04h2.04v-1.04h-2.04z" style="line-height:normal;font-variant-ligatures:normal;font-variant-position:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-alternates:normal;font-variant-east-asian:normal;font-feature-settings:normal;font-variation-settings:normal;text-indent:0;text-align:start;text-decoration-line:none;text-decoration-style:solid;text-decoration-color:#000;text-transform:none;text-orientation:mixed;white-space:normal;shape-padding:0;shape-margin:0;inline-size:0;isolation:auto;mix-blend-mode:normal;solid-color:#000;solid-opacity:1" transform="matrix(.96034 0 0 .96043 -.611 .955)" color="#000000" font-style="normal" font-variant="normal" font-weight="400" font-stretch="normal" font-size="medium" font-family="sans-serif" text-decoration="none" letter-spacing="normal" word-spacing="normal" writing-mode="lr-tb" direction="ltr" dominant-baseline="auto" baseline-shift="baseline" text-anchor="start" clip-rule="nonzero" display="inline" overflow="visible" visibility="visible" color-interpolation="sRGB" color-interpolation-filters="linearRGB" vector-effect="none" fill="#444444" fill-opacity="1" fill-rule="nonzero" stroke="none" stroke-width="1.04125px" stroke-linecap="square" stroke-linejoin="miter" stroke-miterlimit="4" stroke-dasharray="none" stroke-dashoffset="0" stroke-opacity="1" color-rendering="auto" image-rendering="auto" shape-rendering="auto" text-rendering="auto" enable-background="accumulate" stop-color="#444444" class="fill-000000 stop-color-000000"></path></g>
				</svg>
			</span>
			<a href="#" class="sub-title ">기업 관리</a>
			<li>
				<i class="fa-solid fa-check"></i>
				<a href="/enter/entmypage" class="sub-inner my-title">프로필</a>
			</li>
			<li>
				<i class="fa-solid fa-check"></i>
				<a href="/enter/filepage" class="sub-inner my-title">파일 보관함</a>
			</li>
		</ul>
<!-- 		<ul class="mem-ul"> -->
<!-- 			<span class="span-pd"> -->
<!-- 				<svg width="20" height="20" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"> -->
<!-- 					<path d="M23.7 20.308a11.919 11.919 0 0 0-5.342-7.466 8 8 0 1 0-12.709 0 11.894 11.894 0 0 0-5.344 7.465 3.01 3.01 0 0 0 .582 2.561A2.977 2.977 0 0 0 3.23 24h17.54a2.977 2.977 0 0 0 2.343-1.132 3.008 3.008 0 0 0 .587-2.56ZM12 2a6 6 0 1 1-6 6 6.006 6.006 0 0 1 6-6Zm9.549 19.623a.982.982 0 0 1-.779.377H3.23a.982.982 0 0 1-.779-.377 1.026 1.026 0 0 1-.2-.87A9.9 9.9 0 0 1 7.1 14.306a7.949 7.949 0 0 0 9.813 0 9.925 9.925 0 0 1 4.838 6.45 1.024 1.024 0 0 1-.202.867Z" data-name="31. User" fill="#444444" class="fill-000000"></path> -->
<!-- 				</svg> -->
<!-- 			</span> -->
<!-- 			<a href="#" class="sub-title ">기업 회원관리</a> -->
			
<!-- 		</ul>	 -->
		<ul class="mem-ul">
			<span>
				<svg width="20" height="20" viewBox="0 0 128 128" xml:space="preserve" xmlns="http://www.w3.org/2000/svg">
					<path clip-rule="evenodd" d="M8 120h8v-8H8v8zm16-8v-8h-8v8h8zm-16-8h8v-8H8v8zm16-8v-8h-8v8h8zM8 88h8v-8H8v8zm16-8v-8h-8v8h8zM8 72h8v-8H8v8zm8-8h8v-8h-8v8zm24 16h72V48H40v32zm8-24h56v16H48V56zm16-40H40v24h24V16zm8 0v8h40v-8H72zm24 16H72v8h24v-8zm-56 80h32v-8H40v8zm0-16h32v-8H40v8zm40 0h32v-8H80v8zm0 16h16v-8H80v8z" fill="#B0BEC5" fill-rule="evenodd" class="fill-b0bec5"></path><path clip-rule="evenodd" d="M104 128H16c-8.836 0-16-7.164-16-16V48h24V0h104v104c0 13.258-10.742 24-24 24zM8 112c0 4.422 3.578 8 8 8s8-3.578 8-8v-8h-8V56H8v56zM120 8H32v104c0 2.805-.484 5.5-1.367 8H104c8.82 0 16-7.18 16-16V8z" fill="#444444" fill-rule="evenodd" class="fill-546e7a"></path>
				</svg>
			</span>
			<a href="#" class="sub-title ">채용 관리</a>
			<li>
				<i class="fa-solid fa-check"></i>
				<a href="/enter/recruit" class="sub-inner my-title">공고 목록</a>
			</li>
			<li>
				<i class="fa-solid fa-check"></i>
				<a href="/enter/recruitCreate" class="sub-inner my-title">공고 등록</a>
			</li>
		</ul>	
		<ul class="mem-ul">
			<span>
				<svg width="20" height="20" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><g data-name="Outline">
					<path d="M36 41a4.5 4.5 0 1 0-4.5-4.5A4.51 4.51 0 0 0 36 41Zm0-7a2.5 2.5 0 1 1-2.5 2.5A2.5 2.5 0 0 1 36 34Z" fill="#444444" class="fill-000000"></path><path d="M22 42a14 14 0 1 0 14-14 14 14 0 0 0-14 14Zm7.5 10.07A6.76 6.76 0 0 1 36 45a6.76 6.76 0 0 1 6.5 7.07 11.91 11.91 0 0 1-13 0ZM36 30a12 12 0 0 1 8.39 20.57A8.66 8.66 0 0 0 36 43a8.66 8.66 0 0 0-8.38 7.57A12 12 0 0 1 36 30Z" fill="#444444" class="fill-000000"></path><path d="M59 14h-2V9a1 1 0 0 0-1-1h-6V3a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1v11h-.32A3.85 3.85 0 0 0 2 18v39.92A3.93 3.93 0 0 0 5.74 62h52.67A3.86 3.86 0 0 0 62 57.92V17a3 3 0 0 0-3-3Zm0 2a1 1 0 0 1 1 1v5h-3v-6Zm-4 6H34.36a.83.83 0 0 1-.57-.23l-7.42-7a2.83 2.83 0 0 0-1.94-.77H15v-4h40ZM4 57.92V18a1.86 1.86 0 0 1 1.68-2H6v41a1 1 0 0 0 1 1h3a4.42 4.42 0 0 0 .51 2H5.74A1.93 1.93 0 0 1 4 57.92Zm56 0A1.91 1.91 0 0 1 58.41 60H13.59A1.91 1.91 0 0 1 12 57.92V41a1 1 0 0 0-2 0v15H8V4h40v4H14a1 1 0 0 0-1 1v5.06A3.87 3.87 0 0 0 10 18v15a1 1 0 0 0 2 0V18a1.84 1.84 0 0 1 1.53-2h10.9a.83.83 0 0 1 .57.23l7.42 7a2.83 2.83 0 0 0 1.94.78H60Z" fill="#444444" class="fill-000000"></path><path d="M32 15h20a1 1 0 0 0 0-2H32a1 1 0 0 0 0 2ZM52 17H37a1 1 0 0 0 0 2h15a1 1 0 0 0 0-2Z" fill="#444444" class="fill-000000"></path><circle cx="11" cy="37" r="1" fill="#444444" class="fill-000000"></circle></g>
				</svg>
			</span>
			<a href="#" class="sub-title ">지원자 관리</a>
			<li>
				<i class="fa-solid fa-check"></i>
				<a href="/enter/application" class="sub-inner my-title">채용 공고</a>
			</li>
<!-- 			<li> -->
<!-- 				<i class="fa-solid fa-check"></i> -->
<!-- 				<a href="#" class="sub-inner my-title">실시간 채팅</a> -->
<!-- 			</li> -->
		</ul>	
		<ul class="mem-ul">
			<span>
				<svg width="20" height="20" viewBox="0 0 846.66 846.66" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" image-rendering="optimizeQuality" fill-rule="evenodd" clip-rule="evenodd">
					<path d="M293.76 130.09H552.9V30.08c0-11.43 9.27-20.71 20.71-20.71h119.84c11.43 0 20.71 9.28 20.71 20.71v100.01h51.57c11.44 0 20.71 9.27 20.71 20.71v665.78c0 11.43-9.27 20.71-20.71 20.71H80.93c-11.44 0-20.71-9.28-20.71-20.71V150.8c0-11.44 9.27-20.71 20.71-20.71h51.58V30.08c0-11.43 9.27-20.71 20.7-20.71h119.85c11.43 0 20.7 9.28 20.7 20.71v100.01zM101.64 334.21h643.39v-33.99H101.64v33.99zm643.39 41.41H101.64v420.25h643.39V375.62zM101.64 258.8h643.39v-87.29h-30.87v34.45c0 11.44-9.28 20.71-20.71 20.71H573.61c-11.44 0-20.71-9.27-20.71-20.71v-34.45H293.76v34.45c0 11.44-9.27 20.71-20.7 20.71H153.21c-11.43 0-20.7-9.27-20.7-20.71v-34.45h-30.87v87.29zm59.18 369.67h74.19c11.43 0 20.71 9.27 20.71 20.71v74.19c0 11.43-9.28 20.7-20.71 20.7h-74.19c-11.43 0-20.71-9.27-20.71-20.7v-74.19c0-11.44 9.28-20.71 20.71-20.71zm53.48 41.42h-32.77v32.77h32.77v-32.77zm397.35-41.42h74.19c11.43 0 20.71 9.27 20.71 20.71v74.19c0 11.43-9.28 20.7-20.71 20.7h-74.19c-11.43 0-20.71-9.27-20.71-20.7v-74.19c0-11.44 9.28-20.71 20.71-20.71zm53.48 41.42h-32.77v32.77h32.77v-32.77zm-203.76-41.42h74.19c11.44 0 20.71 9.27 20.71 20.71v74.19c0 11.43-9.27 20.7-20.71 20.7h-74.19c-11.43 0-20.7-9.27-20.7-20.7v-74.19c0-11.44 9.27-20.71 20.7-20.71zm53.48 41.42h-32.77v32.77h32.77v-32.77zM311.1 628.47h74.18c11.44 0 20.71 9.27 20.71 20.71v74.19c0 11.43-9.27 20.7-20.71 20.7H311.1c-11.44 0-20.71-9.27-20.71-20.7v-74.19c0-11.44 9.27-20.71 20.71-20.71zm53.47 41.42h-32.76v32.77h32.76v-32.77zm-203.75-195.5h74.19c11.43 0 20.71 9.27 20.71 20.71v74.18c0 11.44-9.28 20.71-20.71 20.71h-74.19c-11.43 0-20.71-9.27-20.71-20.71V495.1c0-11.44 9.28-20.71 20.71-20.71zm53.48 41.42h-32.77v32.77h32.77v-32.77zm397.35-41.42h74.19c11.43 0 20.71 9.27 20.71 20.71v74.18c0 11.44-9.28 20.71-20.71 20.71h-74.19c-11.43 0-20.71-9.27-20.71-20.71V495.1c0-11.44 9.28-20.71 20.71-20.71zm53.48 41.42h-32.77v32.77h32.77v-32.77zm-203.76-41.42h74.19c11.44 0 20.71 9.27 20.71 20.71v74.18c0 11.44-9.27 20.71-20.71 20.71h-74.19c-11.43 0-20.7-9.27-20.7-20.71V495.1c0-11.44 9.27-20.71 20.7-20.71zm53.48 41.42h-32.77v32.77h32.77v-32.77zM311.1 474.39h74.18c11.44 0 20.71 9.27 20.71 20.71v74.18c0 11.44-9.27 20.71-20.71 20.71H311.1c-11.44 0-20.71-9.27-20.71-20.71V495.1c0-11.44 9.27-20.71 20.71-20.71zm53.47 41.42h-32.76v32.77h32.76v-32.77zM252.35 50.79h-78.43v134.46h78.43V50.79zm420.39 0h-78.42v134.46h78.42V50.79z" fill="#444444" fill-rule="nonzero" class="fill-000000"></path>
				</svg>
			</span>
			<a href="/enter/calendar" class="sub-title">채용 일정 관리</a>
<!-- 			<li> -->
<!-- 				<i class="fa-solid fa-check"></i> -->
<!-- 				<a href="/enter/calendar" class="sub-inner my-title">캘린더</a> -->
<!-- 			</li> -->
		</ul>	
		<ul class="mem-ul">
			<span>
				<svg width="20" height="20" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg">
					<rect height="18.8" rx="1" ry="1" width="8" x="1" y="12.2" fill="#444444" class="fill-ffc661"></rect>
					<path d="M30.15 13.68a4.19 4.19 0 0 0-3.24-1.48h-4.48l.91-6.62a3.83 3.83 0 0 0-.94-3.07A4.49 4.49 0 0 0 19 1a4.42 4.42 0 0 0-4.1 2.61l-3.81 9.21a1 1 0 0 0-.08.38V30a1 1 0 0 0 1 1h12.84a4 4 0 0 0 4-3.16l2.06-11.2a3.59 3.59 0 0 0-.76-2.96Z" fill="#444444" class="fill-ffc661"></path><path d="M9 13.2V30a1 1 0 0 1-1 1h-.31V14.2a1 1 0 0 0-1-1H1a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1ZM30.94 16.64l-2.06 11.2a3.83 3.83 0 0 1-2.16 2.74 3.61 3.61 0 0 0 .85-1.74l2.06-11.2a3.6 3.6 0 0 0-.8-3 4.18 4.18 0 0 0-3.24-1.48h-4.48L22 6.58a3.83 3.83 0 0 0-.94-3.07A4.51 4.51 0 0 0 17.67 2a4.72 4.72 0 0 0-2.08.49A4.6 4.6 0 0 1 19 1a4.51 4.51 0 0 1 3.4 1.51 3.83 3.83 0 0 1 .94 3.07l-.91 6.62h4.48a4.19 4.19 0 0 1 3.24 1.48 3.63 3.63 0 0 1 .79 2.96Z" fill="#444444" class="fill-e49f4e"></path>
				</svg>
			</span>
			<a href="#" class="sub-title ">맞춤인재(인재목록)</a>
			<li>
				<i class="fa-solid fa-check"></i>
				<a href="/enter/jobOffer" class="sub-inner my-title">추천 인재관리</a>
			</li>
		</ul>	
		<ul class="mem-ul">
			<span>
				<svg width="20" height="20" viewBox="0 0 50 50" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 50 50">
					<path d="M8.793 14h22v2h-22zM8.793 20h22v2h-22zM8.793 26h17v2h-17zM8.793 32h12v2h-12zM8.793 38h12v2h-12z" fill="#444444" class="fill-000000"></path>
					<path d="M38.793 18.586v-10L31.207 1H.793v48h38V31.414L49.207 21l-6.414-6.414-4 4zm-1 3.828L41.379 26l-12 12h-3.586v-3.586l12-12zm-6-18L35.379 8h-3.586V4.414zm5 42.586h-34V3h27v7h7v10.586l-13 13V40h6.414l6.586-6.586V47zm6-22.414L39.207 21l3.586-3.586L46.379 21l-3.586 3.586z" fill="#444444" class="fill-000000"></path>
				</svg>
			</span>
			<a href="/entApplicant/review" class="sub-title">리뷰관리</a>
<!-- 			<li> -->
<!-- 				<i class="fa-solid fa-check"></i> -->
<!-- 				<a href="/enter/review" class="sub-inner my-title">리뷰목록</a> -->
<!-- 			</li> -->
		</ul>	
		<ul class="mem-ul">
			<span>
				<svg width="20" height="20" viewBox="0 0 48 48" xml:space="preserve" xmlns="http://www.w3.org/2000/svg">
					<g fill="#444444" class="fill-241f20"><path d="M22.259 35.893v-2.721c3.07-.536 4.752-2.563 4.752-4.939 0-2.404-1.281-3.872-4.459-4.994-2.269-.854-3.204-1.416-3.204-2.296 0-.748.562-1.496 2.298-1.496 1.924 0 3.15.614 3.844.909l.773-3.018c-.879-.427-2.082-.801-3.871-.882v-2.349h-2.615v2.536c-2.857.561-4.512 2.403-4.512 4.753 0 2.59 1.947 3.924 4.806 4.886 1.977.667 2.831 1.308 2.831 2.323 0 1.067-1.041 1.654-2.564 1.654-1.735 0-3.311-.561-4.432-1.174l-.801 3.124c1.014.587 2.75 1.068 4.538 1.147v2.535h2.616zM36.079 30.125a8.896 8.896 0 1 0 0 17.792 8.896 8.896 0 0 0 0-17.792zm3.491 9.326-5.027 5.027-.002-.003-.279.279-.004-.004-.004.004-.627-.627.004-.004-4.088-4.088 1.155-1.157 3.567 3.567 4.149-4.149-.004-.006 3.044-3.044 1.16 1.162-3.044 3.043z"></path><path d="M19.812 43.134H7.792V19.142h.016V4.867h19.134v7.175h7.175V27.101c.64-.104 1.292-.173 1.962-.173.974 0 1.915.127 2.821.345V9.479L29.504.083H3.025v47.834h16.788V48h8.185a12.081 12.081 0 0 1-3.28-4.866h-4.906z"></path></g>
				</svg>
			</span>
			<a href="#" class="sub-title ">프리미엄</a>
			<li>
				<i class="fa-solid fa-check"></i>
				<a href="/enter/items" class="sub-inner my-title">상품</a>
			</li>
			<li>
				<i class="fa-solid fa-check"></i>
				<a href="/enter/payitems" class="sub-inner my-title">결제목록</a>
			</li>
		</ul>	
	</div>
	
</div>
 <script src="/resources/js/jquery-3.6.3.min.js"></script>
