package com.sdut.service;

public interface UserMeetingService {
    //加入会议
    int joinMeeting(int mid, int uid);
    //退出会议
    int exitMeeting(int mid, int uid);
}
