package bang.admin.admin;
 
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bang.common.comment.CommentService;
import bang.common.common.CommandMap;
import bang.common.recommend.RecommendService;
import bang.common.review.ReviewService;
import bang.common.together.TogetherService;
import bang.common.trip.TripService;
import bang.member.mypage.MyPageService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
 
@Controller
public class AdminController {
	
Logger log = Logger.getLogger(this.getClass());

	/* 관리자 */
	@Resource(name="adminService")
	private AdminService adminService;
	
	/* 여행 일정 */
	@Resource(name="tripService")
	private TripService tripService;
	
	/* 여행 후기 */
	@Resource(name="reviewService")
	private ReviewService reviewService;
	
	/* 여행지 추천 */
	@Resource(name="recommendService")
	private RecommendService recommendService;
	
	/* 동행 구하기 */
	@Resource(name="togetherService")
	private TogetherService togetherService;
	
	/* 마이페이지 */
	@Resource(name="myPageService")
	private MyPageService myPageService;
	
	/* 댓글 */
	@Resource(name="commentService")
	private CommentService commentService;
	
	/* 관리자 페이지 */
	@RequestMapping(value="/adminPage.tr")
	public ModelAndView adminPage(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/adminPage");
		
		return mv;
	}
	
	/* 여행 일정 공유 게시판 관리 */
	@RequestMapping(value="/adminTripList.tr")
	public ModelAndView adminTripList(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("admin/adminTripList");
		
		Map<String, Object> trip = tripService.adminTripList(map.getMap());
		
		mv.addObject("paginationInfo", (PaginationInfo)trip.get("paginationInfo"));
		mv.addObject("trip", trip.get("result"));
		
		return mv;
	}
	
	/* 여행 후기 게시판 관리 */
	@RequestMapping(value="/adminReviewList.tr")
	public ModelAndView adminReviewList(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("admin/adminReviewList");
		
		Map<String, Object> review = reviewService.adminReviewList(map.getMap());
		
		mv.addObject("paginationInfo", (PaginationInfo)review.get("paginationInfo"));
		mv.addObject("review", review.get("result"));
		
		return mv;
	}
	
	/* 동행 구하기 게시판 관리 */
	@RequestMapping(value="/adminTogetherList.tr")
	public ModelAndView adminTogetherList(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("admin/adminTogetherList");
		
		Map<String, Object> together = togetherService.adminTogetherList(map.getMap());
		
		mv.addObject("paginationInfo", (PaginationInfo)together.get("paginationInfo"));
		mv.addObject("together", together.get("result"));
		
		return mv;
	}
	
	/* 여행지 추천 게시판 관리 */
	@RequestMapping(value="/adminRecommendList.tr")
	public ModelAndView adminRecommendList(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("admin/adminRecommendList");
		
		Map<String, Object> recommend = recommendService.adminRecommendList(map.getMap());
		
		mv.addObject("paginationInfo", (PaginationInfo)recommend.get("paginationInfo"));
		mv.addObject("recommend", recommend.get("result"));
		
		return mv;
	}
	
	/* 회원 관리 목록 */
	@RequestMapping(value="/adminMemberList.tr")
	public ModelAndView adminMemberList(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("admin/adminMemberList");
		
		Map<String, Object> member = adminService.adminMemberList(map.getMap());
		
		mv.addObject("paginationInfo", (PaginationInfo)member.get("paginationInfo"));
		mv.addObject("member", member.get("result"));
		
		return mv;
	}
	
	/* 회원 정보 수정 폼 */
	@RequestMapping(value="/adminMemberModifyForm.tr")
	public ModelAndView adminMemberModifyForm(CommandMap map, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("admin/adminMemberModifyForm");
		
		Map<String, Object> member = myPageService.selectMemberId(map.getMap());
		
		mv.addObject("member", member);
		
		return mv;
	}
	
	/* 회원 정보 수정 기능 */
	@RequestMapping(value = "/adminMemberModify.tr", method = RequestMethod.POST)
	public ModelAndView adminMemberModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/adminMemberList.tr");
		
		myPageService.updateMember(commandMap.getMap(), request);
		
		return mv;
	}
	
	/* 회원 탈퇴 기능 */
	@RequestMapping(value = "/adminMemberDelete.tr", method = RequestMethod.POST)
	public ModelAndView adminMemberDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/adminMemberList.tr");
		
		myPageService.deleteMember(commandMap.getMap());
		
		return mv;
	}
	
	/* 신고 관리 */
	@RequestMapping(value="/adminReportList.tr")
	public ModelAndView adminReportList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/adminReportList");
		
		Map<String, Object> report = adminService.adminReportList(commandMap.getMap());
		
		mv.addObject("paginationInfo", (PaginationInfo)report.get("paginationInfo"));
		mv.addObject("report", report.get("result"));
		
		return mv;
	}
	
	/* 신고 상세보기 */
	@RequestMapping(value="/adminReportDetail.tr")
	public ModelAndView adminReportDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/adminReportDetail");
		
		String type = (String) commandMap.get("RP_TYPE");
		String rType = (String) commandMap.get("RP_RTYPE");
		String boardNum = (String)commandMap.get("RP_RNUM");
		
		Map<String, Object> board;
		
		if(type.equals("B")) {
			if(rType.equals("T")) {
				commandMap.put("TR_NUM", boardNum);
				board = tripService.tripDetail(commandMap.getMap());
				mv.addObject("board", board);
			} else if(rType.equals("W")) {
				commandMap.put("TG_NUM", boardNum);
				board = togetherService.togetherDetail(commandMap.getMap());
				mv.addObject("board", board);
			} else if(rType.equals("R")) {
				commandMap.put("RV_NUM", boardNum);
				board = reviewService.reviewDetail(commandMap.getMap());
				mv.addObject("board", board);
			}
		} else if(type.equals("C")) {
			commandMap.put("BC_BCID", boardNum);
			board = commentService.commentDetail(commandMap.getMap());
			mv.addObject("board", board);
		}
		
		Map<String, Object> report = adminService.adminReportDetail(commandMap.getMap());
		
		mv.addObject("report", report);
		
		return mv;
	}
}
