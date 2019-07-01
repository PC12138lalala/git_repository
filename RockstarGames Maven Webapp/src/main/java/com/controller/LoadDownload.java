package com.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.support.RequestContext;

import com.model.Video;
import com.service.VideoService;

@Controller
@RequestMapping("/Download")
public class LoadDownload {

	@Autowired
	@Qualifier("videoService")
	private VideoService videoService;

	@RequestMapping("/{path}")
	public String toDownloadPage(Model model, HttpSession httpSession,
			@PathVariable(value = "path") String path,
			HttpServletRequest request) {
		if (httpSession.getAttribute("userid") == null
				|| httpSession.getAttribute("userid").equals("")) {
			RequestContext req = new RequestContext(request);
			model.addAttribute(
					"loginSigninBlock",
					"<li><a href='SignIn' target='_top'>"
							+ req.getMessage("Sign In")
							+ "</a></li><li><a href='LogIn' target='_top'>"
							+ req.getMessage("Join In") + "</a></li>");
		} else {
			model.addAttribute(
					"loginSigninBlock",
					"<li><a href='profile' target='_top'><img src='CSS/image/userPhoto/"
							+ httpSession.getAttribute("userid")
							+ "HP.png' onerror=this.src='CSS/image/userPhoto/none_s.png'></a></li>");
		}
		model.addAttribute("target", "video");
		return path;
	}

	@RequestMapping("/content")
	public String refreshContent(Model model,
			@RequestParam("target") String target) {
		model.addAttribute("target", target);
		if (target.equals("video")) {
			List<Video> lists = videoService.getAllVideoInfo();
			model.addAttribute("video", lists);

		}
		return "content";
	}

	@RequestMapping("/toDownload")
	public String toDownload(@RequestParam("videoName") String videoName,
			@RequestParam("type") String type,
			@RequestParam("game") String game, HttpServletRequest request,
			HttpServletResponse response) {
		String fileName = videoName + ".mp4";
		try {
			fileName = new String(fileName.getBytes("iso8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ResourceBundle res = ResourceBundle.getBundle("webapp");
		String path = res.getString("VIDEOPATH")+
				"\\video\\" + game.replace(":", " ") + "\\" ;
		// 得到要下载的文件
		File file = new File(path, fileName);
		System.out.println(path + fileName);
		// 如果文件不存在
		if (!file.exists()) {
			System.out.println(1);
			return type;
		}
		// 设置响应头，控制浏览器下载该文件
		try {
			response.setHeader("content-disposition", "attachment;filename="
					+ URLEncoder.encode(fileName, "UTF-8"));
			// 读取要下载的文件，保存到文件输入流
			FileInputStream in = new FileInputStream(path + "\\" + fileName);
			// 创建输出流
			OutputStream out = response.getOutputStream();
			// 创建缓冲区
			byte buffer[] = new byte[1024 * 1024 * 1024];
			int len = 0;
			// 循环将输入流中的内容读取到缓冲区当中
			while ((len = in.read(buffer)) > 0) {
				// 输出缓冲区的内容到浏览器，实现文件下载
				out.write(buffer, 0, len);
				// 关闭文件输入流
				in.close();
				// 关闭输出流
				out.close();
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return type;
	}
}
