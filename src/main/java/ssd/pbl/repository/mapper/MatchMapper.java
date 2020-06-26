package ssd.pbl.repository.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import ssd.pbl.model.TeacherMatchForm;

@Mapper
public interface MatchMapper {

    void insertTeacherMatch(TeacherMatchForm teacherMatchForm);

    void insertClass(TeacherMatchForm teacherMatchForm);

    void insertTeacherCharacter(@Param("id")int id, @Param("characterId") int characterId);

    void insertTeacherTime(@Param("id") int id, @Param("time") String time);

    void insertTeacherRegion(@Param("id") int id, @Param("dongId") int dongId);

    void updateStepToRegister(@Param("id") int id);

    int selectSubjectIdBySubjectName(@Param("subjectName") String subjectName);

}
