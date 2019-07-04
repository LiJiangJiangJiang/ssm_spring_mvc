package com.lijiang.controller;
 
import java.util.ArrayList;
import java.util.List;
 
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
 
import com.lijiang.bean.ItemInfo;
import com.lijiang.exception.MyException;
import com.lijiang.exception.MyLoginException;
import com.lijiang.service.ItemService;
 
@Controller
@RequestMapping("/admin/items/")
public class ItemController extends BaseController {
	@Autowired
	private ItemService itemService;
	
//	显示所有列表
	@RequestMapping("user/allList.do")
	public String selectAll(Model model,ItemInfo itemInfo) throws MyException {
		List<ItemInfo> itemList=itemService.selectAll(itemInfo);
 
		model.addAttribute("itemList", itemList);
		return "item_list";
	}
	
//	删除
	@RequestMapping("delete.do")
	public String delete(Integer id){
		itemService.deleteById(id);
		return "forward:user/allList.do";
	}
	
//	添加
	@RequestMapping("save.do")
	public String save(ItemInfo itemInfo){
		itemService.saveItem(itemInfo);
		return "forward:user/allList.do";
	}
	
//	修改
	@RequestMapping("update.do")
    public String update(ItemInfo itemInfo){
    	itemService.updateItem(itemInfo);
    	return "forward:user/allList.do";
    }
	
//	编辑 回显数据
	@RequestMapping("edit.do")
	@ResponseBody
	public ItemInfo edit(Integer id) {
		return itemService.selectItemInfoById(id);
	}
 
}