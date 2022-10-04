package winwin.dto;

import java.util.Arrays;

public class ExperienceArr {

	private Experience[] expArr;

	@Override
	public String toString() {
		return "ExperienceArr [expArr=" + Arrays.toString(expArr) + "]";
	}

	public Experience[] getExpArr() {
		return expArr;
	}

	public void setExpArr(Experience[] expArr) {
		this.expArr = expArr;
	}
	
}
