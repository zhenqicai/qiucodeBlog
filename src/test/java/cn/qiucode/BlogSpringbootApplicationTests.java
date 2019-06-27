package cn.qiucode;

import cn.qiucode.entity.Employee;
import cn.qiucode.funcinter.DefaultInter;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.function.Supplier;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

import static java.awt.Color.RED;

@RunWith(SpringRunner.class)
@SpringBootTest
public class BlogSpringbootApplicationTests {

	@Test
	public void test() {
		List<Employee> list=Employee.getEmployeeData();
		Stream<Employee> empStream= list.stream().filter(s->s.getName().startsWith("雷"));
		empStream.forEach(System.out::println);
	}

	@Test
	public void test2(){
		Runnable runnable=new Runnable() {
			@Override
			public void run() {
				System.out.println("使用Java8以前的版本！");
			}
		};
		runnable.run();
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		Runnable runnable2=()-> System.out.println("使用Java8的版本！");
		runnable2.run();
	}

	class DefaultImpl implements DefaultInter{

	}

	@Test
	public void test3(){
		DefaultImpl defaultImpl=new DefaultImpl();
		System.out.println(defaultImpl.count());
	}

	@Test
	public void test4(){
		System.out.println(DefaultInter.findName());
	}

	/**
	 * 字符串操作
	 * @param str 需要处理得字符串
	 * @param fun Function接口
	 * @return  处理之后得字符串
	 */
	public String operatorStr(String str,Function<String,String> fun){
		return fun.apply(str);
	}
	/**
	 * 函数型接口：Function<T,R>
	 */
	@Test
	public void test5(){
		String s=operatorStr("中国四大名著",str->str.substring(0,2));
		System.out.println(s);
	}

	public void consumerMoney(double money,Consumer<Double> c){
		c.accept(money);
	}
	/**
	 * 消费型接口Consumer<T>
	 */
	@Test
	public void test6(){
		consumerMoney(368,x->System.out.println("昨日买了个表，花了"+x+"元人民币。"));
	}

	/**
	 * 随机产生sum个数量得集合
	 * @param sum 集合内元素个数
	 * @param sup Supplier<T> 供给型接口
	 * @return
	 */
	public List<Integer> randomNum(int sum, Supplier<Integer> sup){
		List<Integer> list=new ArrayList<>();
		for(int i=0;i<sum;i++){
			list.add(sup.get());
		}
		return list;
	}

	/**
	 * 供给型接口，Supplier<T>
	 */
	@Test
	public void test7(){
		Random r=new Random();
		List<Integer> list=randomNum(10,()->r.nextInt());
		list.forEach(System.out::println);
	}

	/**
	 * 过滤字符串
	 * @param list 待过滤的字符串列表
	 * @param pre 断言型接口：Predicate<T>
	 * @return  过滤后新的字符串列表
	 */
	public List<String> filterStr(List<String> list, Predicate<String> pre){
		List<String> filterList=new ArrayList<>();
		for(String str : list){
			if(pre.test(str))
				filterList.add(str);
		}
		return  filterList;
	}
	@Test
	public void test8(){
		List<String> list=new ArrayList<>();
		list.add("张三");
		list.add("李四");
		list.add("王五");
		list.add("赵六");
		list.add("田七");
		list.add("王八");
		list.add("何九");
		//List<String> list2=Stream.of("王八").collect(Collectors.toList());
		filterStr(list,str->!str.startsWith("王")).forEach(System.out::println);
	}


	@Test
	public void test9(){
		Stream stream=Stream.of("张三","李四","赵六","王五");

		String[] strArr=new String[]{"张三","李四","赵六","王五"};
		stream=Stream.of(strArr);
		stream=Arrays.stream(strArr);

		List<String> strList= Arrays.asList(strArr);
		stream=strList.stream();

		IntStream.of(new int[]{1, 2, 3}).forEach(System.out::println);
		IntStream.range(1, 3).forEach(System.out::println);
		IntStream.rangeClosed(1, 3).forEach(System.out::println);

	}
	@Test
	public void test10(){
		List<String> strList=Arrays.asList("abcd","java8","select","where");
		strList.stream().map(String::toUpperCase).
				collect(Collectors.toList()).forEach(System.out::println);

	}

	@Test
	public void test11(){
		List<Integer> nums = Arrays.asList(1, 2, 3, 4);
		nums.stream().map(n -> n * n).
				collect(Collectors.toList()).forEach(System.out::println);
	}

	@Test
	public void test12(){
		Stream<List<Integer>> inputStream = Stream.of(
				Arrays.asList(1),
				Arrays.asList(2, 3),
				Arrays.asList(4, 5, 6)
		);
		Stream<Integer> outputStream = inputStream.
				flatMap((childList) -> childList.stream());
		outputStream.forEach(System.out::println);
	}

	@Test
	public void test13(){
		Integer[] sixNums = {1, 2, 3, 4, 5, 6};
		//filter()中需要使用断言型接口（Predicate）
		Integer[] evens =
				Stream.of(sixNums).filter(n -> n%2 == 0).toArray(Integer[]::new);
		for(int even : evens)
		  System.out.println(even);
	}

	@Test
	public void test14(){
		Stream.of("one", "two", "three", "four")
				.filter(e -> e.length() > 3)
				.peek(e -> System.out.println("Filtered value: " + e))
				.map(String::toUpperCase)
				.peek(e -> System.out.println("Mapped value: " + e))
				.collect(Collectors.toList());
	}
}
