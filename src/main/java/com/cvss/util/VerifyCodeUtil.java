package com.cvss.util;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

/**
 * Created by yufeng.liu on 2017-03-26.
 */
public class VerifyCodeUtil {

    //提供可以生成验证码的数字和字母
    private static final String VERIFY_CODE = "23456789ABCDEFGHJKLMNPQRSTUVWXYZ";
    private static Random random = new Random();

    private static String verifyCode = null;

    //得到随机代码
    private static char[] getRandomCodes(int num){
        char[] chars = new char[num];
        StringBuffer stringBuffer = new StringBuffer();
        for (int i = 0;i<num;i++){
            chars[i] = VERIFY_CODE .charAt(random.nextInt(VERIFY_CODE.length()));
            stringBuffer.append(chars[i]);
        }
        verifyCode = stringBuffer.toString();
        return chars;
    }

    /**
     *
     * @param width
     * @param height
     * @param num 多少位验证码
     * @return
     */
    private static BufferedImage getVerifyCodeImage(int width,int height,int num ){
        char[] codes = getRandomCodes(num);

        BufferedImage bufferedImage = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        Graphics2D graphics2D = bufferedImage.createGraphics();
        graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING,RenderingHints.VALUE_ANTIALIAS_ON);

        //设置背景色
        graphics2D.setColor(getColor(255,255,255));
        graphics2D.fillRect(0,0,width,height);

        //设置干扰线
        for(int i=0;i<5;i++){
            int x1 = (int)(Math.random() * 80);
            int y1 = (int)(Math.random() * 20);
            int x2 = (int)(Math.random() * 80);
            int y2 = (int)(Math.random() * 20);
            graphics2D.setColor(getRandomColor());
            graphics2D.drawLine(x1, y1, x2, y2);
        }

        //设置噪点
        float noisy = 0.03f;// 噪声率
        int area = (int) (noisy * width * height);
        for (int i = 0; i < area; i++) {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            bufferedImage.setRGB(x, y, random.nextInt(256));
        }

        //设置字体
        graphics2D.setFont(new Font("Microsoft YaHei",Font.BOLD,height-6));
        for (int i = 0; i < num; i++) {
            AffineTransform affine = new AffineTransform();
            affine.setToRotation(Math.PI / 4 * random.nextDouble() * (random.nextBoolean() ? 1 : -1), (width / num) * i + num/2, height/2);
            graphics2D.setTransform(affine);
            graphics2D.setColor(getRandomColor());
            graphics2D.drawChars(codes, i, 1, ((width-10) / num) * i + 5, height/2 + (height-4)/2 - 6);
        }

        graphics2D.dispose();

        return bufferedImage;
    }

    /**
     * 生成并输出图片
     * 此方法无用，换成
     * @param width
     * @param height
     * @param num
     * @param outputStream
     */
    public static void outPutImage(int width, int height,int num, OutputStream outputStream){
        try {
            ImageIO.write(getVerifyCodeImage(width,height,num),"JPG",outputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    /**
     * 将图片转为二进制
     * @param width
     * @param height
     * @param num
     * @return 二进制数组
     */
    public static byte[] outPutImage(int width, int height,int num){
        byte[] bytes = null;
        try {
            BufferedImage bufferedImage = getVerifyCodeImage(width,height,num);
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            ImageIO.write(bufferedImage,"JPG",byteArrayOutputStream);
            bytes = byteArrayOutputStream.toByteArray();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return bytes;
    }

    /**
     * 用来返回验证码的值
     * @return
     */
    public static String getVerifyCode(){
        return verifyCode;
    }

    private static Color getColor(int r,int g,int b){
        return new Color(r,g,b);
    }

    private static Color getRandomColor(){
        return new Color(random.nextInt(256),random.nextInt(256),random.nextInt(256));
    }


}
