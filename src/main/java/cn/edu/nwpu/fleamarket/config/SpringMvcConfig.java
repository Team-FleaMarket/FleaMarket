package cn.edu.nwpu.fleamarket.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Configuration
@ComponentScan("cn.edu.nwpu.fleamarket.controller")
@EnableWebMvc
public class SpringMvcConfig {

}
