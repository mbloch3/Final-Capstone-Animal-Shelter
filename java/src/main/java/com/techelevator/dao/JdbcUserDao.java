package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import com.techelevator.exception.DaoException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.techelevator.model.User;

@Component
public class JdbcUserDao implements UserDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcUserDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public int findIdByUsername(String username) {
        if (username == null) throw new IllegalArgumentException("Username cannot be null");

        int userId;
        try {
            userId = jdbcTemplate.queryForObject("select user_id from users where username = ?", int.class, username);
        } catch (EmptyResultDataAccessException e) {
            throw new UsernameNotFoundException("User " + username + " was not found.");
        }

        return userId;
    }

	@Override
	public User getUserById(int userId) {
		String sql = "SELECT * FROM users WHERE user_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
		if (results.next()) {
			return mapRowToUser(results);
		} else {
			return null;
		}
	}

    @Override
    public List<User> findAll() {
        List<User> users = new ArrayList<>();
        String sql = "select * from users";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            User user = mapRowToUser(results);
            users.add(user);
        }

        return users;
    }

    @Override
    public List<User> getApprovedUsers(){
        String sql = "SELECT first_name, last_name, phone_number, email_address FROM users";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);

        List<User> approvedUsers = new ArrayList<>();

        while(results.next()){
            User user;
            user = mapRowToUser(results);

            approvedUsers.add(user);
        }
        return approvedUsers;
    }


    @Override
    public User findByUsername(String username) {
        if (username == null) throw new IllegalArgumentException("Username cannot be null");

        for (User user : this.findAll()) {
            if (user.getUsername().equalsIgnoreCase(username)) {
                return user;
            }
        }
        throw new UsernameNotFoundException("User " + username + " was not found.");
    }

    @Override
    public boolean create(String username, String password, String role, String firstName, String lastName,
                          String phoneNumber, String emailAddress) {
        String insertUserSql = "insert into users (username,password_hash,role, first_name, last_name, phone_number, " +
                               "email_address) values (?,?,?,?,?,?,?)";
        String password_hash = new BCryptPasswordEncoder().encode(password);
        String ssRole = role.toUpperCase().startsWith("ROLE_") ? role.toUpperCase() : "ROLE_" + role.toUpperCase();

        return jdbcTemplate.update(insertUserSql, username, password_hash, ssRole, firstName, lastName, phoneNumber,
                emailAddress) == 1;
    }

    //Used for updating password of newly approved volunteer if isAdmin is false
    //If isAdmin is true, used for promoting user from user to admin
    @Override
    public User updateUser(boolean isAdmin, int id, User user) {

        User updatedUser = null;
        String sql = "UPDATE users SET " +
                     "username=?, password_hash=?, role=?, has_logged_in= true WHERE user_id=?;";
        String password_hash = new BCryptPasswordEncoder().encode(user.getPassword());
        String role = "";
        if(isAdmin){
            role = "ROLE_ADMIN";
        } else {
            role = "ROLE_USER";
        }

        try{
            int numberOfRows = jdbcTemplate.update(sql, user.getUsername(), password_hash, role,
                    id);

//            if (numberOfRows == 0){
//                throw new DaoException("Zero rows affected, expected at least one");
//            } else {
//                updatedUser = getUserById(user.getId());
//            }
            updatedUser = getUserById(user.getId());
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }
        return updatedUser;
    }

    private User mapRowToUser(SqlRowSet rs) {
        User user = new User();

        user.setId(rs.getInt("user_id"));
        user.setUsername(rs.getString("username"));
        user.setPassword(rs.getString("password_hash"));
        user.setFirstName(rs.getString("first_name"));
        user.setLastName(rs.getString("last_name"));
        user.setPhoneNumber(rs.getString("phone_number"));
        user.setEmailAddress(rs.getString("email_address"));
        user.setAuthorities(Objects.requireNonNull(rs.getString("role")));
        user.setActivated(true);
        user.setHasLoggedIn(rs.getBoolean("has_logged_in"));
        return user;
    }

//    private ApprovedUsersDto mapRowToApprovedUsers(SqlRowSet rs){
//        ApprovedUsersDto approvedUsersDto = new ApprovedUsersDto();
//        approvedUsersDto.setFirstName(rs.getString("first_name"));
//        approvedUsersDto.setLastName(rs.getString("last_name"));
//        approvedUsersDto.setPhoneNumber(rs.getString("phone_number"));
//        approvedUsersDto.setEmailAddress(rs.getString("email_address"));
//        return approvedUsersDto;
//    }
}
