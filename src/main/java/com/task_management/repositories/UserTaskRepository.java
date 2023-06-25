package com.task_management.repositories;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.task_management.entity.UserTask;

public interface UserTaskRepository extends JpaRepository<UserTask, Long> {

	List<UserTask> findByUserName(String userName);
	
	List<UserTask> findByDueDate(String dueDate);
	
	List<UserTask> findByTaskStatus(String taskStatus);
	
	@Query("select t from UserTask t where t.description like %?1% or t.title like %?1% or t.userName like %?1% ")
	List<UserTask> findAll(String key);
}
