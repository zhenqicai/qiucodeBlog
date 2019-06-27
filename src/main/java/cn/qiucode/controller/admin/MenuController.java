package cn.qiucode.controller.admin;


import cn.qiucode.entity.Menu;
import cn.qiucode.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wuming on 2018/8/26.
 */
@Controller
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    @RequestMapping("/loadMenu")
    @ResponseBody
    public List<Menu> loadMenu(){
        return  menuService.findMenu();
    }

    @RequestMapping("/index")
    public String menuIndex(){
        return "admin/menu/index";
    }
    @RequestMapping("/loadThirdMenu-qiu-code")
    @ResponseBody
    public List<Menu> loadThirdMenu(){
        return  menuService.findThirdMenu();
    }

    @RequestMapping("/loadAdd")
    public String loadAddFrame(Model model, Integer pid){
        Menu menu=menuService.findMenuById(pid);
        model.addAttribute("menu",menu);
        return "admin/menu/add";
    }

    @RequestMapping("/add")
    @ResponseBody
    public Map<String,Object> addMenu(Menu menu){
        Map<String,Object> result=new HashMap<String,Object>();
        if(null==menu.getPid()){
            menu.setPid(0);
        }
        menu.setType(1);
        menu.setStatus(1);
        menu.setCreateTime(1508986857L);
        //menu.setCreateTime(System.currentTimeMillis());
        boolean flag=menuService.addMenu(menu);
        if(flag){
            result.put("code",1);
            result.put("msg","添加菜单成功");
            result.put("url","/menu/index");
        }else{
            result.put("code",-1);
            result.put("msg","添加菜单失败");
        }
        return result;
    }

    @RequestMapping("/loadEdit")
    public String loadEditFrame(Model model, Integer id){
        Menu menu=menuService.findMenuByIdToEdit(id);
        model.addAttribute("menu",menu);
        return "admin/menu/edit";
    }
    @RequestMapping("/edit")
    @ResponseBody
    public Map<String,Object> editMenu(Menu menu){
        Map<String,Object> result=new HashMap<String,Object>();
        boolean flag=menuService.editMenu(menu);
        if(flag){
            result.put("code",1);
            result.put("msg","修改菜单成功");
        }else{
            result.put("code",-1);
            result.put("msg","修改菜单失败");
        }
        return result;
    }
    @RequestMapping("/delete")
    @ResponseBody
    public Map<String,Object> delMenu(Integer id){
        Map<String,Object> result=new HashMap<String,Object>();
        int res=menuService.deleteMenu(id);
        if(res==-1){
            result.put("code",-1);
            result.put("msg","必须先删除子菜单");
        }else{
            result.put("code",1);
            result.put("msg","删除菜单成功");
        }
        return result;
    }
}
