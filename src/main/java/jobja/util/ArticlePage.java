package jobja.util;

import java.util.List;

import lombok.extern.slf4j.Slf4j;

//페이징 관련 정보 + 게시글 정보
@Slf4j
public class ArticlePage<T> {
	// 전체글 수
	private int total;
	// 현재 페이지 번호
	private int currentPage;
	// 전체 페이지 수
	private int totalPages;
	// 블록의 시작 페이지 번호
	private int startPage;
	// 블록의 종료 페이지 번호
	private int endPage;
	//검색어
	private String keyword;
	//요청URL
	private String url;
	// 데이터
	private List<T> content;
	// 한 화면에 보여질 목록의 행 수
	private int size;
	// 한 화면에 보여질 목록의 행 수
	private int pageSize;
	// 정렬기준
	private String sort;
	// 직업
	private List<String> recruitJobs;
	// 근무지역
	private List<String> recruitLocation;
	// 고용형태
	private List<String> recruitWorkType;
	// 학력
	private List<String> recruitAcdmCr;
	
	private String interestYn;
	
	private String recruitNo;
	
	
	private String comDetCode = "";

	// 생성자(Constructor) : 페이징 정보를 생성
	public ArticlePage(int total, int currentPage, int size, List<T> content) {
		// size : 한 화면에 보여질 목록의 행 수
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		this.size = size;
		this.sort = null;

		System.out.println("@@@@@@@@@@@@@@total"+ total);
		System.out.println("@@@@@@@@@@@@@@currentPage"+ currentPage);
		System.out.println("@@@@@@@@@@@@@@content"+ content);
		System.out.println("@@@@@@@@@@@@@@size"+ size);
		
		// 전체글 수가 0이면?
		if (total == 0) {
			totalPages = 0; // 전체 페이지 수
			startPage = 0; // 블록 시작번호
			endPage = 0; // 블록 종료번호
		} else {// 글이 있다면
			// 전체글 수 / 한 화면에 보여질 목록의 행 수 => 전체 페이지 수
			totalPages = total / size;

			// 전체글 수 % 한 화면에 보여질 목록의 행 수
			// => 0이아니면. 나머지가 있다면, 페이지 1증가
			if (total % size > 0) {
				totalPages++;
			}

			//페이지 블록  시작페이지를 구하는 공식!
			// 시작페이지 = 현재페이지 / 페이지크기 * 페이지크기 + 1
			startPage = currentPage / size * size + 1;

			// 현재페이지 % 페이지크기 => 0일 때 보정
			if (currentPage % size == 0) {
				// 페이지크기를 빼줌
				startPage -= size;
			}

			// 종료페이지번호 = 시작페이지번호 + (페이지크기-1)
			endPage = startPage + (size -1);

			// 종료페이지번호 > 전체페이지수보다 클 때
			if (endPage > totalPages) {
				endPage = totalPages;
			}
		}
	}//end 생성자

	// 생성자(Constructor) : 페이징 정보를 생성
	public ArticlePage(int total, int currentPage, int size, int pageSize, List<T> content) {
		// size : 한 화면에 보여질 목록의 행 수
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		this.size = size;
		this.sort = null;
		this.pageSize = pageSize;
		System.out.println("@@@@@@@@@@@@@@total"+ total);
		System.out.println("@@@@@@@@@@@@@@currentPage"+ currentPage);
		System.out.println("@@@@@@@@@@@@@@content"+ content);
		System.out.println("@@@@@@@@@@@@@@size"+ size);
		
		// 전체글 수가 0이면?
		if (total == 0) {
			totalPages = 0; // 전체 페이지 수
			startPage = 0; // 블록 시작번호
			endPage = 0; // 블록 종료번호
		} else {// 글이 있다면
			// 전체글 수 / 한 화면에 보여질 목록의 행 수 => 전체 페이지 수
			totalPages = total / size;

			// 전체글 수 % 한 화면에 보여질 목록의 행 수
			// => 0이아니면. 나머지가 있다면, 페이지 1증가
			if (total % size > 0) {
				totalPages++;
			}

			//페이지 블록  시작페이지를 구하는 공식!
			// 시작페이지 = 현재페이지 / 페이지크기 * 페이지크기 + 1
			startPage = currentPage / pageSize * pageSize + 1;

			// 현재페이지 % 페이지크기 => 0일 때 보정
			if (currentPage % pageSize == 0) {
				// 페이지크기를 빼줌
				startPage -= pageSize;
			}

			// 종료페이지번호 = 시작페이지번호 + (페이지크기-1)
			endPage = startPage + (pageSize -1);

			// 종료페이지번호 > 전체페이지수보다 클 때
			if (endPage > totalPages) {
				endPage = totalPages;
			}
		}
		

		System.out.println("@@@@@@@@@@@@@@total"+ total);
		System.out.println("@@@@@@@@@@@@@@currentPage"+ currentPage);
		System.out.println("@@@@@@@@@@@@@@content"+ content);
		System.out.println("@@@@@@@@@@@@@@size"+ size);
		System.out.println("@@@@@@@@@@@@@@pageSize"+ pageSize);
		System.out.println("@@@@@@@@@@@@@@totalPages"+ totalPages);
		System.out.println("@@@@@@@@@@@@@@startPage"+ startPage);
		System.out.println("@@@@@@@@@@@@@@endPage"+ endPage);
	}//end 생성자

	// 생성자(Constructor) : 페이징 정보를 생성
	public ArticlePage(int total, int currentPage, int size, List<T> content,String sort) {
		// size : 한 화면에 보여질 목록의 행 수
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		this.size = size;
		this.sort = sort;

		// 전체글 수가 0이면?
		if (total == 0) {
			totalPages = 0; // 전체 페이지 수
			startPage = 0; // 블록 시작번호
			endPage = 0; // 블록 종료번호
		} else {// 글이 있다면
			// 전체글 수 / 한 화면에 보여질 목록의 행 수 => 전체 페이지 수
			totalPages = total / size;

			// 전체글 수 % 한 화면에 보여질 목록의 행 수
			// => 0이아니면. 나머지가 있다면, 페이지 1증가
			if (total % size > 0) {
				totalPages++;
			}

			//페이지 블록  시작페이지를 구하는 공식!
			// 시작페이지 = 현재페이지 / 페이지크기 * 페이지크기 + 1
			startPage = currentPage / 5 * 5 + 1;

			// 현재페이지 % 페이지크기 => 0일 때 보정
			if (currentPage % 5 == 0) {
				// 페이지크기를 빼줌
				startPage -= 5;
			}

			// 종료페이지번호 = 시작페이지번호 + (페이지크기-1)
			endPage = startPage + 4;

			// 종료페이지번호 > 전체페이지수보다 클 때
			if (endPage > totalPages) {
				endPage = totalPages;
			}
		}
	}//end 생성자
	// 생성자(Constructor) : 페이징 정보를 생성
	public ArticlePage(int total, int currentPage, int size, int pageSize, List<T> content,String sort) {
		// size : 한 화면에 보여질 목록의 행 수
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		this.size = size;
		this.sort = sort;

		// 전체글 수가 0이면?
		if (total == 0) {
			totalPages = 0; // 전체 페이지 수
			startPage = 0; // 블록 시작번호
			endPage = 0; // 블록 종료번호
		} else {// 글이 있다면
			// 전체글 수 / 한 화면에 보여질 목록의 행 수 => 전체 페이지 수
			totalPages = total / size;

			// 전체글 수 % 한 화면에 보여질 목록의 행 수
			// => 0이아니면. 나머지가 있다면, 페이지 1증가
			if (total % size > 0) {
				totalPages++;
			}

			//페이지 블록  시작페이지를 구하는 공식!
			// 시작페이지 = 현재페이지 / 페이지크기 * 페이지크기 + 1
			startPage = currentPage / pageSize * pageSize + 1;

			// 현재페이지 % 페이지크기 => 0일 때 보정
			if (currentPage % pageSize == 0) {
				// 페이지크기를 빼줌
				startPage -= pageSize;
			}

			// 종료페이지번호 = 시작페이지번호 + (페이지크기-1)
			endPage = startPage + (pageSize -1);

			// 종료페이지번호 > 전체페이지수보다 클 때
			if (endPage > totalPages) {
				endPage = totalPages;
			}
		}
	}//end 생성자

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public List<T> getContent() {
		return content;
	}

	public void setContent(List<T> content) {
		this.content = content;
	}
	
	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	//전체 글의 수가 0인가?
	public boolean hasNoAriticles() {
		return this.total == 0;
	}
	
	//데이터가 있니?
	public boolean hasArticles() {
		return this.total > 0;
	}
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	

	public List<String> getRecruitJobs() {
		return recruitJobs;
	}

	public void setRecruitJobs(List<String> recruitJobs) {
		this.recruitJobs = recruitJobs;
	}

	public List<String> getRecruitLocation() {
		return recruitLocation;
	}

	public void setRecruitLocation(List<String> recruitLocation) {
		this.recruitLocation = recruitLocation;
	}

	public List<String> getRecruitWorkType() {
		return recruitWorkType;
	}

	public void setRecruitWorkType(List<String> recruitWorkType) {
		this.recruitWorkType = recruitWorkType;
	}

	public List<String> getRecruitAcdmCr() {
		return recruitAcdmCr;
	}

	public void setRecruitAcdmCr(List<String> recruitAcdmCr) {
		this.recruitAcdmCr = recruitAcdmCr;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getComDetCode() {
		return comDetCode;
	}

	public void setComDetCode(String comDetCode) {
		this.comDetCode = comDetCode;
	}
	
	

	public String getInterestYn() {
		return interestYn;
	}

	public void setInterestYn(String interestYn) {
		this.interestYn = interestYn;
	}
	
	public String getRecruitNo() {
		return recruitNo;
	}

	public void setRecruitNo(String recruitNo) {
		this.recruitNo = recruitNo;
	}

	//페이징 블록을 자동화
	public String getPagingArea() {
		String pagingArea = "";
		log.info("startPageg"+startPage);
		log.info("pageSizeg"+pageSize);
		pagingArea +="<div class='col-sm-12 col-md-7'>";					
		pagingArea +="<div class='pagination dataTables_paginate paging_simple_numbers' id='dataTable_paginate'>";
		pagingArea +="<ul class=''>";
		pagingArea +="<li class='paginate_button page-item previous prevPage ";
		if(this.startPage<6) {
			pagingArea += "disabled";
		}
		pagingArea +="' id='dataTable_previous'>";
		pagingArea +="<a href='"+this.url+"?keyword="+this.keyword+"&currentPage="+(this.startPage-pageSize)+"&sort="+this.sort+"'";
		pagingArea +="aria-controls='dataTable' data-dt-idx='0' tabindex='0'";
		pagingArea +="class='page-link'>이전</a></li>";
		
		for(int pNo=this.startPage;pNo<=this.endPage;pNo++) {
			pagingArea +="<li class='paginate_button page-item ";
				if(this.currentPage==pNo) {
					pagingArea +="is_active";
				}
			pagingArea +="'>";
			pagingArea +="<a href='"+this.url+"?keyword="+this.keyword+"&currentPage="+pNo+"&sort="+this.sort+"' ";
			pagingArea +="aria-controls='dataTable' data-dt-idx='1' tabindex='0' ";
			pagingArea +="class='page-link'>"+pNo+"</a></li>";
		}
		pagingArea +="<li class='paginate_button page-item next nextPage ";
			if(this.endPage>=this.totalPages) {
				pagingArea +="disabled";
			}
		pagingArea +="' id='dataTable_next'><a href='"+this.url+"?keyword="+this.keyword+"&currentPage="+(this.startPage+this.pageSize)+"&sort="+this.sort+"' "; 
		pagingArea +="aria-controls='dataTable' data-dt-idx='7' tabindex='0' ";
		pagingArea +="class='page-link'>다음</a></li></ul></div></div>";
		
		return pagingArea;
	}
	
	
	//페이징 블록을 자동화
	   public String getPagingArea2() {
	      String pagingArea = "";
	      
	      if(this.comDetCode==null) {
	    	  this.comDetCode = "";
	      }
	      if(this.keyword==null) {
	    	  this.keyword = "";
	      }
	      
	      pagingArea +="<div class='paging'>";               
	      pagingArea +="<div class='paging-inner'>";
	      pagingArea +="<ul class='paging-in-ul'>";
	      pagingArea +="<li class='paging-in-li ";
	      if(this.startPage<6) {
	         pagingArea += "disabled";
	      }
	      pagingArea +="' id=''>";
	      
	      if(this.startPage>=6) {
//		      pagingArea +="<a href='"+this.url+"?keyword="+this.keyword+"&currentPage="+(this.startPage-5)+"&comDetCode="+this.comDetCode+"'";
		      pagingArea +="<a href='"+this.url+"?keyword="+this.keyword+"&currentPage="+(this.startPage-5)+"&comDetCode="+this.comDetCode+"'";
		      pagingArea +="";
		      pagingArea +="class='page-link-area'>이전</a>";
	      }else {
	    	  pagingArea +="이전";
	      }
	      pagingArea += "</li>";
	      
	      for(int pNo=this.startPage;pNo<=this.endPage;pNo++) {
	         pagingArea +="<li class='paging-in-li ";
	            if(this.currentPage==pNo) {
	               pagingArea +="active";
	            }
	         pagingArea +="'>";
//	         pagingArea +="<a href='"+this.url+"?keyword="+this.keyword+"&currentPage="+pNo+"&comDetCode="+this.comDetCode+"'";
	         pagingArea +="<a href='"+this.url+"?keyword="+this.keyword+"&currentPage="+pNo+"&comDetCode="+this.comDetCode+"'";
	         if(this.comDetCode == null || this.comDetCode.isEmpty()) {
	        	 
	        	 pagingArea += "&comDetCode='' ";
	        	 
	         }else {
	        	 
	        	 log.info("코드 : " + this.comDetCode);
	        	 pagingArea += "&comDetCode="+this.comDetCode+"'";
	        	 
			}
//	         pagingArea +="";
	         log.info("코드pagingArea : " + pagingArea);
	         pagingArea +=" class='page-link'>"+pNo+"</a></li>";
	      }
	      pagingArea +="<li class=' ";
	         if(this.endPage>=this.totalPages) {
	            pagingArea +="disabled ";
	         }
	      pagingArea +="' id=''>";
	         if(this.endPage<this.totalPages) {
	        	 log.info("comDetCode => " + this.comDetCode);
	        	 pagingArea += "<a href='"+this.url+"?keyword="+this.keyword+"&currentPage="+(this.startPage+5)+"&comDetCode="+this.comDetCode+"'";
//	        	 pagingArea += "<a href='"+this.url+"?keyword="+this.keyword+"&currentPage="+(this.startPage+5)+"'";
	        	 
			     pagingArea +=" class='page-link-area'>다음</a>";
			     
	         }else {
	        	 
	        	 pagingArea += "다음";
	         }
	         pagingArea += "</li></ul></div></div>";
	      
	      return pagingArea;
	   }
	   
	 //페이징 블록을 자동화
	   public String getPagingArea3() {
	       String pagingArea = "";

	       if (this.keyword == null) {
	           this.keyword = "";
	       }

	       if (this.total > 0) {

	           pagingArea += "<div class='paging'>";
	           pagingArea += "<div class='paging-inner'>";
	           pagingArea += "<ul class='paging-in-ul'>";
	           pagingArea += "<li class='paging-in-li ";
	           if (this.startPage < 6) {
	               pagingArea += "disabled";
	           }
	           pagingArea += "' id=''>";

	           if (this.startPage >= 6) {
	               pagingArea += "<a href='" + this.url + "?keyword=" + this.keyword + "&currentPage=" + (this.startPage - 5) + "'";
	               pagingArea += "class='page-link-area'>이전</a>";
	           } else {
	               pagingArea += "이전";
	           }
	           pagingArea += "</li>";

	           for (int pNo = this.startPage; pNo <= this.endPage; pNo++) {
	               pagingArea += "<li class='paging-in-li ";
	               if (this.currentPage == pNo) {
	                   pagingArea += "active";
	               }
	               pagingArea += "'>";
	               pagingArea += "<a href='" + this.url + "?keyword=" + this.keyword + "&currentPage=" + pNo + "' ";
	               pagingArea += "class='page-link'>" + pNo + "</a></li>";
	           }

	           pagingArea += "<li class=' ";
	           if (this.endPage >= this.totalPages) {
	               pagingArea += "disabled ";
	           }
	           pagingArea += "' id=''>";
	           if (this.endPage < this.totalPages) {
	               pagingArea += "<a href='" + this.url + "?keyword=" + this.keyword + "&currentPage=" + (this.startPage + 5) + "' ";
	               pagingArea += "class='page-link-area'>다음</a>";
	           } else {
	               pagingArea += "다음";
	           }
	           pagingArea += "</li></ul></div></div>";
	       } else {
	           // 데이터가 없을 때는 페이지를 출력하지 않음
	           pagingArea = "";
	       }

	       return pagingArea;
	   }

	 //페이징 블록을 자동화
		public String getPagingArea4() {
			String pagingArea = "";
			
			if(this.sort == null) {
				this.sort = "";
			}
			
			pagingArea +="<div class='col-sm-12 col-md-7'>";					
			pagingArea +="<div class='pagination dataTables_paginate paging_simple_numbers' id='dataTable_paginate'>";
			pagingArea +="<ul class=''>";
			pagingArea +="<li class='paginate_button page-item previous prevPage ";
			if(this.startPage<6) {
				pagingArea += "disabled";
			}
			pagingArea +="' id='dataTable_previous'>";
			pagingArea +="<a href='"+this.url+"?keyword="+this.keyword+"&currentPage="+(this.startPage-size)+"&sort="+this.sort+"'";
			pagingArea +="aria-controls='dataTable' data-dt-idx='0' tabindex='0'";
			pagingArea +="class='page-link'>이전</a></li>";
			
			for(int pNo=this.startPage;pNo<=this.endPage;pNo++) {
				pagingArea +="<li class='paginate_button page-item ";
					if(this.currentPage==pNo) {
						pagingArea +="is_active";
					}
				pagingArea +="'>";
				
				String queryStr = "";
				if(recruitWorkType != null) {
					for(String str : recruitWorkType) {
						queryStr += "&recruitWorkType=" + str;
					}
				}
				if(recruitLocation != null) {
					for(String str : recruitLocation) {
						queryStr += "&recruitLocation=" + str;
					}
				}
				if(recruitJobs != null) {
					for(String str : recruitJobs) {
						queryStr += "&recruitJobs=" + str;
					}
				}
				if(recruitAcdmCr != null) {
					for(String str : recruitAcdmCr) {
						queryStr += "&recruitAcdmCr=" + str;
					}
				}
				
				queryStr += "&currentPage="+pNo+"&sort="+this.sort;
				
				log.info("queryStr : {}", queryStr);
					
				pagingArea +="<a href='"+this.url+"?keyword="+this.keyword+ queryStr +"' ";
				pagingArea +="aria-controls='dataTable' data-dt-idx='1' tabindex='0' ";
				pagingArea +="class='page-link'>"+pNo+"</a></li>";
			}
			pagingArea +="<li class='paginate_button page-item next nextPage ";
				if(this.endPage>=this.totalPages) {
					pagingArea +="disabled";
				}
			pagingArea +="' id='dataTable_next'><a href='"+this.url+"?keyword="+this.keyword+"&currentPage="+(this.startPage+this.size)+"&sort="+this.sort+"' "; 
			pagingArea +="aria-controls='dataTable' data-dt-idx='7' tabindex='0' ";
			pagingArea +="class='page-link'>다음</a></li></ul></div></div>";
			
			return pagingArea;
		}
		

		//페이징 블록을 자동화
		public String getPagingArea5() {
			String pagingArea = "";
			
			pagingArea +="<div class='col-sm-12 col-md-7'>";					
			pagingArea +="<div class='pagination dataTables_paginate paging_simple_numbers' id='dataTable_paginate'>";
			pagingArea +="<ul class=''>";
			pagingArea +="<li class='paginate_button page-item previous prevPage ";
			if(this.startPage<6) {
				pagingArea += "disabled";
			}
			pagingArea +="' id='dataTable_previous'>";
			pagingArea +="<a href='"+this.url+"?keyword="+this.keyword+"&currentPage="+(this.startPage-size)+"&sort="+this.sort+"'";
			pagingArea +="aria-controls='dataTable' data-dt-idx='0' tabindex='0'";
			pagingArea +="class='page-link'>이전</a></li>";
			
			for(int pNo=this.startPage;pNo<=this.endPage;pNo++) {
				pagingArea +="<li class='paginate_button page-item ";
					if(this.currentPage==pNo) {
						pagingArea +="is_active";
					}
				pagingArea +="'>";
				pagingArea +="<a href='"+this.url+"?keyword="+this.keyword+"&currentPage="+pNo+"&sort="+this.sort+"' ";
				pagingArea +="aria-controls='dataTable' data-dt-idx='1' tabindex='0' ";
				pagingArea +="class='page-link'>"+pNo+"</a></li>";
			}
			pagingArea +="<li class='paginate_button page-item next nextPage ";
				if(this.endPage>=this.totalPages) {
					pagingArea +="disabled";
				}
			pagingArea +="' id='dataTable_next'><a href='"+this.url+"?keyword="+this.keyword+"&currentPage="+(this.startPage+this.size)+"&sortBy="+this.sort+"' "; 
			pagingArea +="aria-controls='dataTable' data-dt-idx='7' tabindex='0' ";
			pagingArea +="class='page-link'>다음</a></li></ul></div></div>";
			
			return pagingArea;
		}

		//페이징 블록을 자동화
		public String getPagingArea6() {
			String pagingArea = "";
			
			if(this.sort == null) {
				this.sort = "";
			}
			System.out.println("#####startPage"+ startPage);
			System.out.println("#####endPage"+ endPage);
			pagingArea +="<div class='col-sm-12 col-md-7'>";					
			pagingArea +="<div class='pagination dataTables_paginate paging_simple_numbers' id='dataTable_paginate'>";
			pagingArea +="<ul class=''>";
			pagingArea +="<li class='paginate_button page-item previous prevPage ";
			if(this.startPage < endPage + 1) {
				pagingArea += "disabled";
			}
			pagingArea +="' id='dataTable_previous'>";
			pagingArea +="<a href='"+this.url+"?keyword="+this.keyword+"&currentPage="+(this.startPage-size)+"&sort="+this.sort+"'";
			pagingArea +="aria-controls='dataTable' data-dt-idx='0' tabindex='0'";
			pagingArea +="class='page-link'>이전</a></li>";
			
			for(int pNo=this.startPage;pNo<=this.endPage;pNo++) {
				pagingArea +="<li class='paginate_button page-item ";
				
				if(this.currentPage==pNo) {
					pagingArea +="is_active";
				}
				
				pagingArea +="'>";
				
				String queryStr = "";
				if(recruitLocation != null) {
					for(String str : recruitLocation) {
						queryStr += "&livingLocation=" + str;
					}
				}
				if(recruitJobs != null) {
					for(String str : recruitJobs) {
						queryStr += "&wishJobs=" + str;
					}
				}
				
				queryStr += "&currentPage="+pNo+"&sort="+this.sort;
				
				log.info("queryStr : {}", queryStr);
					
				pagingArea +="<a href='"+this.url+"?keyword="+this.keyword+ queryStr +"' ";
				pagingArea +="aria-controls='dataTable' data-dt-idx='1' tabindex='0' ";
				pagingArea +="class='page-link'>"+pNo+"</a></li>";
			}
			pagingArea +="<li class='paginate_button page-item next nextPage ";
				if(this.endPage>=this.totalPages) {
					pagingArea +="disabled";
				}
			pagingArea +="' id='dataTable_next'><a href='"+this.url+"?keyword="+this.keyword+"&currentPage="+(this.startPage+this.size)+"&sort="+this.sort+"' "; 
			pagingArea +="aria-controls='dataTable' data-dt-idx='7' tabindex='0' ";
			pagingArea +="class='page-link'>다음</a></li></ul></div></div>";
			
			return pagingArea;
		}
			
		//페이징 블록을 자동화
		public String getPagingArea7() {
			String pagingArea = "";
			
			if (this.total > 0) {
			
			if (this.keyword == null) {
		           this.keyword = "";
		       }
			
			log.info("startPageg"+startPage);
			log.info("pageSizeg"+pageSize);
			pagingArea +="<div class='col-sm-12 col-md-7'>";					
			pagingArea +="<div class='pagination dataTables_paginate paging_simple_numbers' id='dataTable_paginate'>";
			pagingArea +="<ul class=''>";
			pagingArea +="<li class='paginate_button page-item previous prevPage ";
			if(this.startPage<6) {
				pagingArea += "disabled";
			}
			pagingArea +="' id='dataTable_previous'>";
			pagingArea +="<a href='"+this.url+"?recruitNo="+this.recruitNo+"&currentPage="+(this.startPage-pageSize);
			pagingArea +="'aria-controls='dataTable' data-dt-idx='0' tabindex='0'";
			pagingArea +="class='page-link'>이전</a></li>";
			
			for(int pNo=this.startPage;pNo<=this.endPage;pNo++) {
				pagingArea +="<li class='paginate_button page-item ";
					if(this.currentPage==pNo) {
						pagingArea +="is_active";
					}
				pagingArea +="'>";
				pagingArea +="<a href='"+this.url+"?recruitNo="+this.recruitNo+"&keyword="+this.keyword+"&currentPage="+pNo;
				pagingArea +="'aria-controls='dataTable' data-dt-idx='1' tabindex='0' ";
				pagingArea +="class='page-link'>"+pNo+"</a></li>";
			}
			pagingArea +="<li class='paginate_button page-item next nextPage ";
				if(this.endPage>=this.totalPages) {
					pagingArea +="disabled";
				}
			pagingArea +="' id='dataTable_next'><a href='"+this.url+"?recruitNo="+this.recruitNo+"&keyword="+this.keyword+"&currentPage="+(this.startPage+this.pageSize); 
			pagingArea +="'aria-controls='dataTable' data-dt-idx='7' tabindex='0' ";
			pagingArea +="class='page-link'>다음</a></li></ul></div></div>";
			
			} else {
	           // 데이터가 없을 때는 페이지를 출력하지 않음
	           pagingArea = "";
			}
		
			return pagingArea;
		}


		 //페이징 블록을 자동화
		public String getPagingArea8() {
			String pagingArea = "";
			
			if(this.sort == null) {
				this.sort = "";
			}
			
			pagingArea +="<div class='col-sm-12 col-md-7'>";					
			pagingArea +="<div class='pagination dataTables_paginate paging_simple_numbers' id='dataTable_paginate'>";
			pagingArea +="<ul class=''>";
			pagingArea +="<li class='paginate_button page-item previous prevPage ";
			if(this.startPage<6) {
				pagingArea += "disabled";
			}
			pagingArea +="' id='dataTable_previous'>";
			pagingArea +="<a href='"+this.url+"?keyword="+this.keyword+"&currentPage="+(this.startPage-size)+"&sort="+this.sort+"'";
			pagingArea +="aria-controls='dataTable' data-dt-idx='0' tabindex='0'";
			pagingArea +="class='page-link'>이전</a></li>";
			
			for(int pNo=this.startPage;pNo<=this.endPage;pNo++) {
				pagingArea +="<li class='paginate_button page-item ";
					if(this.currentPage==pNo) {
						pagingArea +="is_active";
					}
				pagingArea +="'>";
				
				String queryStr = "";
				if(recruitWorkType != null) {
					for(String str : recruitWorkType) {
						queryStr += "&recruitWorkType=" + str;
					}
				}
				if(recruitLocation != null) {
					for(String str : recruitLocation) {
						queryStr += "&recruitLocation=" + str;
					}
				}
				if(recruitJobs != null) {
					for(String str : recruitJobs) {
						queryStr += "&recruitJobs=" + str;
					}
				}
				if(recruitAcdmCr != null) {
					for(String str : recruitAcdmCr) {
						queryStr += "&recruitAcdmCr=" + str;
					}
				}
				
				queryStr += "&currentPage="+pNo+"&sort="+this.sort;
				
				log.info("queryStr : {}", queryStr);
					
				pagingArea +="<a href='"+this.url+"?memId="+this.keyword+ queryStr +"' ";
				pagingArea +="aria-controls='dataTable' data-dt-idx='1' tabindex='0' ";
				pagingArea +="class='page-link'>"+pNo+"</a></li>";
			}
			pagingArea +="<li class='paginate_button page-item next nextPage ";
				if(this.endPage>=this.totalPages) {
					pagingArea +="disabled";
				}
			pagingArea +="' id='dataTable_next'><a href='"+this.url+"?memId="+this.keyword+"&currentPage="+(this.startPage+this.size)+"&sort="+this.sort+"' "; 
			pagingArea +="aria-controls='dataTable' data-dt-idx='7' tabindex='0' ";
			pagingArea +="class='page-link'>다음</a></li></ul></div></div>";
			
			return pagingArea;
		}
		
		
}


