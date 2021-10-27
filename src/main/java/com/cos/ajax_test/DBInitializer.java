package com.cos.ajax_test;

import java.util.ArrayList;
import java.util.List;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.cos.ajax_test.domain.Board;
import com.cos.ajax_test.domain.BoardRepository;

@Configuration
public class DBInitializer {
    @Bean
    public CommandLineRunner demo( BoardRepository boardRepository) {

        return (args) -> {
            List<Board> boards = new ArrayList<>();
            boards.add(Board.builder().title("제목1").build());
            boards.add(Board.builder().title("제목3").build());
            boards.add(Board.builder().title("제목2").build());
            boards.add(Board.builder().title("제목5").build());
            boards.add(Board.builder().title("제목4").build());
            boards.add(Board.builder().title("제목6").build());
        	boardRepository.saveAll(boards);
        };
    }
}
