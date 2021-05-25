package com.doge.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doge.dao.BoardDAO;
import com.doge.dto.BoardVO;
import com.doge.dto.ReplyVO;

public class BoardViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String url = "/board/boardView.jsp";
//		String num = request.getParameter("num");
//		
//		BoardDAO bDao = BoardDAO.getInstance();
//		
//		bDao.updateReadCount(num);
//		
//		BoardVO bVo = bDao.selectOneBoardByNum(num);
//		
//		request.setAttribute("board", bVo);
//		
//		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
//		dispatcher.forward(request, response);
		
		String url="/board/boardView.jsp";
		
		String num = null;
		
		Cookie[] cookies = request.getCookies();
		int visitor = 0;
		
		if(request.getParameter("num") != null){
			 num = request.getParameter("num");
		}		
		
		if(request.getAttribute("num") != null){
			num = (String)request.getAttribute("num");
		};
		
		int pNum = Integer.parseInt(num);
		
		BoardDAO bDao = BoardDAO.getInstance();
		
		// 쿠키를 이용하여 같은페이지 조회수 증가 방지
		for (Cookie cookie : cookies) {
			System.out.println(cookie.getName());
			
			if (cookie.getName().equals("visit")) {
				visitor = 1;
				System.out.println("is alreay exist cookies");
				// 게시판 번호 값이 쿠키에 존재하는 경우
				if (cookie.getValue().contains(num)) {
					System.out.println("pass visit so that's not increase readcount");
				} else {
					System.out.println("add cookie:" + num);
					cookie.setValue(cookie.getValue() + "_" + num);
					response.addCookie(cookie);
					bDao.updateReadCount(num);
				}
			}
		}
		
		// 쿠키가 아예 존재하지 않는 경우
		if (visitor == 0) {
			Cookie cookieCreate = new Cookie("visit", num);
			response.addCookie(cookieCreate);
			bDao.updateReadCount(num);
			System.out.println("create cookie: " + num);
		}

		//bDao.updateReadCount(num);
		
		BoardVO bVo = bDao.selectOneBoardByNum(num);	
		request.setAttribute("board", bVo);
		
		List<ReplyVO> replyList = bDao.selectAllReplys(pNum);
		request.setAttribute("replyList", replyList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
