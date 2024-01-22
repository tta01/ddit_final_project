package jobja.atchfile.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import jobja.atchfile.mapper.AtchFileDetailMapper;
import jobja.atchfile.vo.AtchFileDetailVO;
import jobja.atchfile.vo.AtchFileVO;
import jobja.board.vo.BoardQNAVO;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Slf4j
@Controller
@RequestMapping("/file")
public class FileController {

	@Autowired
	String uploadFolder;

	@Autowired
	AtchFileDetailMapper atchFileDetailMapper;

	public String getFolder() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}

	// 이미지인지 판단
	public boolean checkImageType(File file) {
		
		log.info("여기가 왜 안들어오냐교");

		String contentType;

		try {
			contentType = Files.probeContentType(file.toPath());

			log.info("contentType999999999: " + contentType);

			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	// 파일 업로등 파일 객체들
	public int uploadFile(MultipartFile[] uploadFile, String atchFileId) {

		log.info("여기까지오냐?");
		int result = 0;

		log.info("uploadFolder : " + uploadFolder);
		log.info("getFolder() : " + getFolder());

		File uploadPath = new File(uploadFolder, getFolder());

		log.info("uploadPath : " + uploadPath);
		log.info("uploadPath.exists() : " + uploadPath.exists());

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		int i = 0;
		
		//1) ATCH_FILE 데이터 삭제 후
		
		for (MultipartFile multipartFile : uploadFile) {
			
			// upload한 파일의 이름이 1보다 작다(없다) => 파일이 존재하지 않는다
			if(multipartFile.getOriginalFilename().length() < 1) {
				break;
			}
			
			AtchFileVO atchFileVO = new AtchFileVO();
			
			if(i == 0) {
				atchFileVO.setAfId(atchFileId);
				int a = this.atchFileDetailMapper.insertAtchFile(atchFileVO);
				log.info("a : " + a);
				i++;
			}
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			log.info("나 uploadFileName : " + uploadFileName);

			UUID uuid = UUID.randomUUID();

			uploadFileName = uuid.toString() + "_" + uploadFileName;

			log.info("여기에 uploadFileName : " + uploadFileName);

			File saveFile = new File(uploadPath, uploadFileName);

			try(FileOutputStream thumbnail = new FileOutputStream(
					new File(uploadPath, "t_" + uploadFileName))) {
				multipartFile.transferTo(saveFile);
				
				// 썸네일
				// 이미지 파일인지 확인
				if(checkImagetype(saveFile)) { // 이미지 파일이다
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
				}
				
				log.info("있어요~~~");

				AtchFileDetailVO atchFileDetailVO = new AtchFileDetailVO();

				atchFileDetailVO.setAfId(atchFileId);

				atchFileDetailVO.setAfdSeq(0);

				atchFileDetailVO.setAfdSavePath(uploadPath + "/" + uploadFileName);

				atchFileDetailVO.setAfdSaveNm(getFolder().replaceAll("\\\\", "/") + "/" + uploadFileName);

				atchFileDetailVO.setAfdOriginNm(multipartFile.getOriginalFilename());

				atchFileDetailVO.setAfdExtsn(uploadFileName.substring(uploadFileName.lastIndexOf(".") + 1));

				atchFileDetailVO.setAfdCntnt("");

				atchFileDetailVO.setAfdFileSize(multipartFile.getSize());

				log.info("atchFileDetailVO이거 : " + atchFileDetailVO);
				
				//2) insert
				result += this.atchFileDetailMapper.insertAtchFileDetail(atchFileDetailVO);

			} catch (IllegalStateException | IOException e) {

				log.error(e.getMessage());
			}
		}
		return result;
	}

	
	// 파일 업로등 파일 객체들
		public String saveFileInTomcat(MultipartFile[] uploadFile, String atchFileId) {
			
			String aaa = "";

			log.info("여기까지오냐?");
			int result = 0;

			log.info("uploadFolder : " + uploadFolder);
			log.info("getFolder() : " + getFolder());

			File uploadPath = new File(uploadFolder, getFolder());

			log.info("uploadPath : " + uploadPath);
			log.info("uploadPath.exists() : " + uploadPath.exists());

			if (uploadPath.exists() == false) {
				uploadPath.mkdirs();
			}
			int i = 0;
			
			
			for (MultipartFile multipartFile : uploadFile) {
				
				// upload한 파일의 이름이 1보다 작다(없다) => 파일이 존재하지 않는다
				if(multipartFile.getOriginalFilename().length() < 1) {
					break;
				}
				
				AtchFileVO atchFileVO = new AtchFileVO();
				
				String uploadFileName = multipartFile.getOriginalFilename();
				
				log.info("uploadFileName : " + uploadFileName);

				UUID uuid = UUID.randomUUID();

				uploadFileName = uuid.toString() + "_" + uploadFileName;

				log.info("uploadFileName : " + uploadFileName);

				File saveFile = new File(uploadPath, uploadFileName);

				try(FileOutputStream thumbnail = new FileOutputStream(
						new File(uploadPath, "t_" + uploadFileName))) {
					multipartFile.transferTo(saveFile);
					
					// 썸네일
					// 이미지 파일인지 확인
					if(checkImagetype(saveFile)) { // 이미지 파일이다
						Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					}

					AtchFileDetailVO atchFileDetailVO = new AtchFileDetailVO();

					atchFileDetailVO.setAfId(atchFileId);

					atchFileDetailVO.setAfdSeq(0);

					atchFileDetailVO.setAfdSavePath(uploadPath + "/" + uploadFileName);

					
					
					log.info("aaaaaaaaaaaaaaaaaaaaaaaaaaa : " + aaa);
					
					atchFileDetailVO.setAfdSaveNm(getFolder().replaceAll("\\\\", "/") + "/" + uploadFileName);
					
					aaa = atchFileDetailVO.getAfdSaveNm();
					
					atchFileDetailVO.setAfdOriginNm(multipartFile.getOriginalFilename());

					atchFileDetailVO.setAfdExtsn(uploadFileName.substring(uploadFileName.lastIndexOf(".") + 1));

					atchFileDetailVO.setAfdCntnt("");

					atchFileDetailVO.setAfdFileSize(multipartFile.getSize());

					log.info("atchFileDetailVO : " + atchFileDetailVO);

				

				} catch (IllegalStateException | IOException e) {

					log.error(e.getMessage());
				}
			}
			return aaa;
		}
		
	private boolean checkImagetype(File saveFile) {

		String contentType;
		
		try {
			contentType = Files.probeContentType(saveFile.toPath());
			log.info("contentType : " + contentType);
			
			return contentType.startsWith("image");
			
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		
		return false;
	}
	
	@RequestMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource> downloadFile(String fileName) {

		log.info("fileName : " + fileName);

		// core.io
		// 파일의 경로 + 파일명
		Resource resource = new FileSystemResource(this.uploadFolder + fileName);

		log.info("downloadFile->path : " + (this.uploadFolder + fileName));

		String resourceName = resource.getFilename();

		log.info("resourceName : " + resourceName);

		// sprintframework.http
		// 헤더를 통해서 파일을 보낸다
		HttpHeaders headers = new HttpHeaders();

		try {

			// 파일명이 한글일 때 한글 처리
			headers.add("Content-Disposition",
					"attachment;filename=" + new String(resourceName.getBytes("UTF-8"), "ISO-8859-1"));

		} catch (UnsupportedEncodingException e) {

			log.error(e.getMessage());
		}
		// resource : 파일 / header : 파일명 등 정보 / HttpStatus.OK : 상태200(성공)
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	@ResponseBody
	@PostMapping("/deleteOneAtch")
	public List<AtchFileDetailVO> deleteOneAtch(@RequestBody AtchFileDetailVO atchFileDetailVO){
		
		log.info("deleteOneAtch -> atchFileDetailVO : " + atchFileDetailVO);
		
		int result = atchFileDetailMapper.deleteOneAtch(atchFileDetailVO);
		
		log.info("deleteOneAtch -> result : " + result);
		
		int rest = atchFileDetailMapper.getCount(atchFileDetailVO.getAfId());
		
		log.info("rest : " + rest);
		
		if(rest == 0) {
			atchFileDetailMapper.deleteAtchFile(atchFileDetailVO.getAfId());
		}
		
		List<AtchFileDetailVO> list = atchFileDetailMapper.list(atchFileDetailVO);
		
		log.info("deleteOneAtch -> list : " + list);
		
		return list;
		
	}

	public int deleteRelated(BoardQNAVO boardQNAVO) {
		log.info("ssibal -> boardQNAVO " + boardQNAVO);
		return atchFileDetailMapper.deleteRelated(boardQNAVO);
	}

	public int getCount(String afId) {
		return atchFileDetailMapper.getCount(afId);
	}

	public int deleteFileAjax(AtchFileDetailVO atchFileDetailVO) {
		
		return atchFileDetailMapper.deleteFileAjax(atchFileDetailVO);
	}
	
	// 파일 업로등 파일 객체들
	public AtchFileDetailVO uploadFileKeyCheck(MultipartFile[] uploadFile, String atchFileId) {

		log.info("여기까지오냐?");
		int result = 0;

		log.info("uploadFolder : " + uploadFolder);
		log.info("getFolder() : " + getFolder());

		File uploadPath = new File(uploadFolder, getFolder());

		log.info("uploadPath : " + uploadPath);
		log.info("uploadPath.exists() : " + uploadPath.exists());

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		int i = 0;
		
		AtchFileDetailVO atchFileDetailVO = new AtchFileDetailVO();
		
		
		for (MultipartFile multipartFile : uploadFile) {
			
			// upload한 파일의 이름이 1보다 작다(없다) => 파일이 존재하지 않는다
			if(multipartFile.getOriginalFilename().length() < 1) {
				break;
			}
			
			AtchFileVO atchFileVO = new AtchFileVO();
			
			int afCheck = this.atchFileDetailMapper.checkAfId(atchFileId);
			
			log.info("uploadFileKeyCheck -> afCheck 코난 : " +afCheck);
			
			if ( afCheck > 0) {
				
				log.info("0보다 크면 찍히겠지");
			} else {
				if(i == 0) {
					atchFileVO.setAfId(atchFileId);
					log.info("uploadFileKeyCheck -> atchFileVO : " +atchFileVO.getAfId());
					
					int a = this.atchFileDetailMapper.insertAtchFile(atchFileVO);
					
					log.info("111111a : " + a);
					i++;
				}
			}
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			log.info("uploadFileName : " + uploadFileName);

			UUID uuid = UUID.randomUUID();

			uploadFileName = uuid.toString() + "_" + uploadFileName;

			log.info("uploadFileName : " + uploadFileName);

			File saveFile = new File(uploadPath, uploadFileName);
			
			log.info("saveFile112299 : " +saveFile);

			try(FileOutputStream thumbnail = new FileOutputStream(
					new File(uploadPath, "t_" + uploadFileName))) {
				multipartFile.transferTo(saveFile);
				
				log.info("here i am~~~!!!!!!!!!!!!");
				
				// 썸네일
				// 이미지 파일인지 확인
				// 첨부파일인데 이미지인지 아닌지 확인 할 필요 없어서 주석처리 함
				// 어차피 이력서 list 에서 쓰는 메서드라 다른사람들은 이거 안 씀
//				if(checkImagetype(saveFile)) { // 이미지 파일이다
//					
//					log.info("asdwoowowowowowowwo");
//					
//					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
//					
//					log.info("erongeugnsregr");
//				}
				
				log.info("here i am~~~");

				atchFileDetailVO = new AtchFileDetailVO();

				atchFileDetailVO.setAfId(atchFileId);

				atchFileDetailVO.setAfdSeq(0);

				atchFileDetailVO.setAfdSavePath(uploadPath + "/" + uploadFileName);

				atchFileDetailVO.setAfdSaveNm(getFolder().replaceAll("\\\\", "/") + "/" + uploadFileName);

				atchFileDetailVO.setAfdOriginNm(multipartFile.getOriginalFilename());

				atchFileDetailVO.setAfdExtsn(uploadFileName.substring(uploadFileName.lastIndexOf(".") + 1));

				atchFileDetailVO.setAfdCntnt("");

				atchFileDetailVO.setAfdFileSize(multipartFile.getSize());
				
				atchFileDetailVO.setAfdUploadDt(new Date());

				log.info("atchFileDetailVO가나다라 : " + atchFileDetailVO);

				result += this.atchFileDetailMapper.insertAtchFileDetail(atchFileDetailVO);
				
				log.info("갔냐 갔냐 뿅갔냐 : " +result);

			} catch (IllegalStateException | IOException e) {

				log.error(e.getMessage());
			}
		}
		return atchFileDetailVO;
	}
	
	// 파일 업로등 파일 객체들
	public int uploadFileNoThumb(MultipartFile[] uploadFile, String atchFileId) {

		log.info("여기까지오냐?");
		int result = 0;

		log.info("uploadFolder : " + uploadFolder);
		log.info("getFolder() : " + getFolder());

		File uploadPath = new File(uploadFolder, getFolder());

		log.info("uploadPath : " + uploadPath);
		log.info("uploadPath.exists() : " + uploadPath.exists());

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		int i = 0;
		
		//1) ATCH_FILE 데이터 삭제 후
		
		for (MultipartFile multipartFile : uploadFile) {
			
			// upload한 파일의 이름이 1보다 작다(없다) => 파일이 존재하지 않는다
			if(multipartFile.getOriginalFilename().length() < 1) {
				break;
			}
			
			AtchFileVO atchFileVO = new AtchFileVO();
			
			if(i == 0) {
				atchFileVO.setAfId(atchFileId);
				int a = this.atchFileDetailMapper.insertAtchFile(atchFileVO);
				log.info("a : " + a);
				i++;
			}
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			log.info("나 uploadFileName : " + uploadFileName);

			UUID uuid = UUID.randomUUID();

			uploadFileName = uuid.toString() + "_" + uploadFileName;

			log.info("여기에 uploadFileName : " + uploadFileName);

			File saveFile = new File(uploadPath, uploadFileName);

			try(FileOutputStream thumbnail = new FileOutputStream(
					new File(uploadPath, "t_" + uploadFileName))) {
				multipartFile.transferTo(saveFile);
				
				// 썸네일
				// 이미지 파일인지 확인
//				if(checkImagetype(saveFile)) { // 이미지 파일이다
//					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
//				}
				
				log.info("있어요~~~");

				AtchFileDetailVO atchFileDetailVO = new AtchFileDetailVO();

				atchFileDetailVO.setAfId(atchFileId);

				atchFileDetailVO.setAfdSeq(0);

				atchFileDetailVO.setAfdSavePath(uploadPath + "/" + uploadFileName);

				atchFileDetailVO.setAfdSaveNm(getFolder().replaceAll("\\\\", "/") + "/" + uploadFileName);

				atchFileDetailVO.setAfdOriginNm(multipartFile.getOriginalFilename());

				atchFileDetailVO.setAfdExtsn(uploadFileName.substring(uploadFileName.lastIndexOf(".") + 1));

				atchFileDetailVO.setAfdCntnt("");

				atchFileDetailVO.setAfdFileSize(multipartFile.getSize());

				log.info("atchFileDetailVO이거 : " + atchFileDetailVO);
				
				//2) insert
				result += this.atchFileDetailMapper.insertAtchFileDetail(atchFileDetailVO);

			} catch (IllegalStateException | IOException e) {

				log.error(e.getMessage());
			}
		}
		return result;
	}
	
}