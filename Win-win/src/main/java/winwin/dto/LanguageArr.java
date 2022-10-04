package winwin.dto;

import java.util.Arrays;

public class LanguageArr {

	private Language[] langArr;

	@Override
	public String toString() {
		return "LanguageArr [langArr=" + Arrays.toString(langArr) + "]";
	}

	public Language[] getLangArr() {
		return langArr;
	}

	public void setLangArr(Language[] langArr) {
		this.langArr = langArr;
	}

}