package cn.qiucode.service.impl;


import cn.qiucode.dao.MenuDao;
import cn.qiucode.entity.Menu;
import cn.qiucode.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by wuming on 2018/8/26.
 */
@Service("menuService")
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuDao menuDao;

    //@Override
    public List<Menu> findMenu() {
        List<Menu> pidMenu=menuDao.findPidMenu();
        List<Menu> children=null;
        if(null!=pidMenu){
            for(Menu menu:pidMenu){
                children=menuDao.findChildrenMenu(menu.getId());
                menu.setChildren(children);
            }
        }
        return pidMenu;
    }

    public List<Menu> findThirdMenu2(){
        List<Menu> pidMenu=menuDao.findPidMenu();
        List<Menu> children=null;
        List<Menu> thirdChild=null;
        if(null!=pidMenu){
            for(Menu menu:pidMenu){
                children=menuDao.findChildrenMenu(menu.getId());
                menu.setChildren(children);
                if(null!=children){
                    for(Menu child : children){
                        thirdChild= menuDao.findChildrenMenu(child.getId());
                        child.setChildren(thirdChild);
                    }
                }
            }
        }
        return pidMenu;
    }

    public List<Menu> findThirdMenu(){
        List<Menu> pidMenu=menuDao.findAllMenu();//findPidMenu();
        List<Menu> menuList=new ArrayList<Menu>();

        for(Menu menu : pidMenu){
            if(menu.getPid()==0){//pid为0 就是顶级菜单
                menuList.add(menu);
            }
        }
        //在顶级菜单列表设置子菜单
        for(Menu menu : menuList){
            menu.setChildren(getChild(menu.getId(),pidMenu));
        }
        return menuList;
        //return pidMenu;
    }

    /**
     * 递归查找子菜单
     * @param id 当前菜单id
     * @param menuList 要查找的列表
     * @return
     */
    private List<Menu> getChild(int id,List<Menu> menuList){
        List<Menu> childList = new ArrayList<Menu>();//存放子菜单
        for(Menu menu : menuList){
            if(menu.getPid()!=0){//pid不为0 也就不是顶级菜单
                if(id==menu.getPid()){//原始菜单结果集（也就是从数据库查询出的所有数据）
                    childList.add(menu);//这个id也就是顶级菜单的id，如果与原始结果集的pid相等，就添加到新的List中
                }
            }
        }
        // 把子菜单的子菜单再循环一遍
        for(Menu menu : childList){
            menu.setChildren(getChild(menu.getId(),menuList));
        }
        if(childList.size()==0){
            return null;
        }
        return childList;
    }


    public Menu findMenuById(int id){
        return menuDao.findMenuById(id);
    }

    /**
     * 用于编辑
     * @param id
     * @return
     */
    public Menu findMenuByIdToEdit(int id){
        return menuDao.findMenuByIdToEdit(id);
    }
    public boolean addMenu(Menu menu){
        /*if(null==menu.getPid()){
            menu.setPid(0);
        }
        menu.setType(1);
        menu.setStatus(1);
        menu.setCreateTime(System.currentTimeMillis());*/
        return menuDao.addMenu(menu);
    }

    public boolean editMenu(Menu menu){
        return menuDao.editMenu(menu);
    }

    /**
     * 通过菜单id删除该菜单
     * 删除条件  如果删除某个菜单  他存在子菜单  必须先删除子菜单
     * @param id
     * @return
     */
    //@Override
    public int deleteMenu(int id) {
        Menu delmenu=menuDao.findMenuById(id);//将要删除的菜单
        List<Menu> menuList=menuDao.findAllMenu();//所有菜单集合
        int res=0;
        for(Menu menu : menuList){
            if(menu.getPid()==delmenu.getId()){//如果要删除的pid等于菜单集合中某个菜单id 说明有子菜单
                res=-1;
                //break;
                return res;
            }
        }
        res=menuDao.delMenu(id);
        return res;
    }
}
