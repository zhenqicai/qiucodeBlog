package cn.qiucode.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by wuming on 2019/6/22.
 */
public class Employee {

    private Integer id;
    private String name;//姓名
    private Integer age;//年龄
    private Double salary;//薪水

    public static List<Employee> getEmployeeData(){
        List<Employee> result=new ArrayList<>();
        result.add(new Employee(101,"张飞",24,5617.38));
        result.add(new Employee(104,"关羽",44,8617.58));
        result.add(new Employee(106,"刘备",31,6429.38));
        result.add(new Employee(121,"宋江",45,10897.38));
        result.add(new Employee(125,"卢俊义",26,8739.38));
        result.add(new Employee(136,"雷老虎",33,21617.38));
        result.add(new Employee(138,"方世玉",54,9617.38));
        return result;
    }

    public Employee(Integer id, String name, Integer age, Double salary) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.salary = salary;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Double getSalary() {
        return salary;
    }

    public void setSalary(Double salary) {
        this.salary = salary;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", salary=" + salary +
                '}';
    }
}
