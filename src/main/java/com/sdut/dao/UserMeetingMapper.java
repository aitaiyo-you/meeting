package com.sdut.dao;

import com.sdut.pojo.UserMeeting;
import com.sdut.pojo.UserMeetingExample;
import java.util.List;

import com.sdut.pojo.Users;
import org.apache.ibatis.annotations.Param;

public interface UserMeetingMapper {
    long countByExample(UserMeetingExample example);

    int deleteByExample(UserMeetingExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(UserMeeting record);

    int insertSelective(UserMeeting record);

    List<UserMeeting> selectByExample(UserMeetingExample example);

    UserMeeting selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") UserMeeting record, @Param("example") UserMeetingExample example);

    int updateByExample(@Param("record") UserMeeting record, @Param("example") UserMeetingExample example);

    int updateByPrimaryKeySelective(UserMeeting record);

    int updateByPrimaryKey(UserMeeting record);
    //加入会议
    int joinMeeting(int mid, int uid);
    //退出会议
    int exitMeeting(int mid, int uid);
}