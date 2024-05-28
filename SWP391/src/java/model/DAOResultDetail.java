/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Vector;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DAOResultDetail extends DBConnect {

    public int createResultDetail(int user_practice_id) {
        String sql = "insert into Result_Detail(result,user_practice_id,time)"
                + "values(0,?,0)";
        int n = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, user_practice_id);
            n = ps.executeUpdate();
        } catch (Exception e) {
            return n;
        }
        return n;
    }
}
