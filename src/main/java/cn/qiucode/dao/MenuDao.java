package cn.qiucode.dao;



import cn.qiucode.entity.Menu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by wuming on 2018/8/26.
 */
@Mapper
public interface MenuDao {

    /**
     * 获取后台左侧的父级菜单
     * @return
     */
    public List<Menu> findPidMenu();

    /**
     * 根据父id 获取对应的子菜单
     * @param pid
     * @return
     */
    public List<Menu> findChildrenMenu(int pid);

    /**
     * 查找出所有菜单  包括子菜单
     * @return
     */
    public List<Menu> findAllMenu();
    /**
     * 根据id查找出菜单
     * @param id
     * @return
     */
    public Menu findMenuById(int id);

    /**
     * 获取菜单用于编辑
     * @param id
     * @return
     */
    public Menu findMenuByIdToEdit(int id);

    /**
     * 添加菜单项
     * @param menu
     * @return
     */
    public boolean addMenu(Menu menu);

    /**
     * 修改菜单项
     * @param menu
     * @return
     */
    public boolean editMenu(Menu menu);

    /**
     * 删除菜单
     * @param id
     * @return
     */
    public int delMenu(int id);
}
