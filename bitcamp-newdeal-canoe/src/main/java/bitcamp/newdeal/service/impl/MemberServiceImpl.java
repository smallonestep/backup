package bitcamp.newdeal.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import bitcamp.newdeal.domain.Member;
import bitcamp.newdeal.repository.MemberRepository;
import bitcamp.newdeal.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	MemberRepository memberRepository;
	public MemberServiceImpl(MemberRepository memberRepository) {
		// TODO Auto-generated constructor stub
		this.memberRepository = memberRepository;
	}
	@Override
	public List<Member> list() {
		// TODO Auto-generated method stub
		return memberRepository.selectList();
	}
    @Override
    public Member getMember(String id, String password) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("id", id);
        params.put("password", password);
        return memberRepository.findByIdAndPassword(params);
    }

}
