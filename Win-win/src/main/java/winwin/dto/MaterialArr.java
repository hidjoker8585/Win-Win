package winwin.dto;

import java.util.Arrays;

public class MaterialArr {

	private Material[] matArr;

	@Override
	public String toString() {
		return "MaterialArr [matArr=" + Arrays.toString(matArr) + "]";
	}

	public Material[] getMatArr() {
		return matArr;
	}

	public void setMatArr(Material[] matArr) {
		this.matArr = matArr;
	}
	
}
