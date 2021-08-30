package com.sdut.controller;

import com.github.pagehelper.PageInfo;
import com.sdut.pojo.Meeting;
import com.sdut.service.MeetingService;
import com.sdut.service.UserMeetingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("/meeting")
@Controller
public class MeetingController {

    @Autowired
    private MeetingService meetingService;
    @Autowired
    private UserMeetingService userMeetingService;

    @RequestMapping("/selectAllNo")
    public String selectAllNo(
            @RequestParam("id") Integer id,
            @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
            @RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNum,
            Model model
    ) {
        PageInfo<Meeting> sh = meetingService.getNoMeetingPage(pageNum, 5, keyword, id);
        model.addAttribute("noInfo", sh);
        model.addAttribute("mKeyword", keyword);
        return "userNo";
    }

    @RequestMapping("/selectAllJoin")
    public String selectAllJoin(
            @RequestParam("id") Integer id,
            @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
            @RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNum,
            Model model
    ) {
        PageInfo<Meeting> sh = meetingService.getJoinMeetingPage(pageNum, 5, keyword, id);
        model.addAttribute("joinInfo", sh);
        model.addAttribute("mKeyword1", keyword);
        return "userJoin";
    }

    @PostMapping("/deleteMeeting")
    @ResponseBody
    public String deleteMeeting(
            @RequestParam("id") Integer id
    ) {
        int flag = meetingService.deleteMeeting(id);
        if (flag == 1) {
            return "success";
        } else {
            return "failed";
        }
    }
    @PostMapping("/deleteAllMeeting")
    @ResponseBody
    public String deleteAllMeeting(
            @RequestParam("ids[]") List<Integer> ids
    ) {
        int flag = meetingService.deleteAllMeeting(ids);
        if (flag > 0) {
            return "success";
        } else {
            return "failed";
        }
    }
    @PostMapping("/addMeeting")
    @ResponseBody
    public String addMeeting(
            @RequestParam("name") String name,
            @RequestParam("address") String address,
            @RequestParam("bTime") String bTime,
            @RequestParam("eTime") String eTime,
            @RequestParam("num") Integer num,
            @RequestParam("intro") String intro
    ) {
        Meeting meeting = new Meeting();
        meeting.setMname(name);
        meeting.setMaddress(address);
        meeting.setMbtime(bTime);
        meeting.setMetime(eTime);
        meeting.setMnum(num);
        meeting.setMintro(intro);
        int flag = meetingService.addMeeting(meeting);
        if (flag == 1) {
            return "success";
        } else {
            return "failed";
        }
    }
    @PostMapping("/updateMeeting")
    @ResponseBody
    public String updateMeeting(
            @RequestParam("id") Integer id,
            @RequestParam("name") String name,
            @RequestParam("address") String address,
            @RequestParam("bTime") String bTime,
            @RequestParam("eTime") String eTime,
            @RequestParam("num") Integer num,
            @RequestParam("intro") String intro
    ) {
        Meeting meeting = new Meeting();
        meeting.setMid(id);
        meeting.setMname(name);
        meeting.setMaddress(address);
        meeting.setMbtime(bTime);
        meeting.setMetime(eTime);
        meeting.setMnum(num);
        meeting.setMintro(intro);
        int flag = meetingService.updateMeeting(meeting);
        if (flag == 1) {
            return "success";
        } else {
            return "failed";
        }
    }
    @PostMapping("/joinMeeting")
    @ResponseBody
    public String joinMeeting(
            @RequestParam("mid") Integer mid,
            @RequestParam("uid") Integer uid
    ) {
        int flag = userMeetingService.joinMeeting(mid, uid);
        if (flag == 1) {
            return "success";
        } else {
            return "failed";
        }
    }
    @PostMapping("/exitMeeting")
    @ResponseBody
    public String exitMeeting(
            @RequestParam("mid") Integer mid,
            @RequestParam("uid") Integer uid
    ) {
        int flag = userMeetingService.exitMeeting(mid, uid);
        if (flag == 1) {
            return "success";
        } else {
            return "failed";
        }
    }

}
