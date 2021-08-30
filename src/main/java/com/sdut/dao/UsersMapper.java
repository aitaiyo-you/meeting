package com.sdut.dao;

import com.sdut.pojo.Users;
import com.sdut.pojo.UsersExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UsersMapper {
    long countByExample(UsersExample example);

    int deleteByExample(UsersExample example);

    int insert(Users record);

    int insertSelective(Users record);

    List<Users> selectByExample(UsersExample example);

    int updateByExampleSelective(@Param("record") Users record, @Param("example") UsersExample example);

    int updateByExample(@Param("record") Users record, @Param("example") UsersExample example);
    //用户登录
    Users login(Users users);
    //用户注册
    int register(Users users);
    //查询所有未审核用户
    List<Users> selectAllByStatus();
    //关键字查询
    List<Users> auditSelectByKey(String keyword);
    //通过审核
    int passAudit(int id);
    //驳回审核
    int failAudit(int id);
    //批量通过
    int passAllAudit(List<Integer> ids);
    //批量驳回
    int failAllAudit(List<Integer> ids);
    //关键字查询用户
    List<Users> userSelectByKey(String keyword);
    //删除用户
    int deleteUser(int id);
    //批量删除用户
    int deleteAllUser(List<Integer> ids);
    //查找重复注册
    Users selectRepeat(Users users);
    //新增用户
    int addUser(Users users);
    //修改用户信息
    int updateUser(Users users);
    //根据mid搜索用户
    List<Users> selectUserById(int id, String keyword);
    //根据mid得到用户数量
    int selectUserNum(int id);
    //根据uid搜索个人信息
    Users selectByUid(int id);
    //修改密码
    int updatePwd(String newPwd, int id, String oldPwd);

}