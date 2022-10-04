package winwin.dto;

import java.util.Arrays;

public class ActivityArr {

	private Activity[] actArr;

	@Override
	public String toString() {
		return "ActivityArr [actArr=" + Arrays.toString(actArr) + "]";
	}

	public Activity[] getActArr() {
		return actArr;
	}

	public void setActArr(Activity[] actArr) {
		this.actArr = actArr;
	}
	
}
