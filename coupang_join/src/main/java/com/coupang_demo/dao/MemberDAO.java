package com.coupang_demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.coupang_demo.dto.MemberVO;

import util.DBManager;

public class MemberDAO {
	private MemberDAO() {}
	
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance; 
	}
	
	public List<MemberVO> selectAllMembers() {
		String sql = "select * from coupang_member order by member_number desc";
		List<MemberVO> list = new ArrayList<MemberVO>(); // upcasting
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberVO mVo = new MemberVO();
				mVo.setMemberNumber(rs.getInt("member_number"));
				mVo.setEmail(rs.getString("email"));
				mVo.setPassword(rs.getString("password"));
				mVo.setName(rs.getString("name"));
				mVo.setPhone(rs.getString("phone"));
				mVo.setPostCode(rs.getString("postcode"));
				mVo.setAddress(rs.getString("address"));
				mVo.setJoinDate(rs.getString("joindate"));
				mVo.setMemberGrade(rs.getString("membergrade"));
				list.add(mVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	// create r u d
	public void insertMember(MemberVO mVo) {
		String sql = "insert into coupang_member values(member_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mVo.getEmail());
			pstmt.setString(2, mVo.getPassword());
			pstmt.setString(3, mVo.getName());
			pstmt.setString(4, mVo.getPhone());
			pstmt.setString(5, mVo.getPostCode());
			pstmt.setString(6, mVo.getAddress());
			pstmt.setString(7, mVo.getJoinDate());
			pstmt.setString(8, mVo.getMemberGrade());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	// c read u d
	public MemberVO selectMemberByEmail(String email) {
		String sql = "select * from coupang_member where email=?";
		MemberVO mVo = null;
		
		try {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				mVo = new MemberVO();
				mVo.setMemberNumber(rs.getInt("member_number"));
				mVo.setEmail(rs.getString("email"));
				mVo.setPassword(rs.getString("password"));
				mVo.setName(rs.getString("name"));
				mVo.setPhone(rs.getString("phone"));
				mVo.setPostCode(rs.getString("postcode"));
				mVo.setAddress(rs.getString("address"));
				mVo.setJoinDate(rs.getString("joindate"));
				mVo.setMemberGrade(rs.getString("membergrade"));
			}
			
			try {
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mVo;
	}
	
	// c r update d
	public void updateMember(MemberVO mVo) {
		String sql = "update coupang_member set password=?, name=?, phone=?, postcode=?, address=?, membergrade=? where email=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mVo.getEmail());
			pstmt.setString(2, mVo.getPassword());
			pstmt.setString(3, mVo.getName());
			pstmt.setString(4, mVo.getPhone());
			pstmt.setString(5, mVo.getPostCode());
			pstmt.setString(6, mVo.getAddress());
			pstmt.setString(7, mVo.getMemberGrade());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	// c r u delete
	public void deleteMember(String email) {
		String sql = "delete coupang_member where email=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}		
	}
}
