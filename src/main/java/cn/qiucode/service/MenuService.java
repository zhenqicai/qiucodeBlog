package cn.qiucode.service;


import cn.qiucode.entity.Menu;

import java.util.List;

/**
 * Created by wuming on 2018/8/26.
 */
public interface MenuService {
    /**
     * 查找一、二级菜单
     * @return
     */
    public List<Menu> findMenu();

    /**
     * 查找一、二、三级菜单
     * @return
     */
    public List<Menu> findThirdMenu();
    public List<Menu> findThirdMenu2();

    public Menu findMenuById(int id);

    /**
     * 获取菜单用于编辑
     * @param id
     * @return
     */
    public Menu findMenuByIdToEdit(int id);

    public boolean addMenu(Menu menu);

    public boolean editMenu(Menu menu);

    /**
     * 通过菜单id删除该菜单
     * 删除条件  如果删除某个菜单  他存在子菜单  必须先删除子菜单
     * @param id
     * @return
     */
    public int deleteMenu(int id);
}
