package com.sdut.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sdut.dao.UsersMapper;
import com.sdut.pojo.Users;
import com.sdut.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsersServicesImpl implements UsersService {

    @Autowired
    UsersMapper usersMapper;

    @Override
    public Users login(Users users) {
        return usersMapper.login(users);
    }

    @Override
    public int register(Users users) {
        int a = 0;
        try {
            a = usersMapper.register(users);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return a;
    }

    @Override
    public List<Users> selectAllByStatus() {
        return usersMapper.selectAllByStatus();
    }

    @Override
    public PageInfo<Users> getAuditPage(Integer pageNum, Integer pageSize, String keyword) {
        PageHelper.startPage(pageNum, pageSize);
        String word = "%" + keyword + "%";
        List<Users> uhs = usersMapper.auditSelectByKey(word);
        PageInfo<Users> auditPageInfo = new PageInfo<>(uhs);
        return auditPageInfo;
    }

    @Override
    public List<Users> auditSelectByKey(String keyword) {
        String word = "%" + keyword + "%";
        return usersMapper.auditSelectByKey(word);
    }

    @Override
    public int passAudit(int id) {
        return usersMapper.passAudit(id);
    }

    @Override
    public int failAudit(int id) {
        return usersMapper.failAudit(id);
    }

    @Override
    public int passAllAudit(List<Integer> ids) {
        return usersMapper.passAllAudit(ids);
    }

    @Override
    public int failAllAudit(List<Integer> ids) {
        return usersMapper.failAllAudit(ids);
    }

    @Override
    public PageInfo<Users> getUserPage(Integer pageNum, Integer pageSize, String keyword) {
        PageHelper.startPage(pageNum, pageSize);
        String word = "%" + keyword + "%";
        List<Users> uhs = usersMapper.userSelectByKey(word);
        PageInfo<Users> usersPageInfo = new PageInfo<>(uhs);
        return usersPageInfo;
    }

    @Override
    public int deleteUser(int id) {
        return usersMapper.deleteUser(id);
    }

    @Override
    public int deleteAllUser(List<Integer> ids) {
        return usersMapper.deleteAllUser(ids);
    }

    @Override
    public Users selectRepeat(Users users) {
        return usersMapper.selectRepeat(users);
    }

    @Override
    public int addUser(Users users) {
        return usersMapper.addUser(users);
    }

    @Override
    public int updateUser(Users users) {
        return usersMapper.updateUser(users);
    }

    @Override
    public PageInfo<Users> selectUserById(Integer pageNum, Integer pageSize, String keyword, int id) {
        PageHelper.startPage(pageNum, pageSize);
        String word = "%" + keyword + "%";
        List<Users> uhs = usersMapper.selectUserById(id, word);
        PageInfo<Users> usersPageInfo = new PageInfo<>(uhs);
        return usersPageInfo;
    }

    @Override
    public Users selectByUid(int id) {
        return usersMapper.selectByUid(id);
    }

    @Override
    public int updatePwd(String newPwd, int id, String oldPwd) {
        int flag = 0;
        try {
            flag = usersMapper.updatePwd(newPwd, id, oldPwd);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
}
