package bang.common.common;

import java.io.File;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
	
//	private static final String filePath = "C:\\dev\\file\\";
	private static final String tempFilePath = "/Users/felix/Pictures/tempImages/";
//	private static final String realFilePath = "/Users/felix/Pictures/realImages/";

	/* CommonController 에서 이미지 저장할 때 호출 */
	public static String getTempFileUrl(HttpServletRequest request) throws Exception{
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
    	Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
    	
    	MultipartFile multipartFile = null;
    	String originalFileName = null;
    	String originalFileExtension = null;
    	String storedFileName = null;
    	String returnUrl = null;
    	
        File file = new File(tempFilePath);
        if(file.exists() == false){
        	file.mkdirs();
        }
        
        while(iterator.hasNext()){
        	multipartFile = multipartHttpServletRequest.getFile(iterator.next());
        	if(multipartFile.isEmpty() == false){
        		originalFileName = multipartFile.getOriginalFilename();
        		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
        		storedFileName = CommonUtils.getNowTimeToString() + "_" + originalFileName;
        		
        		file = new File(tempFilePath + storedFileName);
        		multipartFile.transferTo(file);
        		
        		returnUrl = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/GetTempFile.tr?filename="+storedFileName;
        	}
        }
		return returnUrl;
	}

//	public String moveToReal(String tempFilename, String category, int articleid, String filename) {
//		File temp = new File(tempFilePath+tempFilename);
//		File dir = new File(realFilePath+category+"\\"+articleid);
//		
//		if (!dir.exists()) { //폴더 없으면 폴더 생성
//            dir.mkdirs();
//        }
//		
//		String targetString = "";
//		File target = new File(realFilePath+category+"\\"+articleid+"\\"+filename);
//		
//		
//		if(temp.exists()) {
//			while(target.exists()) {
//				targetString = CommonUtils.getNowTimeToString() + "-"+filename;
//				target = new File(realFilePath+category+"\\"+articleid+"\\"+targetString);
//			}
//			temp.renameTo(target);
//			
//	    }
//		return targetString;
//	}
	
	/* 썸네일 등록 */
	public Map<String,Object> parseInsertFileInfo(Map<String,Object> map, MultipartHttpServletRequest request) throws Exception{
		
    	Iterator<String> iterator = request.getFileNames();
    	MultipartFile multipartFile = null;
    	String originalFileName = null;
    	String originalFileExtension = null;
    	String storedFileName = null;
    	String returnUrl = null;
    	
        File file = new File(tempFilePath);
        if(file.exists() == false){
        	file.mkdirs();
        }
        
    	if(map.get("IMAGE") == null) {
        	if(request.getFile("RV_IMAGE") != null) {
        		multipartFile = request.getFile("RV_IMAGE");
    			originalFileName = multipartFile.getOriginalFilename();
        		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
        		storedFileName = CommonUtils.getNowTimeToString() + "_" + originalFileName;
        		
        		file = new File(tempFilePath + storedFileName);
        		multipartFile.transferTo(file);
        		
        		returnUrl = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/GetTempFile.tr?filename="+storedFileName;
        	} else if(request.getFile("RC_IMAGE") != null) {
        		multipartFile = request.getFile("RC_IMAGE");
        		originalFileName = multipartFile.getOriginalFilename();
        		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
        		storedFileName = CommonUtils.getNowTimeToString() + "_" + originalFileName;
        		
        		file = new File(tempFilePath + storedFileName);
        		multipartFile.transferTo(file);
        		
        		returnUrl = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/GetTempFile.tr?filename="+storedFileName;
        	} else if(request.getFile("TR_IMAGE") != null) {
        		multipartFile = request.getFile("TR_IMAGE");
        		originalFileName = multipartFile.getOriginalFilename();
        		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
        		storedFileName = CommonUtils.getNowTimeToString() + "_" + originalFileName;
        		
        		file = new File(tempFilePath + storedFileName);
        		multipartFile.transferTo(file);
        		
        		returnUrl = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/GetTempFile.tr?filename="+storedFileName;
        	}
    	} else {
    		returnUrl = (String) map.get("IMAGE");
    	}
       
        map.put("IMAGE", returnUrl);
        
		return map;
	}
}
