package winwin.dto;

import java.util.Arrays;

public class CareerArr {

	private Career[] carArr;

	@Override
	public String toString() {
		return "CareerArr [carArr=" + Arrays.toString(carArr) + "]";
	}

	public Career[] getCarArr() {
		return carArr;
	}

	public void setCarArr(Career[] carArr) {
		this.carArr = carArr;
	}
	
}
