package com.lijiang.service;

import java.util.List;

import com.lijiang.bean.ItemInfo;
import com.lijiang.exception.MyException;

public interface ItemService {

	List<ItemInfo> selectAll(ItemInfo itemInfo) throws MyException;

	void deleteById(Integer id);

	void saveItem(ItemInfo itemInfo);

	void updateItem(ItemInfo itemInfo);

	ItemInfo selectItemInfoById(Integer id);







}
