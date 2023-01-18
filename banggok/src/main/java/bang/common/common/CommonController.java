package bang.common.common;

import java.io.File;
import java.io.PrintWriter;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {
	Logger log = Logger.getLogger(this.getClass());
	private static final String tempFilePath = "C:\\comm\\tempImages\\";
	private static final String realFilePath = "C:\\comm\\boardImages\\";

	@RequestMapping(value="/GetTempFile.tr") // 게시판 작성시 임시 저장파일 다시 받아가기 과정
	public void getTempFile(CommandMap commandMap, HttpServletResponse response) throws Exception{
		Map<String,Object> map = commandMap.getMap();
		String storedFileName = (String)map.get("filename");
		
		byte fileByte[] = FileUtils.readFileToByteArray(new File(tempFilePath+storedFileName));
		
		response.setContentType("image/jpeg");
		response.setContentLength(fileByte.length);
		response.getOutputStream().write(fileByte);
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
	@RequestMapping(value="/GetFile.tr") // 게시판 작성후 임시파일을 본 경로로 옮긴 후 받아가기 내용
	public void getFile(CommandMap commandMap, HttpServletResponse response) throws Exception{
		Map<String,Object> map = commandMap.getMap();
		String storedFileName = (String)map.get("filename");
		String category = (String)map.get("cate");
		String articleId = (String)map.get("idx");
		byte fileByte[] = null;
		try {
			fileByte = FileUtils.readFileToByteArray(new File(realFilePath+"\\"+category+"\\"+articleId+"\\"+storedFileName));
		} catch(Exception e) {
			fileByte = FileUtils.readFileToByteArray(new File(realFilePath+"\\noimgtoshow.gif"));
		}
		
		response.setContentType("image/jpeg");
		response.setContentLength(fileByte.length);
		response.getOutputStream().write(fileByte);
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
	
	/* 이미지 불러오는 부분 */
	@RequestMapping(value="/GetTempFileUrl.tr")
	public void getTempFileUrl(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String resultUrl = bang.common.common.FileUtils.getTempFileUrl(request);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");

		PrintWriter out = response.getWriter();
		out.print(resultUrl);
		System.out.println(resultUrl);
	}
	
	
}
