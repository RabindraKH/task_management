package com.task_management.repositories;

import java.util.Optional;


import org.springframework.data.jpa.repository.JpaRepository;

import com.task_management.entity.User;

public interface UsersRepository extends JpaRepository<User, Long> {

	Optional<User> findByUserName(String userName);
	
}
