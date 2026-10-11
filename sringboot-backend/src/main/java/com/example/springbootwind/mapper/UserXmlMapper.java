package com.example.springbootwind.mapper;

import com.example.springbootwind.demand.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserXmlMapper {
    public List<User> findall();
    /**
     * 动态查询用户列表：根据传入的条件（username、age、gender、email）进行模糊/精确查询
     * @param user 查询条件（空字段不参与查询）
     * @return 符合条件的用户列表
     */
    //用户表某个条件查询
    public User selectUserByCondition(User user);
    // 插入用户（返回自增主键）
    public int insertUser(User user);
}
