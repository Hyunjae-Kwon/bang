package bang.common.common;

public class ScrollPaging {
	public void Paging(int totalRow) {
		/* 한 페이지에 표시할 게시글 개수 */
		int rowCount = 9;
		/* 첫 페이지 초기값 1 */
		int pageNum = 1;
		/* 페이지 시작 게시물 번호 */
	    int startRowNum = 1 + (pageNum - 1) * rowCount;
	    /* 페이지 끝 게시물 번호 */
	    int endRowNum = pageNum * rowCount;
	    
	    ScrollPagingTO spto = new ScrollPagingTO();
	    spto.setStartRowNum(startRowNum);
	    spto.setEndRowNum(endRowNum);
	    spto.setRowCount(rowCount);
	    
	    /* 전체 페이지 개수 */
	    int totalPageCount = (int) Math.ceil(totalRow / (double) rowCount);
	    System.out.println(pageNum);
	    System.out.println(startRowNum);
	    System.out.println(endRowNum);
	    System.out.println(totalPageCount);
	}
}