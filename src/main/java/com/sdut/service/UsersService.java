package com.sdut.service;

import com.github.pagehelper.PageInfo;
import com.sdut.pojo.Users;

import java.util.List;

public interface UsersService {
    //用户登录
    Users login(Users users);
    //用户注册
    int register(Users users);
    //查询所有未审核用户
    List<Users> selectAllByStatus();
    //分页未审核用户
    PageInfo<Users> getAuditPage(Integer pageNum, Integer pageSize, String keyword);
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
    //分页所有用户
    PageInfo<Users> getUserPage(Integer pageNum, Integer pageSize, String keyword);
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
    PageInfo<Users> selectUserById(Integer pageNum, Integer pageSize, String keyword, int id);
    //根据uid搜索个人信息
    Users selectByUid(int id);
    //修改密码
    int updatePwd(String newPwd, int id, String oldPwd);
}
