package com.coupang_demo.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coupang_demo.dao.MemberDAO;
import com.coupang_demo.dto.MemberVO;

/**
 * Servlet implementation class JoinResultServlet
 */
@WebServlet("/joinResult")
public class JoinResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/testprint.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		Date date = Calendar.getInstance().getTime();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
		String strDate = dateFormat.format(date);
		
		MemberVO mVo = new MemberVO();
		
		mVo.setEmail(request.getParameter("email"));
		mVo.setPassword(request.getParameter("password"));
		mVo.setName(request.getParameter("name"));
		mVo.setPhone(request.getParameter("phone"));
		// 가입시에는 주소를 적지 않음
		mVo.setPostCode("");
		mVo.setAddress("");
		mVo.setJoinDate(strDate);
		mVo.setMemberGrade("Normal");
		
		request.setAttribute("inputInfo", mVo);
		
		String[] agree = request.getParameterValues("agree");
		request.setAttribute("agrees", agree);
		
		MemberDAO mDao = MemberDAO.getInstance();
		mDao.insertMember(mVo);
		
		List<MemberVO> memberList = mDao.selectAllMembers();
		request.setAttribute("memberList", memberList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/testprint.jsp");
		dispatcher.forward(request, response);
	}

}
