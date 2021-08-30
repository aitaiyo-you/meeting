package com.sdut.dao;

import com.sdut.pojo.Meeting;
import com.sdut.pojo.MeetingExample;
import java.util.List;

import com.sdut.pojo.Users;
import org.apache.ibatis.annotations.Param;

public interface MeetingMapper {
    long countByExample(MeetingExample example);

    int deleteByExample(MeetingExample example);

    int deleteByPrimaryKey(Integer mid);

    int insert(Meeting record);

    int insertSelective(Meeting record);

    List<Meeting> selectByExample(MeetingExample example);

    Meeting selectByPrimaryKey(Integer mid);

    int updateByExampleSelective(@Param("record") Meeting record, @Param("example") MeetingExample example);

    int updateByExample(@Param("record") Meeting record, @Param("example") MeetingExample example);

    int updateByPrimaryKeySelective(Meeting record);

    int updateByPrimaryKey(Meeting record);
    //关键字查询
    List<Meeting> selectMeetingByKeyword(String keyword);
    //删除会议
    int deleteMeeting(Integer id);
    //批量删除会议
    int deleteAllMeeting(List<Integer> ids);
    //新增会议
    int addMeeting(Meeting meeting);
    //修改会议
    int updateMeeting(Meeting meeting);
    //根据用户id查询全部未参加会议
    List<Meeting> selectAllNo(Meeting meeting);
    //根据用户id查询全部已参加会议
    List<Meeting> selectAllJoin(Meeting meeting);
}