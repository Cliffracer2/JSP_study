package com.doge.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doge.dao.BoardDAO;
import com.doge.dto.BoardVO;

public class BoardCheckPassAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = null;
		
		String num = request.getParameter("num");
		String pass = request.getParameter("pass");
		
		String delete = request.getParameter("delete");
		String update = request.getParameter("update");
		
		System.out.println("BoardCheckPassAction delete: " + delete + ", update: " + update);
		
		BoardDAO bDao = BoardDAO.getInstance();
		BoardVO bVo = bDao.selectOneBoardByNum(num);
		
		if (bVo.getPass().equals(pass)) {
			//url = "/board/checkSuccess.jsp";
			if (delete != null) {
				url = "BoardServlet?command=board_delete&num=" + num;
			}
			if (update != null) {
				url = "BoardServlet?command=board_update_form&num=" + num;
			}
		} else {
			//url = "/board/boardCheckPass.jsp";
			//url = "/board/boardView.jsp";
			url = "BoardServlet?command=board_view&num=" + num;
			request.setAttribute("message", "비밀번호가 틀렸습니다.");
		}
		
		System.out.println("BoardCheckPassAction num: " + num + ", pass: " + pass + ", url: " + url);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
	
}
