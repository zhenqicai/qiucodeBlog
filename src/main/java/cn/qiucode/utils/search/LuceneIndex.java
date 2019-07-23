package cn.qiucode.utils.search;

import cn.qiucode.entity.Article;
import cn.qiucode.utils.RelativeDateFormat;
import org.apache.commons.lang.StringUtils;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer;
import org.apache.lucene.document.*;
import org.apache.lucene.index.*;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.*;
import org.apache.lucene.search.highlight.*;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

import org.springframework.stereotype.Component;

import java.io.StringReader;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
/**
 * @author 上官江北
 * @description 使用Lucene进行全文检索
 * @date 2019/7/1 23:08
 **/
@Component
public class LuceneIndex {
    private Directory dir=null;

    @Value("${qiucode.lucene-index-path}")
    private String luceneIndexPath;
    /**
     * 获取IndexWriter实例
     * @return
     * @throws Exception
     */
    private  IndexWriter getWriter()throws Exception{
        dir= FSDirectory.open(Paths.get(luceneIndexPath));
        SmartChineseAnalyzer analyzer=new SmartChineseAnalyzer();
        IndexWriterConfig iwc=new IndexWriterConfig(analyzer);
        IndexWriter writer=new IndexWriter(dir, iwc);
        return writer;
    }

    /**
     * 添加博客索引
     * @param art
     */
    public  void addIndex(Article art)throws Exception{
        IndexWriter writer=getWriter();
        Document doc=new Document();
        doc.add(new StringField("id",String.valueOf(art.getId()), Field.Store.YES));
        /**
         * yes是会将数据存进索引，如果查询结果中需要将记录显示出来就要存进去，如果查询结果
         * 只是显示标题之类的就可以不用存，而且内容过长不建议存进去
         * 使用TextField类是可以用于查询的。
         */
        doc.add(new TextField("title", art.getTitle(), Field.Store.YES));
        doc.add(new StringField("tags", art.getTags(), Field.Store.YES));
        doc.add(new StringField("createTime", RelativeDateFormat.showTime(art.getCreateTime()), Field.Store.YES));
        doc.add(new StringField("author", art.getAuthor(), Field.Store.YES));
        doc.add(new LongField("browsNum", art.getBrowsNum(), Field.Store.YES));
        doc.add(new IntField("comments", art.getComments(), Field.Store.YES));
        doc.add(new StringField("coverImage", art.getCoverImage(), Field.Store.YES));
        doc.add(new StringField("category", art.getCategory(), Field.Store.YES));
        doc.add(new TextField("remark", art.getRemark(), Field.Store.YES));

        writer.addDocument(doc);
        writer.close();
    }

    /**
     * 更新博客索引
     * @param art
     * @throws Exception
     */
    public void updateIndex(Article art)throws Exception{
        IndexWriter writer=getWriter();
        Document doc=new Document();

        doc.add(new StringField("id", String.valueOf(art.getId()), Field.Store.YES));
        //将博客的标题和内容作为索引存储到磁盘文件中

        doc.add(new TextField("title", art.getTitle(), Field.Store.YES));
        doc.add(new TextField("remark", art.getRemark(), Field.Store.YES));
        doc.add(new TextField("tags", art.getTags(), Field.Store.YES));

        /*doc.add(new StringField("create_time", DateUtil.formatDate(art.getCreated(),
                "yyyy-MM-dd HH:mm"), Field.Store.YES));*/
        writer.updateDocument(new Term("id",String.valueOf(art.getId())),doc);
        writer.commit();
        writer.close();
    }

    /**
     * 删除指定博客的索引
     * @param userId
     * @throws Exception
     */
    public void deleteIndex(String userId)throws Exception{
        IndexWriter writer=getWriter();
        writer.deleteDocuments(new Term("id", userId));
        writer.forceMergeDeletes(); // 强制删除
        writer.commit();
        writer.close();
    }

    /**=======
     * 查询用户
     * @param keyWord 查询关键字
     * @return
     * @throws Exception
     */
    public List<Article> searchArticle(String keyWord)throws Exception{
        /**
         * 注意的是查询索引的位置得是存放索引的位置，不然会找不到。
         */
        dir= FSDirectory.open(Paths.get(luceneIndexPath));
        IndexReader reader = DirectoryReader.open(dir);
        IndexSearcher is=new IndexSearcher(reader);
        BooleanQuery.Builder booleanQuery = new BooleanQuery.Builder();
        SmartChineseAnalyzer analyzer=new SmartChineseAnalyzer();
        /**
         * username和description就是我们需要进行查找的两个字段
         * 同时在存放索引的时候要使用TextField类进行存放。
         */
        /*QueryParser parser=new QueryParser("remark",analyzer);
        Query query=parser.parse(keyWord);
        QueryParser parser2=new QueryParser("title",analyzer);
        Query query2=parser2.parse(keyWord);
        QueryParser queryParser3 = new QueryParser( "tags", analyzer);
        Query query3 = queryParser3.parse(keyWord);

        booleanQuery.add(query, BooleanClause.Occur.SHOULD);
        booleanQuery.add(query2, BooleanClause.Occur.SHOULD);
        booleanQuery.add(query3, BooleanClause.Occur.SHOULD);*/


        String[] fieldNames=new String[]{"title","remark","tags"};
        MultiFieldQueryParser parser4 = new MultiFieldQueryParser(fieldNames, analyzer);
        Query query4=parser4.parse(keyWord);
        TopDocs hits=is.search(query4, 100);
        //TopDocs hits=is.search(booleanQuery.build(), 100);

        QueryScorer scorer4=new QueryScorer(query4);
        Fragmenter fragmenter = new SimpleSpanFragmenter(scorer4);
        
        /**
         * 这里可以根据自己的需要来自定义查找关键字高亮时的样式。
         */
        SimpleHTMLFormatter simpleHTMLFormatter=new SimpleHTMLFormatter("<b><font color='red'>","</font></b>");
        Highlighter highlighter=new Highlighter(simpleHTMLFormatter, scorer4);
        highlighter.setTextFragmenter(fragmenter);
        List<Article> artList=new LinkedList<Article>();
        for(ScoreDoc scoreDoc:hits.scoreDocs){
            Document doc=is.doc(scoreDoc.doc);
            Article art=new Article();
            art.setId(Integer.parseInt(doc.get("id")));
            art.setTags(doc.get("tags"));
            art.setCreateAt(doc.get("createTime"));
            art.setRemark(doc.get("remark"));

            art.setAuthor(doc.get("author"));
            art.setBrowsNum(Long.parseLong(doc.get("browsNum")));
            art.setComments(Integer.parseInt(doc.get("comments")));
            art.setCoverImage(doc.get("coverImage"));
            art.setCategory(doc.get("category"));


            String remark=doc.get("remark");
            String title=doc.get("title");
            if(remark!=null){
                TokenStream tokenStream = analyzer.tokenStream("remark", new StringReader(remark));
                String hContent=highlighter.getBestFragment(tokenStream, remark);
                if(StringUtils.isEmpty(hContent)){
                    art.setContent(remark);
                }else{
                    art.setContent(hContent);
                }
            }
            if(title!=null){
                TokenStream tokenStream = analyzer.tokenStream("title", new StringReader(title));
                String hTitle=highlighter.getBestFragment(tokenStream, title);
                if(StringUtils.isEmpty(hTitle)){
                    if(title.length()<=200){
                        art.setTitle(title);
                    }else{
                        art.setTitle(title.substring(0, 200));
                    }
                }else{
                    art.setTitle(hTitle);
                }
            }
            artList.add(art);
        }
        return artList;
    }

    public static void main(String [] args){
        LuceneIndex lucene=new LuceneIndex();

        Connection conn = null;
        String sql;
        //String url = "jdbc:mysql://localhost:3306/qiucodeblog?useUnicode=true&characterEncoding=UTF8&useSSL=false";
        String url="jdbc:mysql://localhost:3306/qiucodeblog?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8";
        String user="root";
        String password="root";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn= DriverManager.getConnection(url,user,password);
            // Statement里面带有很多方法，比如executeUpdate可以实现插入，更新和删除等
            Statement stmt = conn.createStatement();
            sql = "SELECT st.title category,sa.*," +
                    "        (case datediff(now(),sa.create_time)<=3 when 1 then 'new' else 'old' end) is_new" +
                    "        FROM qiu_article sa inner join qiu_article_type st on sa.typeid=st.id" +
                    "        where sa.status=1 order by sa.is_top desc,sa.create_time desc limit 0,10";
            ResultSet rs = stmt.executeQuery(sql);// executeQuery会返回结果的集合，否则返回空值
            while (rs.next()) {
                Article art=new Article();
                art.setCategory(rs.getString("category"));
                art.setId(Integer.parseInt(rs.getString("id")));
                art.setTitle(rs.getString("title"));
                art.setTags(rs.getString("tags"));
                art.setRemark(rs.getString("remark"));
                art.setCoverImage(rs.getString("cover_image"));
                art.setCreateTime(rs.getDate("create_time"));
                art.setBrowsNum(rs.getLong("brows_num"));
                art.setAuthor(rs.getString("author"));
                art.setComments(rs.getInt("comments"));
                lucene.addIndex(art);
            }
        }catch(Exception e){
            e.printStackTrace();
        }


       /* ApplicationContext act=new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        ArticleService articleService=act.getBean(ArticleService.class);
        Page2<Article> artPage=articleService.findAll(1,10);
        if(null!=artPage){
            List<Article> arts=artPage.getData();
            for(Article art : arts){
                try{
                    lucene.addIndex(art);
                }catch(Exception e){
                    e.printStackTrace();
                }

            }
        }*/
        /*try{
            List<Article> searchArts=lucene.searchArticle("腾讯云");
            for(Article art : searchArts){
                System.out.println("id="+art.getId()+"|时间="+art.getCreateAt()+"|标签="+art.getTags()+"|标题="+art.getTitle()+"|概要="+art.getRemark());
            }
        }catch(Exception e){
            e.printStackTrace();
        }*/

    }
}
