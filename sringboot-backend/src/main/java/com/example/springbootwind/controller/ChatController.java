package com.example.springbootwind.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.ai.chat.client.ChatClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;

@RequiredArgsConstructor //lombok提供的构造方法，代替@Autowired
@RestController
@RequestMapping("/ai")
public class ChatController {

    private final ChatClient chatclient; //CommonConfiguration

    @RequestMapping(value = "/chat",produces = "text/html;charset=utf-8")
    public Flux<String> chat(String prompt){//传入参数
        return chatclient.prompt()
                .user(prompt)
                .stream()
                .content();
    }
}
