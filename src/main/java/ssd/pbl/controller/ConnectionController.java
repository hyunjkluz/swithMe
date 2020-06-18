/**
 * 
 */
package ssd.pbl.controller;

import java.util.Arrays;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import ssd.pbl.model.RequestTeacher;
import ssd.pbl.model.StudentRequest;
import ssd.pbl.service.ClassService;
import ssd.pbl.service.ConnectionService;
import ssd.pbl.service.TeacherService;

/**
 * @author kimhyunjin
 * @date: May 22, 2020 3:10:56 AM
 */
@Controller
public class ConnectionController {
	private static final Logger LOGGER = LoggerFactory.getLogger(ConnectionController.class);

	@Autowired
	private ClassService classService;
	@Autowired
	private ConnectionService connectionService;
	@Autowired
	private TeacherService teacherService;

	// 수업 상세보기 > 수업 요청 전송
	@RequestMapping(value = "/class/{classId}/request", method = RequestMethod.POST)
	public ModelAndView postClassNewRequest(@PathVariable int classId, HttpServletRequest request) {
		UserSession userSession = (UserSession) WebUtils.getSessionAttribute(request, "userSession");
		LOGGER.info("로그인된 유저 정보 : " + userSession.getId());

		if (!userSession.getType().equals("student")) {
			return new ModelAndView("main/FindClass");
		}
		ModelAndView mav = new ModelAndView("match/ClassRequestFinish");
		
		Map<String, Integer> classDetailId = classService.getTeacherAndSubjectByClassId(classId);
		Integer teacherId = Integer.parseInt(String.valueOf(classDetailId.get("teacherId")));
		Integer subjectId = Integer.parseInt(String.valueOf(classDetailId.get("subjectId")));
		
		Integer connectionId = connectionService.postConnection(userSession.getId(), teacherId, subjectId, null);
		
		String teacherName = teacherService.getTeacherByid(teacherId).getName();
		
		mav.addObject("name", teacherName);
 
		return mav;
	}

	// 나의 수업-학생
	@RequestMapping(value = "/connection/student", method = RequestMethod.GET)
	public String getAllStudentConnection(Model model, HttpSession session) {
		LOGGER.info("ConnectionController2-getAllStudentConnection");
		UserSession userSession = (UserSession) session.getAttribute("userSession");
//		String email = userSession.getId();

		// model.addAttribute("connectionList",
		// connectionService.getConnectionlist(sid));
		return "board/MyClassList";
	}

	// 나의 수업-선생님
	@RequestMapping(value = "/connection/teacher", method = RequestMethod.GET)
	public String getAllTeacherConnection(Model model) {
		LOGGER.info("ConnectionController2-getAllTeacherConnection");
		model.addAttribute("connectionList", null);
		return "board/MyClassList";
	}

	// 요청정보 > JSON
	@RequestMapping(value = "/connection/{connectionId}/detail", method = RequestMethod.GET)
	@ResponseBody
	public StudentRequest getStudentRequestDetail(@PathVariable int connectionId) {
		return connectionService.getStudentRequestByConnectionId(connectionId);
	}

	@RequestMapping(value = "/connection/{connectionId}/teacher/detail", method = RequestMethod.GET)
	@ResponseBody
	public RequestTeacher getRequestTeacherDetail(@PathVariable int connectionId) {
		return connectionService.getResuestTeacherByConnectionId(connectionId);
	}

	// 커넥션 상태 변경
	@RequestMapping(value = "/connection/{connectionId}/step", method = RequestMethod.GET)
	public String changeConnectionState(@PathVariable int connectionId, @RequestParam("step") String step,
			@RequestParam("type") String type) {
		String[] states = { "REJECT", "MATCH", "FINISH", "CLASS", "REVIEW" };

		if (Arrays.stream(states).anyMatch(step::equals)) {

			LOGGER.info(connectionId + " / " + step + " / " + type);

			connectionService.putConnectionState(connectionId, step);
			if (type.equals("teacher")) {
				return "redirect:http://localhost:8080/swithMe/mypage/teacher.do";
			}
			if (type.equals("student")) {
				return "redirect:http://localhost:8080/swithMe/mypage/student.do";
			}
		}

		return "redirect:http://localhost:8080/swithMe/main/class";

	}

}
