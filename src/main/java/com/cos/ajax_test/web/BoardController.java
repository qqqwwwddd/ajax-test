package com.cos.ajax_test.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.ajax_test.domain.Board;
import com.cos.ajax_test.domain.BoardRepository;
import com.cos.ajax_test.web.dto.CMRespDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class BoardController {
	private final BoardRepository boardRepository;
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("boards", boardRepository.findAll());
		return "index";
	}
	
	// 쿼리스트링으로 값 받기
	// http://localhost:8080/board?order=title
	// http://localhost:8080/board?order=id
	@GetMapping("/board")
	public @ResponseBody CMRespDto<?> boardOrdering(String order){
		List<Board> boards = null;
		if(order.equals("id")) {
			boards =  boardRepository.mFindOrderId();
		}else if(order.equals("title")) {
			boards =  boardRepository.mFindOrderTitle();
		}else if(order.equals("createdAt")) {
			boards = boardRepository.mFindOrdercreatedAt();
		}else {
			boards =  boardRepository.findAll();
		}
		
		return new CMRespDto<>(1, "성공", boards);
	}
	
}









