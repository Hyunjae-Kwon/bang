package bang.member.join;
  
import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bang.common.common.CommandMap;

@Controller
public class JoinController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "joinService")
	private JoinService joinService;

	@Resource(name = "mailService")
	private MailService mailService;
	
	/* 파일 업로드 중복 방지 */
    public static String getRandomString(){
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
    
    /* 파일 업로드 경로 [본인 경로로 변경 필요] */
	private static final String filePath = "/Users/felix/Pictures/profile/";

	/* 회원가입 폼 */
	@RequestMapping(value = "/joinForm.tr", method = RequestMethod.GET)
	public ModelAndView joinForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("join/joinForm");
		return mv;
	}

	/* id 중복 체크 */
	@RequestMapping(value = "/confirmId.tr", method = RequestMethod.POST)
	@ResponseBody
	public String confirmId(String id) throws Exception {

		log.info("id =" + id);

		int result = joinService.selectMemberIdCk(id);
		log.info(result);

		return String.valueOf(result);
	}
	
	/* Email 중복 체크 */
	@RequestMapping(value = "/confirmEmail.tr", method = RequestMethod.POST)
	@ResponseBody
	public String confirmEmail(String email) throws Exception {

		log.info("email =" + email);

		int result = joinService.selectMemberEmailCk(email);
		log.info(result);

		return String.valueOf(result);
	}
    
	/* 이메일 인증 */
	@RequestMapping(value = "/confirmMail.tr", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return mailService.joinEmail(email);
	}

	/* 회원가입완료 */
	@RequestMapping(value = "/joinSuccess.tr", method = RequestMethod.POST)
	public ModelAndView insertMember(@RequestParam("MEM_IMAGE") MultipartFile file, CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/join/joinSuccess");

		/* 파일 업로드 */
		String originalFileName = null;
	    String originalFileExtension = null;
	    String storedFileName = null;
	     
	    int MEM_IMAGE = (int)file.getSize();
	     
	    if(MEM_IMAGE!=0) {
	         originalFileName = file.getOriginalFilename();
	         originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
	         storedFileName = getRandomString() + originalFileExtension;
		}
		
		/* 회원가입 성공 */
		mv.addObject("msg", "회원가입 성공!");
		mv.addObject("url", "/bang/loginForm.tr");

		joinService.insertMember(commandMap.getMap());

		/* 프로필 이미지 미등록시 profile.png 자동 등록 */
		if(MEM_IMAGE!=0) {
			 File f = new File(filePath + storedFileName);
			 file.transferTo(f);
		 	 }
		 	 else {
		 		storedFileName = "profile.png";
		 	 }
			 commandMap.put("MEM_IMAGE", storedFileName);
			 joinService.updateImg(commandMap.getMap());
		
		return mv;
	}

}
