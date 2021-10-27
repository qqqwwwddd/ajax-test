package com.cos.ajax_test.domain;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface BoardRepository extends JpaRepository<Board, Integer>{
	
	@Query(value = "SELECT * FROM board b ORDER BY id DESC", nativeQuery = true)
	List<Board> mFindOrderId();
	
	@Query(value = "SELECT * FROM board b ORDER BY title DESC", nativeQuery = true)
	List<Board> mFindOrderTitle();
	
	@Query(value = "SELECT * FROM board b ORDER BY createdAt DESC", nativeQuery = true)
	List<Board> mFindOrderCreatedAt();

}
