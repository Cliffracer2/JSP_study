package com.doge.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doge.dao.BoardDAO;
import com.doge.dto.BoardVO;

public class BoardUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardVO bVo = new BoardVO();
		int num = Integer.parseInt(request.getParameter("num"));
		
		bVo.setNum(num);
		bVo.setName(request.getParameter("name"));
		bVo.setPass(request.getParameter("pass"));
		bVo.setEmail(request.getParameter("email"));
		bVo.setTitle(request.getParameter("title"));
		bVo.setContent(request.getParameter("content"));
		
		BoardDAO bDao = BoardDAO.getInstance();
		bDao.updateBoard(bVo);
		
		//new BoardListAction().execute(request, response);
		//response.sendRedirect("BoardServlet?command=board_list");
		response.sendRedirect("BoardServlet?command=board_view&num=" + num);
	}
}
