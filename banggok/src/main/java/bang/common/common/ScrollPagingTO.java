package bang.common.common;

public class ScrollPagingTO {
	/* 시작 게시물 번호 */
	private int startRowNum;
	/* 끝 게시물 번호 */
	private int endRowNum;
	/* 가져갈 게시물 갯수 */
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