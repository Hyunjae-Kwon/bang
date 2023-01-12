package bang.common.review;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import bang.common.common.CommandMap;

/* Controller 객체임을 선언 */
@Controller
public class ReviewController {

	/* 로그 출력 */
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "reviewService")
	private ReviewService reviewService;
	
	/* 여행 후기 리스트 */
	@RequestMapping(value = "/reviewList.tr")	/* reviewList.tr url을 요청 */
	public ModelAndView reviewList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("review/reviewList");	/* 화면에 보여줄 reviewList.jsp파일을 의미함 */
		
		List<Map<String,Object>> reviewList = reviewService.reviewList(commandMap.getMap());
		
		mv.addObject("reviewList", reviewList);
		
		return mv;
	}

	/* 여행 후기 디테일 */
	@RequestMapping(value = "/reviewDetail.tr")	/* reviewList.tr url을 요청 */
	public ModelAndView reviewDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("review/reviewDetail");	/* 화면에 보여줄 reviewList.jsp파일을 의미함 */
		
		/* 여행후기 디테일 */
		List<Map<String,Object>> reviewDetail = reviewService.reviewDetail(commandMap.getMap());
		
		/* 여행후기 댓글 리스트*/
		List<Map<String, Object>> reviewCommentList = reviewService.reviewCommentList(commandMap.getMap());
		
		mv.addObject("reviewDetail", reviewDetail);
		mv.addObject("reviewCommentList", reviewCommentList);
		
		return mv;
	}
	
	/* 여행후기 글쓰기 폼 */
	@RequestMapping(value="/reviewWriteForm.tr")
	public ModelAndView reviewWriteForm(CommandMap commandMap , HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("review/reviewWriteForm");

		return mv;
	}

	/* 여행후기 글쓰기 */
	@RequestMapping(value="/reviewWrite.tr", method = RequestMethod.POST)
	public ModelAndView reviewWrite(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/reviewList.tr");

		reviewService.insertReview(commandMap.getMap());

		HttpSession session = request.getSession();
		String RV_ID = (String) session.getValue("MEM_ID");
		session.setAttribute("RV_ID", RV_ID);
		return mv;
	}
	
	
	/* 여행후기 수정 폼 */
	@RequestMapping(value="/reviewModifyForm.tr") 
	public ModelAndView reviewModifyForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/review/reviewModifyForm");
		Map<String, Object> map = reviewService.reviewModifyForm(commandMap.getMap());

		mv.addObject("review", map);

		return mv;
	}
	
	/* 여행후기 수정 */
	@RequestMapping(value="/reviewModify.tr", method = RequestMethod.POST)
	public ModelAndView reviewModify(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/reviewList.tr");
		
		reviewService.reviewModify(commandMap.getMap());

		return mv;
	}
	
	/* 여행후기 삭제 */
	@RequestMapping(value = "/reviewDel.tr")
	public ModelAndView reviewDel(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/reviewList.tr");
		
		reviewService.reviewDel(commandMap.getMap());

		return mv;      
	}
	
	/* summernote 파일 업로드 (진행중) ※에러날시 주석처리 해주세요※ */
	@RequestMapping(value="/uploadSummernoteImageFile.tr", produces = "application/json; charset=utf8", method = RequestMethod.POST)
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request, CommandMap commandMap )  {
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		/* 내부경로로 저장 */
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"/images/fileupload/";
		
		/* 오리지날 파일명과 파일 확장자를 분리 */
		String originalFileName = multipartFile.getOriginalFilename();	/* 오리지날 파일명 */
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	/* 파일 확장자 */
		/* UUID.randomUUID() 함수를 통해 고유의 이름으로 바꾸어 저장합니다.
		 * (추후 중복 이름 때문에 파일이 덮어 써지거나 저장이 안 되는 걸 방지하기 위해서) */
		String savedFileName = UUID.randomUUID() + extension;	/* 저장될 파일 명 */
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();	/* inputstream으로 파일을 저장합니다. */
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	/* 파일 저장 */
			/* 저장한 이미지를 보여줘야 하므로 json형태로 url : 파일 이름으로 jsonobject에 저장합니다. */
			jsonObject.addProperty("url", "/resources/images/fileupload/"+savedFileName); /* contextroot + resources + 저장할 내부 폴더명 */
			jsonObject.addProperty("responseCode", "success");
		
		} catch (IOException e) {
			/*  파일 저장을 시도하는데 에러가 나면 파일을 삭제합니다. */
			FileUtils.deleteQuietly(targetFile);	/* 저장된 파일 삭제 */
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		/*  Responsebody를 통해 json 형태의 string이 성공적으로 return 되면 ajax의 success부분이 실행되고,
		 *  editor.insertimage를 통해 서머 노트에 저장된 이미지가 불러와집니다. */
		String a = jsonObject.toString();
		return a;
	}
	
}
