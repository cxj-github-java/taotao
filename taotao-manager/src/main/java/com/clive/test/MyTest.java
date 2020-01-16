package com.clive.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;


import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.junit.Test;

public class MyTest {
	@Test
	public void show() throws IOException, IOException{
		/**
		 * 通过Java代码把图片上传到图片服务器上，
		 * 用ftp的代码来上传图片到图片服务器
		 */
		//创建ftp客户端对象，通过ftp协议来链接我们的图片服务器，
		FTPClient ftpClient = new FTPClient();
		//要连接哪个服务器，需要ip地址 在vmaer内ifconfig可看到
		ftpClient.connect("192.168.43.128");
		//账号密码
		ftpClient.login("ftpuser", "ftpuser");
		//解决图片上传的0kb的情况
		ftpClient.enterLocalPassiveMode();
		//指定图片的上传类型，固定写法
		ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
		InputStream inputStream = new FileInputStream(new File("F:\\img\\1.jpg"));
		/*
		 * 把图片上传到哪个位置上去
		 * /home/ftpuser/www/images：固定写法
		 * 123.jpg：图片名称
		 * 参数2：把要上传的图片变成input输入流才可以
		 * 	
		 * 
		 */
		ftpClient.storeFile("/home/ftpuser/www/images/cxj.jpg", inputStream);
		//关流
		inputStream.close();
		ftpClient.logout();
		System.out.println("上传成功");
	}
}
