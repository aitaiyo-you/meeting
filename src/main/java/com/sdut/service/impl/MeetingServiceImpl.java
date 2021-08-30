package com.sdut.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sdut.dao.MeetingMapper;
import com.sdut.dao.UsersMapper;
import com.sdut.pojo.Meeting;
import com.sdut.pojo.Users;
import com.sdut.service.MeetingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MeetingServiceImpl implements MeetingService {

    @Autowired
    private MeetingMapper meetingMapper;

    @Autowired
    private UsersMapper usersMapper;

    @Override
    public List<Meeting> selectAll() {
        return meetingMapper.selectByExample(null);
    }

    @Override
    public PageInfo<Meeting> getMeetingPage(Integer pageNum, Integer pageSize, String keyword) {
        PageHelper.startPage(pageNum, pageSize);
        String word = "%" + keyword + "%";
        List<Meeting> mhs = meetingMapper.selectMeetingByKeyword(word);
        for (int i = 0; i < mhs.size(); i++) {
            int mid = mhs.get(i).getMid();
            int num = usersMapper.selectUserNum(mid);
            mhs.get(i).setEtc1(Integer.toString(num));
        }
        PageInfo<Meeting> meetingPageInfo = new PageInfo<>(mhs);
        return meetingPageInfo;
    }

    @Override
    public int deleteMeeting(Integer id) {
        return meetingMapper.deleteMeeting(id);
    }

    @Override
    public int deleteAllMeeting(List<Integer> ids) {
        return meetingMapper.deleteAllMeeting(ids);
    }

    @Override
    public int addMeeting(Meeting meeting) {
        return meetingMapper.addMeeting(meeting);
    }

    @Override
    public int updateMeeting(Meeting meeting) {
        return meetingMapper.updateMeeting(meeting);
    }

    @Override
    public PageInfo<Meeting> getNoMeetingPage(Integer pageNum, Integer pageSize, String keyword, Integer id) {
        PageHelper.startPage(pageNum, pageSize);
        String word = "%" + keyword + "%";
        Meeting meeting = new Meeting();
        meeting.setMid(id);
        meeting.setMname(word);
        List<Meeting> mhs = meetingMapper.selectAllNo(meeting);
        for (int i = 0; i < mhs.size(); i++) {
            int mid = mhs.get(i).getMid();
            int num = usersMapper.selectUserNum(mid);
            mhs.get(i).setEtc1(Integer.toString(num));
        }
        PageInfo<Meeting> meetingPageInfo = new PageInfo<>(mhs);
        return meetingPageInfo;
    }

    @Override
    public PageInfo<Meeting> getJoinMeetingPage(Integer pageNum, Integer pageSize, String keyword, Integer id) {
        PageHelper.startPage(pageNum, pageSize);
        String word = "%" + keyword + "%";
        Meeting meeting = new Meeting();
        meeting.setMid(id);
        meeting.setMname(word);
        List<Meeting> mhs = meetingMapper.selectAllJoin(meeting);
        for (int i = 0; i < mhs.size(); i++) {
            int mid = mhs.get(i).getMid();
            int num = usersMapper.selectUserNum(mid);
            mhs.get(i).setEtc1(Integer.toString(num));
        }
        PageInfo<Meeting> meetingPageInfo = new PageInfo<>(mhs);
        return meetingPageInfo;
    }
}
