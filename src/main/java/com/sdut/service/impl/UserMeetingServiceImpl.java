package com.sdut.service.impl;

import com.sdut.dao.UserMeetingMapper;
import com.sdut.service.UserMeetingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserMeetingServiceImpl implements UserMeetingService {

    @Autowired
    private UserMeetingMapper userMeetingMapper;

    @Override
    public int joinMeeting(int mid, int uid) {
        return userMeetingMapper.joinMeeting(mid, uid);
    }

    @Override
    public int exitMeeting(int mid, int uid) {
        return userMeetingMapper.exitMeeting(mid, uid);
    }
}
