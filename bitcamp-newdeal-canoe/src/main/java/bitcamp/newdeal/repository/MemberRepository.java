package bitcamp.newdeal.repository;

import java.util.List;
import java.util.Map;

import bitcamp.newdeal.domain.Member;

public interface MemberRepository {

	List<Member> selectList();

    Member findByIdAndPassword(Map<String, Object> params);

}
