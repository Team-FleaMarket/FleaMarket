package cn.edu.nwpu.fleamarket.config;

import org.redisson.Redisson;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 *  Redisson配置类
 * */
@Configuration
public class RedissonConfig {

    @Value("${redis.url}")
    private String url;

    @Value("${redis.password}")
    private String password;

    @Value("${redis.database}")
    private int database;

    /**
     * @Description 创建RedissonClient对象
     * @return RedissonClient
     * */
    @Bean
    public RedissonClient redissonClient() {
        Config config = new Config();
        config.useSingleServer()
                .setAddress(url)
                .setPassword(password)
                .setDatabase(database);
        return Redisson.create(config);
    }
}