package cn.qiucode.utils.watermarker;


import org.springframework.mock.web.MockMultipartFile;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * 对图片进行处理  添加水印
 * Created by wuming on 2019/1/29.
 */
public class WordWaterMarker {

    /**
     * 加文字水印
     * @param bufImg --BufferedImage  用来画图的宽高跟需要加水印的图片一样的空白图
     * @param img --需要加水印的图片
     * @param text --水印文字
     * @param font --字体
     * @param size --字体大小
     * @param color --颜色
     * @param imgWidth --图片宽度
     * @param imgHeight --图片高度
     * @param x  --水印相对于底片的x轴坐标(PS:左上角为(0,0))
     * @param y  --水印相对于底片的y轴坐标(PS:左上角为(0,0))
     * @author 上官江北
     * @version 2019年01月29日 下午22:55:57
     */
    //public static void markWord(BufferedImage bufImg, Image img, String text, Font font, Color color, int x, int y) {
    public static void markWord(BufferedImage bufImg, Image img, String text, Font font,int size, Color color, int imgWidth, int imgHeight) {
        //取到画笔
        Graphics2D g = bufImg.createGraphics();
        //画底片
        g.drawImage(img, 0, 0, bufImg.getWidth(), bufImg.getHeight(), null);
        g.setColor(color);
        g.setBackground(Color.BLACK);
        g.setFont(font);
        // 设置水印文字透明度
        g.setComposite (AlphaComposite.getInstance (AlphaComposite.SRC_ATOP, 0.190f));
        //位置
        //g.drawString(text, x, y);
        int x = -imgWidth / 2;
        int y = -imgHeight / 2;
        int markWidth = size * getLength(text);// 字体长度
        int markHeight = size;// 字体高度！
        // 设置水印旋转
        g.rotate (Math.toRadians (-40), (double) bufImg.getWidth () / 2, (double) bufImg.getHeight () / 2);
        // 循环添加水印
        while (x < imgWidth * 1.5) {
            y = -imgHeight / 2;
            while (y < imgHeight * 1.5) {
                //g.rotate(30 * Math.PI / 180);
                g.drawString (text, x, y);

                y += markHeight + 80;
            }
            x += markWidth + 80;
        }
        g.dispose();
    }

    /**
     * 获取字符长度，一个汉字作为 1 个字符, 一个英文字母作为 0.5 个字符
     * @param text
     * @return 字符长度，如：text="中国",返回 2；text="test",返回 2；text="中国ABC",返回 4.
     */
    public static int getLength(String text) {
        int textLength = text.length();
        int length = textLength;
        for (int i = 0; i < textLength; i++) {
            if (String.valueOf(text.charAt(i)).getBytes().length > 1) {
                length++;
            }
        }
        return (length % 2 == 0) ? length / 2 : length / 2 + 1;
    }

    /**
     * 直接给multipartFile加上文字水印再进行保存图片的操作方便省事
     *
     * @param multipartFile 文件上传的对象
     * @param  word  水印文字
     * @return  返回添加后的MultipartFile对象
     * @throws IOException
     * @author 上官江北
     * @version 2019年01月29日 下午22:55:57
     */
    public static MultipartFile addWorkMarkToMutipartFile(MultipartFile multipartFile,
                                                          String word) throws IOException {
        // 获取图片文件名 xxx.png xxx
        String originFileName = multipartFile.getOriginalFilename();
        // 获取原图片后缀 png
        int lastSplit = originFileName.lastIndexOf(".");
        String suffix = originFileName.substring(lastSplit + 1);
        // 获取图片原始信息
        String dOriginFileName = multipartFile.getOriginalFilename();
        String dContentType = multipartFile.getContentType();
        // 是图片且不是gif才加水印
        if (!suffix.equalsIgnoreCase("gif") && dContentType.contains("image")) {
            // 获取水印图片
            InputStream inputImg = multipartFile.getInputStream();
            Image img = ImageIO.read(inputImg);
            // 加图片水印
            int imgWidth = img.getWidth(null);
            int imgHeight = img.getHeight(null);

            BufferedImage bufImg = new BufferedImage(imgWidth, imgHeight,
                    BufferedImage.TYPE_INT_RGB);
            //设置字体
            int size=bufImg.getWidth()/16;
            Font font = new Font("宋体", Font.PLAIN, size);
            //调用画文字水印的方法 注释 使用循环添加水印
            /*int x=(imgWidth - (getLength(word) * bufImg.getWidth()/16)) / 2 + 10;
            int y=(imgHeight - bufImg.getWidth()/16) / 2 + 10;
            markWord(bufImg, img, word, font , Color.GREEN, x, y);*/
            markWord(bufImg, img, word, font ,size, Color.GRAY, imgWidth, imgHeight);
            ByteArrayOutputStream bs = new ByteArrayOutputStream();
            ImageOutputStream imOut = ImageIO.createImageOutputStream(bs);
            ImageIO.write(bufImg, suffix, imOut);
            InputStream is = new ByteArrayInputStream(bs.toByteArray());

            // 加水印后的文件上传
            multipartFile = new MockMultipartFile(dOriginFileName, dOriginFileName, dContentType,
                    is);
        }
        //返回加了水印的上传对象
        return multipartFile;
    }
}

