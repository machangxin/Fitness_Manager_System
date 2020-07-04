package com.st.action;

import java.awt.Component;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JFileChooser;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.st.Util.Backup;
import com.st.service.UserService;

//在没有登录时就可以访问的路径
@Controller
public class CommonAction {
	@Autowired
	UserService user_ser;
	String selectPath;
	//跳转到登陆界面
	@RequestMapping("login")
	public String login() {
		return "login";
	}
	@RequestMapping("loginaction")
	//点击登录--登录操作
	public String loginaction(@RequestParam Map params,HttpSession session,HttpServletRequest request) {
		int b = user_ser.login(params,session);
		if(b==3) {
			return "system";
		}
		else if(b==0) {
			request.setAttribute("bo", "0");
			return "login";
		}
		else if(b==2){
			return  "custSysPage";
		}
		else {
			return "Publicsystem";
		}
	}
	@RequestMapping("backup")
	public void backup() throws ClassNotFoundException, InstantiationException, IllegalAccessException, UnsupportedLookAndFeelException {
		UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
		JFileChooser chooser = new JFileChooser();
		/*
		* 根据JFileChooser对弹出的文件夹框选择 1、只选择目录JFileChooser.DIRECTORIES_ONLY
		* 2、只选择文件JFileChooser.FILES_ONLY
		* 3、目录或者文件都可以JFileChooser.FILES_AND_DIRECTORIES
		*/
		chooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
		// 保存所选目录chooser.showSaveDialog(parent);
		Component parent = null;
		int returnVal = chooser.showSaveDialog(parent);
		 
		// 获得选中的文件对象JFileChooser.APPROVE_OPTION
		// 如果保存的目录跟获得选中的文件对象一致，成功都是返回0
		if (returnVal == JFileChooser.APPROVE_OPTION) {
		// 获得路径
		selectPath = chooser.getSelectedFile().getPath();
		}
		try {
			if (Backup.exportDatabaseTool("127.0.0.1", "root", "123456", selectPath, "fit.sql", "fitness")) {
				//System.out.println("数据库成功备份！！！");
			} else {
				//System.out.println("数据库备份失败！！！");
			}
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}
