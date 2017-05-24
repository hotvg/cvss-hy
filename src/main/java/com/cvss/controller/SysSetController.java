package com.cvss.controller;

import com.cvss.pojo.SysSet;
import com.cvss.service.ISetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;

/**
 * 系统设置
 * Created by yufeng.liu on 2017-05-09.
 */
@Controller
@RequestMapping(value = "/sys/set")
public class SysSetController {

    @Autowired
    private ISetService iSetService;

    /**
     * 新增系统设置
     *
     * @param record 一条记录
     * @return 返回是否成功，true为成功
     */
    @RequestMapping(value = "/create")
    @ResponseBody
    public int createSysSet(@RequestBody SysSet record) {
        return this.iSetService.insertSysSet(record);
    }

    /**
     * 更改系统设置
     *
     * @param record 一条记录
     * @return 返回是否成功
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public int updateSysSet(@RequestBody SysSet record, HttpSession session) {
        SysSet sysSet = (SysSet)session.getAttribute("sysSet");
        sysSet.setCompanyName(record.getCompanyName());
        sysSet.setSysMc(record.getSysMc());
        sysSet.setSysOc(record.getSysOc());
        sysSet.setSysTitle(record.getSysTitle());
        session.setAttribute("sysSet",sysSet);
        return this.iSetService.updateSysSet(record);
    }


    @RequestMapping(value = "/upload")
    @ResponseBody
    public boolean upLoadLogo(HttpServletRequest request) throws IOException {
        //创建一个通用的多部分解析器
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        //判断 request 是否有文件上传,即多部分请求
        if(multipartResolver.isMultipart(request)){
            //转换成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
            //取得request中的所有文件名
            Iterator<String> iterator = multiRequest.getFileNames();
            while(iterator.hasNext()){
                //取得上传文件
                MultipartFile file = multiRequest.getFile(iterator.next());
                if(file != null){
                    //取得当前上传文件的文件名称
                    String myFileName = file.getOriginalFilename();
                    //如果名称不为“”,说明该文件存在，否则说明该文件不存在
                    if(!myFileName.trim().equals("")){
                        //定义上传路径
                        String path = request.getServletContext().getRealPath("/resources/images")+"/logo.png";
                        System.out.print(path);
                        File localFile = new File(path);
                        file.transferTo(localFile);
                    }
                }
            }

        }
        return true;
    }

}