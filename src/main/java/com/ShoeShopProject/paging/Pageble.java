package com.ShoeShopProject.paging;

import com.ShoeShopProject.sort.Sorter;

public interface Pageble {
	Integer getPage();
	Integer getOffset();
	Integer getLimit();
	Sorter getSorter();
}
