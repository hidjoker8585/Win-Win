package winwin.dto;

import java.util.Arrays;

public class LicenseArr {

	private License[] licArr;

	@Override
	public String toString() {
		return "LicenseArr [licArr=" + Arrays.toString(licArr) + "]";
	}

	public License[] getLicArr() {
		return licArr;
	}

	public void setLicArr(License[] licArr) {
		this.licArr = licArr;
	}
	
}
