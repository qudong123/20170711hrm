package com.syedu.hrm.base;

import com.syedu.hrm.constant.WebConstant;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.util.Random;

@Controller
public class VerifyController {


    // 定义图片的宽度
    private static final int IMG_WIDTH = 60;
    // 定义图片的高度
    private static final int IMG_HEIGHT = 22;
    // 定义Font
    private static Font font = new Font("宋体", Font.BOLD, 18);
    // 定义随机数对象
    private static Random random = new Random();

    @RequestMapping("/verifycode")
    public void  getCode(HttpServletRequest request, HttpServletResponse response) throws Exception{


        // 设置响应的内容类型为图片
        response.setContentType("images/jpeg");
        // 创建图片的缓冲流对象
        BufferedImage image = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, BufferedImage.TYPE_INT_RGB);
        // 得到画笔
        Graphics g = image.getGraphics();
        // 填充一个矩形框
        g.fillRect(0, 0, IMG_WIDTH, IMG_HEIGHT);

        // 绘制一个矩形框
        g.setColor(Color.black); // 设置画笔的颜色为黑色
        g.drawRect(0, 0, IMG_WIDTH - 1, IMG_HEIGHT - 1);

        // 绘制干扰线
        for (int i = 0; i < 100; i++){
            // 设置画笔的颜色
            g.setColor(new Color(200 + random.nextInt(50),
                    200 + random.nextInt(50),
                    200 + random.nextInt(50)));
            int x1 = 2 + random.nextInt(IMG_WIDTH - 4);
            int y1 = 2 + random.nextInt(IMG_HEIGHT - 4);
            int x2 = 2 + random.nextInt(IMG_WIDTH - 4);
            int y2 = 2 + random.nextInt(IMG_HEIGHT - 4);
            g.drawLine(x1, y1, x2, y2);
        }

        // 设置字体
        g.setFont(font);

        // 绘制验证码
        String str = "";
        for (int i = 0; i < 4; i++){
            // 随机产生一个验证码
            String temp = generatorCode();
            // 设置画笔的颜色
            g.setColor(new Color(random.nextInt(200),
                    random.nextInt(200),
                    random.nextInt(200)));

            int leftOffset = transForm(g);
            g.drawString(temp, 13 * i + leftOffset, 17);
            // 拼接验证码
            str += temp;
        }
        // 把最终生成的验证码存入Session
        request.getSession().setAttribute(WebConstant.VERIFY_CODE, str);
        // 消毁画笔
        g.dispose();
        // 输出
        ImageIO.write(image, "jpeg", response.getOutputStream());

    }

    private int transForm(Graphics g) {
        int leftOffset = 2;
        // 设置画笔的倾斜度
        Graphics2D gr = (Graphics2D)g;
        // 获取转换的对象
        AffineTransform tr = gr.getTransform();
        // 生成一个比率
        double shx = Math.random();
        if (shx < 0.2) shx = 0.2;
        if (shx > 0.5) shx = 0.5;
        if (random.nextInt(2) == 1){
            shx = 0 - shx;
            leftOffset = 10;
        }
        tr.setToShear(shx, 0);
        gr.setTransform(tr);

        return leftOffset;
    }
    /**
     * 随机产生一个验证码
     * @return
     */
    private static String generatorCode() {
        // 随机产生0-3的数字
        int witch = (int)(Math.random() * 3);

        switch (witch){
            case 0: // 大写字母(65-90)
                return String.valueOf((char)(Math.round(Math.random() * 25) + 65));
            case 1: // 小写字母(97-122)
                return String.valueOf((char)(Math.round(Math.random() * 25) + 97));
            case 2: // 数字(0-9)
                return String.valueOf(Math.round(Math.random() * 9));
            default: // 汉字(0x4E00(19968)-0x9FBF)
                return String.valueOf((char)(Math.round(Math.random() * 100) + 19968));
        }
    }
}
