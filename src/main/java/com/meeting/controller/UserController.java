package com.meeting.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.meeting.bean.Msg;
import com.meeting.bean.UserInfo;
import com.meeting.bean.UserInfoExample;
import com.meeting.bean.UserInfoReturn;
import com.meeting.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/userInfo")
public class UserController {
    @Autowired
    UserInfoService userInfoService;


    /**
     * 根据条件修改用户数据
     * @param userInfo
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/updateUser")
    public Msg updateUser(UserInfo userInfo){
        if (userInfoService.updateByExampleSelectiveUser(userInfo))
            return Msg.success().add("msg", "修改成功");
        else
            return Msg.fail().add("msg", "修改失败");
    }

    /**
     * 根据条件删除用户表数据
     * @param userInfo
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/deleteUser",method = RequestMethod.POST)
    public Msg deleteUser(UserInfo userInfo){
        userInfo.setDeleteFlag(true);
        if (userInfoService.updateByExampleSelectiveUser(userInfo)){
            return Msg.success().add("msg", "删除成功");
        }
        else
            return Msg.fail().add("msg", "删除失败");
    }

    /**
     * 删除多个
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/deleteByExampleSelectiveUser/{ids}",method = RequestMethod.POST)
    public Msg updateByExampleSelectiveUser(@PathVariable("ids")String ids){
        List<Integer> del_ids = new ArrayList<Integer>();
        String str_ids[] = ids.split(",");
        for (String string: str_ids){
            del_ids.add(Integer.parseInt(string));
        }
        userInfoService.deleteByExampleUser(del_ids);
        return Msg.success();
    }

    /**
     * 登录
     * @param userInfo
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/checkUser",method = RequestMethod.POST)
    public Msg checkUser(UserInfo userInfo,HttpSession session){
        String username = userInfo.getUsername();
        String password = userInfo.getPassword();
        if(userInfoService.checkUser(username,password)){
            session.setAttribute("username",username);
            return Msg.success();
        }else{
            return Msg.fail().add("msg","工号或密码错误");
        }
    }


    /**
     * 分页
     * @param pn
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/findAll",method = RequestMethod.GET)
    public Msg User(@RequestParam(value="page",defaultValue="1")Integer pn){
        //引入PageHelper分页插件
        //在查询之前只需要调用,传入页码，以及每页显示的数量
        PageHelper.startPage(pn,15);
        //startPage后面紧跟的这个查询就是一个分页查询
//        List<UserInfoReturn> list  = userInfoService.findAll();
        List<UserInfoReturn> list = userInfoService.selectUserReturn();
//        System.out.println(list.toString());
        //使用PageInfo包装查询后的结果，只需要将PageInfo交给页面就行了
        //封装了详细的页面信息，包括我们查询出来的数据,传入连续显示的页数
        PageInfo page = new PageInfo(list,1);
        return Msg.success().add("userinfo",page);
    }

    /**
     * 添加数据到用户表
     * @param userInfo
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/insertUser",method = RequestMethod.POST)
    public Msg insertUser(UserInfo userInfo){
        if (userInfoService.insertUser(userInfo))
            return Msg.success().add("msg", "添加成功");
        else
            return Msg.fail().add("msg","添加失败");
    }


    /**
     * 检查用户名是否可用
     * @param username
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkAddUserInfoUsername")
    public Msg checkAddUserInfoUsername(@RequestParam("username")String username){
        boolean UserInfoUsername = userInfoService.checkAddUserInfo(username);
        if (UserInfoUsername)
            return Msg.success();
        else
            return Msg.fail();
    }


    /**
     * 校验添加时手机号是否可用
     * @param phone
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkAddUserInfoPhone")
    public Msg checkAddUserInfoPhone(@RequestParam("phone")String phone){
        boolean UserInfoPhone = userInfoService.checkAddUserinfoPhone(phone);
        if (UserInfoPhone)
            return Msg.success();
        else
            return Msg.fail();
    }

    /**
     * 校验修改时手机号是否重复
     * @param phone
     * @param userinfo
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkUpdateUserinfoPhone")
    public Msg checkUpdateUserinfoPhone(String phone, String userinfo){
        if (userInfoService.checkUpdatePhone(phone, userinfo))
            return Msg.success();
        return Msg.fail();
    }
}
