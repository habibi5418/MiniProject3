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

public class removeMember {

	String fileName = "C:\\Temp\\project\\Member2.db";
	File file = new File(fileName);
	ObjectInputStream ois;
	public List<Member> memberList = new ArrayList<>();
	String table = "";
	
	@SuppressWarnings("unchecked")
	public removeMember() throws Exception {
		ois = new ObjectInputStream(new BufferedInputStream(new FileInputStream(file)));
		memberList = (List<Member>) ois.readObject();
	}
	
	public void saveMemberList(List<Member> newMemberList) throws Exception {
		ObjectOutputStream oos = new ObjectOutputStream(new BufferedOutputStream(new FileOutputStream(file)));
		oos.writeObject(newMemberList);
		oos.close();
	}
	public static void main(String[] args) throws Exception {
		removeMember a = new removeMember();
		
		System.out.println(a.memberList);
//		a.memberList.remove(new Member("","","",""));
//		a.saveMemberList(a.memberList);
	}

}
