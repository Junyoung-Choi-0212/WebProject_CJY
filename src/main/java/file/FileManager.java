package file;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

public class FileManager {
	// 파일 업로드 기능 구현(request 내장 객체(req)와 파일 저장을 위한 디렉토리(sDirectory)를 매개변수로 정의)
	public static String uploadFile(HttpServletRequest req, String sDirectory) throws ServletException, IOException {
		/*
			파일 첨부를 위한 <input> 태그의 name 속성 값을 이용해서 Part 인스턴스를 생성한다.
			이를 통해 파일을 서버에 저장할 수 있다.
		*/
		Part part = req.getPart("ofile");
		
		/*
			Part 인스턴스에서 헤더 값을 통해 원본 파일명을 얻어온다.
			차후 업로드 테스트 시 콘솔에서 확인할 수 있다.
		*/
		String partHeader = part.getHeader("content-disposition");
		System.out.println("partHeader = " + partHeader);
		
		/*
			header 값을 통해 얻어온 문자열에서 "filename=" 을 구분자로 split 하면 String 타입의 배열로 반환된다.
		*/
		String[] phArr = partHeader.split("filename=");
		/*
			위 결과 배열 중 1번 인덱스의 값이 파일명이 된다.
			여기서 더블 쿼테이션(")을 제거해야 하므로 replace를 사용하며 이스케이핑 시퀀스 기호를 반드시 추가해야 에러가 발생하지 않는다.
		*/
		String originalFileName = phArr[1].trim().replace("\"", ""); 
		
		/* 
			전송된 파일이 있는 경우라면 서버의 디렉토리에 파일을 저장한다.
			File.separator : 운영체제(OS) 마다 경로를 표사하는 기호가 다르므로 해당 OS에 맞는 구분기호를 자동으로 추가해준다. 
		 */
		if (!originalFileName.isEmpty()) part.write(sDirectory + File.separator + originalFileName);  
		
		return originalFileName; // 저장된 원본 파일명 반환
	}
	
	// 파일 업로드 기능 구현(request 내장 객체(req)와 파일 저장을 위한 디렉토리(sDirectory)를 매개변수로 정의)
	public static ArrayList<String> multipleFile(HttpServletRequest req, String sDirectory) throws ServletException, IOException {
		ArrayList<String> listFileName = new ArrayList<>();
		
		Collection<Part> parts = req.getParts();
		for (Part part : parts) {
			// 전송된 form 값 중 파일이 아니라면 업로드 대상이 아니므로 continue;
			if (!(part.getName().equals("ofile"))) continue;
			
			// form 값이 맞다면 헤더를 얻어온다. 
			String partHeader = part.getHeader("content-disposition");
			System.out.println("partHeader = " + partHeader);
			
			// 파일명 변경
			String[] phArr = partHeader.split("filename=");
			String originalFileName = phArr[1].trim().replace("\"", ""); 

			if (!originalFileName.isEmpty()) part.write(sDirectory + File.separator + originalFileName); // 저장
			
			listFileName.add(originalFileName); // List 에 파일명 추가
		}
		
		return listFileName; 
	}
	
	// 파일명 변경 기능 구현(서버에 저장된 파일명이 한들인 경우 웹 브라우저에서 깨짐 현상이 발생할 수 있으므로 영문 혹은 숫자의 조합으로 변경하는 것이 안전) 
	public static String renameFile(String sDirectory, String fileName) {
		/*
			파일명에서 확장자를 잘라내기 위해 뒤에서부터 "."이  있는 위치를 찾는다.
			이는 파일명에 2개 이상의 닷(.)을 사용할 수 있기 때문이다.
		*/
		String ext = fileName.substring(fileName.lastIndexOf("."));
		
		/*
			날짜와 시간을 이용해 파일명으로 사용할 문자열을 생성한다.
			"년월일_시분초999" 같은 형태가 되며 마지막 S는 밀리세컨드 단위의 시간을 3자리로 반환한다.
		*/
		String now = new SimpleDateFormat("yyMMdd_HmsS").format(new Date());
		String newFileName = now + ext; // 파일명과 확장자 결합
		
		// 원본 파일명과 새로운 파일명을 이용해 File 인스턴스 생성
		File oldFile = new File(sDirectory + File.separator + fileName);
		File newFile = new File(sDirectory + File.separator + newFileName);
		oldFile.renameTo(newFile); // 파일명 변경
		
		return newFileName; // 변경된 파일명 반환
	}
	
	public static void download(HttpServletRequest req, HttpServletResponse resp, String directory, String sfileName, String ofileName) {
        String sDirectory = req.getServletContext().getRealPath(directory);
        
        try {
            // 파일을 찾아 입력 스트림 생성
            File file = new File(sDirectory, sfileName);
            InputStream iStream = new FileInputStream(file);

            // 한글 파일명 깨짐 방지
            String client = req.getHeader("User-Agent");
            if (client.indexOf("WOW64") == -1) {
                ofileName = new String(ofileName.getBytes("UTF-8"), "ISO-8859-1");
            }
            else {
                ofileName = new String(ofileName.getBytes("KSC5601"), "ISO-8859-1");
            }

            // 파일 다운로드용 응답 헤더 설정
            resp.reset();
            resp.setContentType("application/octet-stream");
            resp.setHeader("Content-Disposition",
                           "attachment; filename=\"" + ofileName + "\"");
            resp.setHeader("Content-Length", "" + file.length() );

            //out.clear();  // 출력 스트림 초기화

            // response 내장 객체로부터 새로운 출력 스트림 생성
            OutputStream oStream = resp.getOutputStream();

            // 출력 스트림에 파일 내용 출력
            byte b[] = new byte[(int)file.length()];
            int readBuffer = 0;
            while ( (readBuffer = iStream.read(b)) > 0 ) {
                oStream.write(b, 0, readBuffer);
            }

            // 입/출력 스트림 닫음
            iStream.close();
            oStream.close();
        }
        catch (FileNotFoundException e) {
            System.out.println("파일을 찾을 수 없습니다.");
            e.printStackTrace();
        }
        catch (Exception e) {
            System.out.println("예외가 발생하였습니다.");
            e.printStackTrace();
        }
    }
	
	public static void deleteFile(HttpServletRequest req, String directory, String filename) {
		String sDirectory = req.getServletContext().getRealPath(directory);
		File file = new File(sDirectory + File.separator + filename);
		
		if (file.exists()) {
			file.delete();
		}
	}
}