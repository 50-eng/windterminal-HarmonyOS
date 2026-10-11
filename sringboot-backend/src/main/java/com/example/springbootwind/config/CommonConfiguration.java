package com.example.springbootwind.config;

import org.springframework.ai.chat.client.ChatClient;
import org.springframework.ai.chat.client.advisor.SimpleLoggerAdvisor;
import org.springframework.ai.ollama.OllamaChatModel;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CommonConfiguration {
//    @Bean
//    public ChatMemory chatmemory(){
//        return new  MessageWindowChatMemory.builder()
//                .build();;
//    }

    @Bean
    public ChatClient chatclient(OllamaChatModel model){//不愿管正常运行
        return ChatClient
                .builder(model)
                .defaultSystem("你是一个金融顾问，名字叫小鱼，非常熟悉金融问题，请以金融顾问小鱼的身份和语气回答问题")
                .defaultAdvisors(new SimpleLoggerAdvisor())//配置日志，默认返回在控制台，储存就修改springboot Logger --前提：修改日志级别
                .build();
    }
}
