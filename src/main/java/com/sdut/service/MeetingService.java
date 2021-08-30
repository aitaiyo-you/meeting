package com.sdut.service;

import com.github.pagehelper.PageInfo;
import com.sdut.pojo.Meeting;

import java.util.List;

public interface MeetingService {
    //查询所有会议
    List<Meeting> selectAll();
    //分页所有会议
    PageInfo<Meeting> getMeetingPage(Integer pageNum, Integer pageSize, String keyword);
    //删除会议
    int deleteMeeting(Integer id);
    //批量删除会议
    int deleteAllMeeting(List<Integer> ids);
    //新增会议
    int addMeeting(Meeting meeting);
    //修改会议
    int updateMeeting(Meeting meeting);
    //根据用户id查询全部未参加会议并分页
    PageInfo<Meeting> getNoMeetingPage(Integer pageNum, Integer pageSize, String keyword, Integer id);
    //根据用户id查询全部未参加会议并分页
    PageInfo<Meeting> getJoinMeetingPage(Integer pageNum, Integer pageSize, String keyword, Integer id);

}
