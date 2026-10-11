package com.example.springbootwind;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication()
public class HeimaAiApplication {

    public static void main(String[] args) {
        SpringApplication.run(HeimaAiApplication.class, args);
    }

}
