package ssd.pbl.repository.mapper;

import ssd.pbl.model.FindIDForm;

public interface TeacherMapper {
	String selectEmailByNameAndPhone(FindIDForm findIDForm);
}
