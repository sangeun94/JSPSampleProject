package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.HobbyDTO;
import db.dto.PersonInfoDTO;
import db.util.DBConnectionManager;

public class HobbyDAO {
	//필드변수
		Connection conn;
		PreparedStatement psmt;
		ResultSet rs;
		
		/*
		 select -> find
		 insert -> save
		 update -> modify
		 delete -> remove
		 */

		//select...  find...  read...
		public List<HobbyDTO> findHobbyList(){
			//결과가 한개인지 여러개(List)인지

			//DBConnectionManager 만들어준 connection 을 활용
			conn = DBConnectionManager.connectDB();

			String sql =  " select * from t_hobby_list " ;

			List<HobbyDTO> hobbyList = null; 
			//if (hobbyList == null)

			try {
				psmt = conn.prepareStatement(sql);
				//Connection 활용해서 sql 명령을 실행하는 객체

				rs = psmt.executeQuery(); //준비된 sql 쿼리문 실행!
				hobbyList = new ArrayList<HobbyDTO>();
				//if (hobbyList.size() > 0)

				while(rs.next()) { 
					
//					if(hobbyList == null) { //null이면 데이터가 없는거고 null이 아니면 뭐라도 담겨있는거고!
//						hobbyList = new ArrayList<HobbyDTO>();
//					}
					
					HobbyDTO hobbyDTO = new HobbyDTO(rs.getInt("id"), rs.getInt("no"), rs.getString("hobby"), rs.getInt("prefer"));

					hobbyList.add(hobbyDTO);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnectionManager.closeDB(conn, psmt, rs);
			}

			return hobbyList; //return 0; if(result > 0)
		}
}
