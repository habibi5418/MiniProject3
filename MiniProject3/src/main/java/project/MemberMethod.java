package project;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class MemberMethod {
	String fileName = "C:\\Temp\\project\\Member2.db";
	File file = new File(fileName);
	ObjectInputStream ois;
	public List<Member> memberList = new ArrayList<>();
	String table = "";
	
	@SuppressWarnings("unchecked")
	public MemberMethod() throws Exception {
		ois = new ObjectInputStream(new BufferedInputStream(new FileInputStream(file)));
		memberList = (List<Member>) ois.readObject();
	}
	
	public void saveMemberList(List<Member> newMemberList) throws Exception {
		ObjectOutputStream oos = new ObjectOutputStream(new BufferedOutputStream(new FileOutputStream(file)));
		oos.writeObject(newMemberList);
		oos.close();
	}
	
	public Optional<Member> findMemberUidPwd(String uid, String pwd) {
		Optional<Member> optionalMember = memberList.stream().filter(m -> m.getUid().equals(uid) && m.getPwd().equals(pwd)).findFirst(); 
		
		return optionalMember;
	}
	
	public Optional<Member> findMemberNamePhone(String name, String phone) {
		Optional<Member> optionalMember = memberList.stream().filter(m -> m.getName().equals(name) && m.getPhone().equals(phone)).findFirst(); 
		
		return optionalMember;
	}
	
	public Optional<Member> findMemberUidName(String uid, String name) {
		Optional<Member> optionalMember = memberList.stream().filter(m -> m.getUid().equals(uid) && m.getName().equals(name)).findFirst(); 
		
		return optionalMember;
	}
	
	public boolean existUid(String uid) {
		boolean result = memberList.stream().noneMatch(m -> m.getUid().equals(uid));
		
		return result;
	}
	
	public String getAllMemberPrint() {
		memberList.stream().forEach(m -> {
			table += "<tr><td>" + m.getUid() + "</td><td>" + m.getPwd() + "</td><td>" + m.getName() + "</td><td>" + m.getPhone() + "</td></tr>";
		});
		return table;
	}
	
	public void updateMember(String uid, Member newMember) {
		memberList.stream().forEach(m -> {
			if (m.getUid().equals(uid)) {
				memberList.set(memberList.indexOf(m), newMember);
				try {
					saveMemberList(memberList);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}); 
	}
	
	public boolean deleteMember(String uid, String pwd) throws Exception {
		boolean tf = false;
		Optional<Member> optionalMember = memberList.stream().filter(m -> m.getUid().equals(uid)).findFirst();
		Member deleteMember = optionalMember.get();
		
		if (deleteMember.getPwd().equals(pwd)) {
			memberList.remove(deleteMember);
			saveMemberList(memberList);	
			tf = true;
		} 
		
		return tf;
	}
}
