package eltag;

public class MyTagLib {
	//메소드는 public하고 static해야 한다. 또 반드시 반환값이 있어야 한다.
	public static boolean isNumber(String value) {
		//"20A"
		for(int i = 0 ; i < value.length(); i++) {
			/*codePointAt만 사용
			if(!(Character.codePointAt(value, i) >= '0' &&
					Character.codePointAt(value, i) <= '9'))
				return false;
			*/
			if(!Character.isDigit(Character.codePointAt(value, i))) {
				
				return false;
			}
		}
		return true;
	}////////////////////isNumber(String value)
	/*
	 * 문]주민번호를 인자로 받아 남성인 경우 "남자"
	 *    여성인 경우 "여자"를 반환하는 메소드(getGender) 정의
	 *    그리고 이를 tld파일에 정의해라
	 *    주민번호 ex)121212-1123423
	 */
	public static String getGender(String ssn) {
		String getGen = ssn;
		if(ssn.charAt(7) == '1') {
			getGen = "남자";
			return getGen;
		}
		else {
			getGen = "여자";
			return getGen;
		}
	}
	/*
	 * 샘 메소드
	 * public static String getGender(String ssn) {
	 * 		return ssn.substring(ssn.indexOf("-")+1, ssn.indexOf("-")+2).equals("1") ? "남자" : "여자";
	 * }
	 */
}////////MyTagLib////////
