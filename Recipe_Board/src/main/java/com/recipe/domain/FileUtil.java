package com.recipe.domain;

import java.io.File;

public class FileUtil {

	//https://ohju.tistory.com/42
	//https://www.javacodegeeks.com/2020/08/ocr-in-java-with-tess4j.html
	//폴더가 없으면 생성하고 있으면 경로 반환
	public static String mkdirForDate(String uploadDir) {
		
		String path = "C:\\cbnu2022\\220707spring_study\\Recipe_Board\\src\\main\\webapp\\resources\\imgUpload\\"; //폴더 경로
		
		File Folder = new File(path);
		
		if (!Folder.exists()) {
			Folder.mkdirs();
		}
		return path;
	}
}