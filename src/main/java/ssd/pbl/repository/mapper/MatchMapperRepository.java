package ssd.pbl.repository.mapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import ssd.pbl.model.TeacherMatchForm;

@Repository
public class MatchMapperRepository {

    @Autowired
    private MatchMapper matchMapper;

    @Transactional
    public void insertMatch(TeacherMatchForm teacherMatchForm) {

        int subject = matchMapper.selectSubjectIdBySubjectName(teacherMatchForm.getSubjectName());
        teacherMatchForm.setSubjectId(subject);

        // class insert
        matchMapper.insertClass(teacherMatchForm);

        // GUEST TO REGISTER
        matchMapper.updateStepToRegister(teacherMatchForm.getId());

        matchMapper.insertTeacherMatch(teacherMatchForm);
        int teacherMatchId = teacherMatchForm.getId();

        // 수업 가능한 지역 insert
        for (String dongId : teacherMatchForm.getDongIds().split(",")) {
            matchMapper.insertTeacherRegion(teacherMatchId, Integer.parseInt(dongId));
        }

        // 수업 시간 Insert
        matchMapper.insertTeacherTime(teacherMatchId, teacherMatchForm.getTime());

        // 성향 insert
        matchMapper.insertTeacherCharacter(teacherMatchId, teacherMatchForm.getCh1());
        matchMapper.insertTeacherCharacter(teacherMatchId, teacherMatchForm.getCh2());
        matchMapper.insertTeacherCharacter(teacherMatchId, teacherMatchForm.getCh3());
        matchMapper.insertTeacherCharacter(teacherMatchId, teacherMatchForm.getCh4());
        matchMapper.insertTeacherCharacter(teacherMatchId, teacherMatchForm.getCh5());
    }
}