package winwin.dto;

import java.util.Arrays;

public class JobopenArr {
	JobopenDetail[] detail;

	public JobopenDetail[] getDetail() {
		return detail;
	}

	public void setDetail(JobopenDetail[] detail) {
		this.detail = detail;
	}

	@Override
	public String toString() {
		return "JobopenArr [detail=" + Arrays.toString(detail) + "]";
	}
}
