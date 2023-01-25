package bang.common.common;

public class ScrollPagingTO {
	/* 페이지 시작 게시물 번호 */
	private int startRowNum;
	/* 페이지 끝 게시물 번호 */
	private int endRowNum;
	/* 한 페이지에 표시할 게시글 개수 */
	private int rowCount;
	
	public int getRowCount() {
		return rowCount;
	}
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}
	public int getStartRowNum() {
		return startRowNum;
	}
	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}
	public int getEndRowNum() {
		return endRowNum;
	}
	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}
}