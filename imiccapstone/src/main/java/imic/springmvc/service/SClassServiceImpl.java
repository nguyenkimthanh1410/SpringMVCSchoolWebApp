package imic.springmvc.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import imic.springmvc.dao.SClassDao;
import imic.springmvc.dto.SClass;
import imic.springmvc.dto.User;

@Repository(value="sClassService")
public class SClassServiceImpl implements SClassService {

	private SClassDao sClassDao;
	
	public SClassServiceImpl() {
	}

	@Autowired 
    public SClassServiceImpl(SClassDao sClassDao) {
		this.sClassDao = sClassDao;
    }
	
	//////////////////CREATE
	public int insert(SClass sClass, String userlogin) {
		return sClassDao.insert(sClass, userlogin);
	}
	
	
	////////////////READ ALL
	public List<SClass> getAll(){			
		return sClassDao.getAll();
	}
	
	
	////////////////READ BY ID
	public SClass findById(Long sClassId){
		return sClassDao.findById(sClassId);
	}

	
	///////////////UPDATE BY ID	
	public int update(SClass sClass, String userlogin) {
		return sClassDao.update(sClass, userlogin);
	}

	////////////////DELETE BY ID
	public int deleteById(Long sClassId, String userlogin){
		return sClassDao.deleteById(sClassId, userlogin);
	}
	
	
	////////////////GET USER MAX ID
	@Override
	public long getMaxId() {
		return sClassDao.getMaxId();
	}	

	@Override
	public SClass createEmptyClass(String userlogin) {
		
		// Create an empty class		
		SClass sClass = new SClass();
		//sClass.setsClassId(null);
		sClass.setsClassName("something to talk about");
		sClass.setStartDate(new Date());
		sClass.setEndDate(new Date());
		sClass.setTeacherId(3L);
		sClass.setLastUpdated(new Date());
		sClass.setLastUpdatedBy(userlogin);
				
		return sClass;
	}

	@Override
	public List<Long> getListSclassIds() {		
		return sClassDao.getListSclassIds();
	}
	
	
}
