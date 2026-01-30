package com.example.p4.dao;

import com.example.p4.model.Student;
import com.example.p4.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

    public StudentDAO() {
        ensureTable();
        ensureSeedData();
    }

    private void ensureTable() {
        String sql =
                "CREATE TABLE IF NOT EXISTS student (" +
                "  id INT AUTO_INCREMENT PRIMARY KEY," +
                "  name VARCHAR(100) NOT NULL," +
                "  email VARCHAR(100) NOT NULL," +
                "  course VARCHAR(50) NOT NULL" +
                ")";

        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement()) {
            st.execute(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void ensureSeedData() {
        String countSql = "SELECT COUNT(*) FROM student";
        String insertSql = "INSERT INTO student (name, email, course) VALUES (?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(countSql)) {

            int count = 0;
            if (rs.next()) count = rs.getInt(1);

            if (count == 0) {
                try (PreparedStatement ps = con.prepareStatement(insertSql)) {
                    ps.setString(1, "Ali Hassan");
                    ps.setString(2, "ali@example.com");
                    ps.setString(3, "Computer Science");
                    ps.executeUpdate();

                    ps.setString(1, "Siti Aminah");
                    ps.setString(2, "siti@example.com");
                    ps.setString(3, "Data Science");
                    ps.executeUpdate();

                    ps.setString(1, "John Tan");
                    ps.setString(2, "john@example.com");
                    ps.setString(3, "Information Systems");
                    ps.executeUpdate();
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Student> getAllStudents() {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT id, name, email, course FROM student ORDER BY id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new Student(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("course")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean addStudent(Student s) {
        String sql = "INSERT INTO student (name, email, course) VALUES (?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, s.getName());
            ps.setString(2, s.getEmail());
            ps.setString(3, s.getCourse());

            return ps.executeUpdate() == 1;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteStudent(int id) {
        String sql = "DELETE FROM student WHERE id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() == 1;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
