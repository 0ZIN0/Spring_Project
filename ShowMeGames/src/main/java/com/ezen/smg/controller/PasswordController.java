//package com.ezen.smg.controller;
//
//import java.io.IOException;
//import java.util.Random;
//
//import javax.mail.internet.MimeMessage;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.mail.javamail.MimeMessageHelper;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.ezen.smg.dto.SmgUsersDTO;
//import com.ezen.smg.mapper.LoginMapper;
//
//@Controller
//public class PasswordController {
//
//	@Autowired
//	private JavaMailSender mailSender; // JavaMailSender 빈이 Spring 구성에서 적절히 정의되어야 합니다.
//
//	@Autowired
//	private LoginMapper loginMapper; // LoginMapper 주입
//
//	@RequestMapping(value = "/pw_auth.me")
//	public ModelAndView pw_auth(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
//		String user_id = (String) request.getParameter("user_id");
//		String user_name = (String) request.getParameter("user_name");
//
//		SmgUsersDTO vo = loginMapper.getSelectUser(user_id);
//
//		if (vo != null) {
//			Random r = new Random();
//			int num = r.nextInt(999999); // 랜덤난수설정
//
//			if (vo.getUser_name().equals(user_name)) { // 변수 이름을 'name'에서 'user_name'으로 수정하였습니다.
//				session.setAttribute("email", vo.getEmail());
//
//				String setfrom = "ivedot@naver.com"; // naver 
//				String tomail = vo.getEmail(); //받는사람
//				String title = "[삼삼하개] 비밀번호변경 인증 이메일 입니다"; 
//				String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
//						+ "삼삼하개 비밀번호찾기(변경) 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); // 
//
//				try {
//					MimeMessage message = mailSender.createMimeMessage();
//					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
//
//					messageHelper.setFrom(setfrom); 
//					messageHelper.setTo(tomail); 
//					messageHelper.setSubject(title);
//					messageHelper.setText(content); 
//
//					mailSender.send(message);
//				} catch (Exception e) {
//					System.out.println(e.getMessage());
//				}
//
//				ModelAndView mv = new ModelAndView();
//				mv.setViewName("YM/pw_auth");
//				mv.addObject("num", num);
//				return mv;
//			} else {
//				ModelAndView mv = new ModelAndView();
//				mv.setViewName("YM/pw_find");
//				return mv;
//			}
//		} else {
//			ModelAndView mv = new ModelAndView();
//			mv.setViewName("YM/pw_find");
//			return mv;
//		}
//	}
//	
//	@RequestMapping(value = "/pw_set.me", method = RequestMethod.POST)
//	public String pw_set(@RequestParam(value="email_injeung") String email_injeung,
//				@RequestParam(value = "num") String num) throws IOException{
//			
//			if(email_injeung.equals(num)) {
//				return "YM/pw_new";
//			}
//			else {
//				return "YM/pw_find";
//			}
//	} //이메일 인증번호 확인
//	
//	@RequestMapping(value = "/pw_new.me", method = RequestMethod.POST)
//    public String pw_new(@RequestParam("user_id") String user_id, @RequestParam("user_pw") String user_pw, HttpSession session) throws IOException {
//        SmgUsersDTO vo = loginMapper.getSelectUser(user_id);
//        
//        if (vo != null) {
//            vo.setUser_pw(user_pw); // 새로운 비밀번호 설정
//
//            // LoginMapper를 통해 비밀번호 업데이트 쿼리를 실행
//            int result = loginMapper.pwUpdate_M(vo);
//            
//            // 성공적으로 비밀번호가 업데이트되었을 경우 1 반환, 실패한 경우 0 반환
//            return result == 1 ? "jj/loginForm" : "YM/pw_new";
//        } else {
//            System.out.println("사용자를 찾을 수 없습니다.");
//            return "YM/pw_find"; // 사용자를 찾을 수 없을 경우 비밀번호 찾기 폼으로 이동
//        }
//    }
//}