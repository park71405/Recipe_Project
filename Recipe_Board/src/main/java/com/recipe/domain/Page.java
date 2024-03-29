package com.recipe.domain;

public class Page {

	// 현재 페이지 번호
	private int num;
	// 게시물 총 개수
	private int count;
	// 한 페이지에 출력할 게시물 개수
	private int postNum = 10;
	// 하단 페이징 번호
	private int pageNum;
	// 출력할 게시물
	private int displayPost;
	// 한번에 표시할 페이징 번호 개수
	private int pageNumCnt = 5;
	// 표시되는 페이지 번호 중 마지막 번호
	private int endPageNum;
	// 표시되는 페이지 번호 중 첫 번호
	private int startPageNum;
	// 다음/이전 표시 여부
	private boolean prev;
	private boolean next;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
		dataCalc();
	}

	public int getPostNum() {
		return postNum;
	}

	public int getPageNum() {
		return pageNum;
	}

	public int getDisplayPost() {
		return displayPost;
	}

	public int getPageNumCnt() {
		return pageNumCnt;
	}

	public int getEndPageNum() {
		return endPageNum;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public boolean getPrev() {
		return prev;
	}

	public boolean getNext() {
		return next;
	}

	private void dataCalc() {
		// 마지막 번호
		endPageNum = (int) (Math.ceil((double) num / (double) pageNumCnt) * pageNumCnt);
		// 시작 번호
		startPageNum = endPageNum - (pageNumCnt - 1);
		// 마지막 번호 재계산
		int endPageNum_tmp = (int) (Math.ceil((double) count / (double) pageNumCnt));

		if (endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}

		prev = startPageNum == 1 ? false : true;
		next = endPageNum * pageNumCnt >= count ? false : true;

		displayPost = (num - 1) * postNum;
	}

	// 요리 후기검색 타입 검색어
	public String getRvSearchTypeKeyword() {
		if (searchType.equals("") || keyword.equals("")) {
			return "";
		} else {
			return "&reviewSearchType=" + searchType + "&rv_keyword=" + keyword;
		}
	}

	private String searchType;
	private String keyword;

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getKeyword() {
		return keyword;
	}

	// QA 후기검색 타입 검색어
	public String getQaSearchTypeKeyword() {
		if (searchType.equals("") || keyword.equals("")) {
			return "";
		} else {
			return "&qa_searchType=" + searchType + "&qa_keyword=" + keyword;
		}
	}

	// 레시피검색 타입 검색어
	public String getRcpSearchTypeKeyword() {
		if (searchType.equals("") || keyword.equals("")) {
			return "";
		} else {
			return "&rcpSearchType=" + searchType + "&rcpKeyword=" + keyword;
		}
	}

	// Notice 검색 타입 검색어
	public String getNoticeSearchTypeKeyword() {
		if (searchType.equals("") || keyword.equals("")) {
			return "";
		} else {
			return "&noSearchType=" + searchType + "&no_keyword=" + keyword;
		}
	}

	// 냉장고 검색 타입 검색어
	public String getRefriSearchTypeKeyword() {
		if (searchType.equals("") || keyword.equals("")) {
			return "";
		} else {
			return "&refriSearchType=" + searchType + "&refri_keyword=" + keyword;
		}
	}
}
