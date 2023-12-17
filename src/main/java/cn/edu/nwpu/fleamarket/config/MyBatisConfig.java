package cn.edu.nwpu.fleamarket.config;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.context.annotation.Bean;

import javax.sql.DataSource;

/**
 * @Description MyBatis配置类
 * */
public class MyBatisConfig {

    /**
     * @Description 创建SqlSessionFactoryBean对象
     * @param dataSource 数据源对象
     * @return SqlSessionFactoryBean
     * */
    @Bean
    public SqlSessionFactoryBean sqlSessionFactory(DataSource dataSource){
        SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
        factoryBean.setDataSource(dataSource);
        factoryBean.setTypeAliasesPackage("cn.edu.nwpu.fleamarket.pojo");
        return factoryBean;
    }

    /**
     * @Description 创建MapperScannerConfigurer对象
     * @return MapperScannerConfigurer
     * */
    @Bean
    public MapperScannerConfigurer mapperScannerConfigurer(){
        MapperScannerConfigurer msc = new MapperScannerConfigurer();
        msc.setBasePackage("cn.edu.nwpu.fleamarket.dao");
        return msc;
    }

}
