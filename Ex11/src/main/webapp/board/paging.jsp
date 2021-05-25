<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
	public Integer toInt(String x) {
		int a = 0;
		
		try{
			a = Integer.parseInt(x);
		}catch (Exception e) {}
		
		return a;
	}
%>
<%
	int pageno = toInt(request.getParameter("pageno"));

	if(pageno < 1) {
		pageno = 1;
	}
	
	int total_record = (int)request.getAttribute("recordCount");
	int page_per_record_cnt = 10;
	int group_per_page_cnt = 5;								

	int record_end_no = pageno * page_per_record_cnt;
	int record_start_no = record_end_no - (page_per_record_cnt - 1);
	
	if (record_end_no>total_record) {
		record_end_no = total_record;
	}

	int total_page = total_record / page_per_record_cnt + ((total_record % page_per_record_cnt) > 0 ? 1 : 0);
	
	if(pageno>total_page) {
		pageno = total_page;
	}

	int group_no = (pageno / group_per_page_cnt) + (pageno%group_per_page_cnt > 0 ? 1 : 0);
	int page_eno = group_no * group_per_page_cnt;
	int page_sno = page_eno - (group_per_page_cnt - 1);

	if (page_eno>total_page) {
		page_eno = total_page;
	}
	
	int prev_pageno = page_sno - group_per_page_cnt;
	int next_pageno = page_sno + group_per_page_cnt;
	
	if(prev_pageno < 1) {
		prev_pageno = 1;
	}
	
	if(next_pageno > total_page) {
		next_pageno = total_page / (group_per_page_cnt*group_per_page_cnt + 1);
	}
%>
<%--
현재 페이지   (pageno)   : <%=pageno%><br />
전체 데이터 수   (total_record) : <%=total_record %><br />
한페이지 당 레코드 수   (page_per_record_cnt) : <%=page_per_record_cnt %><br />
한페이지 당 보여줄 페지 번호 수   (group_per_page_cnt) : <%=group_per_page_cnt %><br />

<hr />
레코드 시작 번호  (record_start_no) : <%=record_start_no%><br />
레코드 끝 번호    (record_end_no) : <%=record_end_no %><br />
전체페이지 수     (total_page)  : <%=total_page %><br />
<hr />
현재 그룹번호 [1] (group_no):  <%=group_no %><br />
현재 그룹 시작 번호(page_sno): <%= page_sno%><br />
현재 그룹 끝 번호  (page_eno): <%= page_eno%><br />
이전 페이지 번호   (prev_pageno) <%=prev_pageno%><br />
다음 페이지 번호   (next_pageno) <%=next_pageno%><br />
<hr />
--%>

<a href="BoardServlet?command=board_list&pageno=1">[<<]</a>
<a href="BoardServlet?command=board_list&pageno=<%=prev_pageno%>">[이전]</a> 
<%for (int i = page_sno; i <= page_eno; i++) {%>
	<a href="BoardServlet?command=board_list&pageno=<%=i %>">
		<%if (pageno == i){ %>
			[<%=i %>]
		<%}else{ %>
			<%=i %>
		<%} %>
	</a> 
<%--	콤마	 --%>	
	<%if (i < page_eno) { %>
		,
	<%} %>
<%} %>
 
<a href="BoardServlet?command=board_list&pageno=<%=next_pageno%>" >[다음]</a>
<a href="BoardServlet?command=board_list&pageno=<%=total_page %>">[>>]</a>