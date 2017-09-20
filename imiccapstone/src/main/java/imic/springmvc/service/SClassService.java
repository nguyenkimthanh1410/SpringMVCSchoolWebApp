package imic.springmvc.service;

import java.util.List;

import imic.springmvc.dto.SClass;

public interface SClassService {
	
    public int insert(SClass sClass, String userlogin);//original: boolean
    
    public List<SClass> getAll();
    
    public SClass findById(Long sClassId);
    
    public int update(SClass sClass, String userlogin);//original: boolean
    
    public int deleteById(Long userId, String userlogin);    

    public long getMaxId();

	SClass createEmptyClass(String userlogin);

	public List<Long> getListSclassIds();    
 
}
