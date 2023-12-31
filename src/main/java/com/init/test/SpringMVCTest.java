package com.init.test;

;
import com.init.exception.UserNameNotMatchPasswordException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;

@Controller("test2")
public class SpringMVCTest {

    @RequestMapping("/testResponseEntity")
    public ResponseEntity<byte[]> testResponseEntity(HttpSession session) throws IOException {
        byte[] body = null;
        ServletContext servletContext = session.getServletContext();
        InputStream in = servletContext.getResourceAsStream("/files/abc.txt");
        body = new byte[in.available()];
        in.read(body);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attachment;filename=abc.txt");

        HttpStatus statusCode = HttpStatus.OK;

        ResponseEntity<byte[]> response = new ResponseEntity<byte[]>(body, headers, statusCode);
        return response;
    }

    @RequestMapping("/testFileUpload")
    public String testFileUpload(@RequestParam("desc") String desc,
                                 @RequestParam("file") MultipartFile file) throws IOException {
        System.out.println("desc: " + desc);
        System.out.println("OriginalFilename: " + file.getOriginalFilename());
        System.out.println("InputStream: " + file.getInputStream());
        return "success";
    }

    @RequestMapping("/testExceptionHandlerExceptionResolver")
    public String testExceptionHandlerExceptionResolver(@RequestParam("i") int i) {
        System.out.println("result: " + (10 / i));
        return "success";
    }

    /**
     * 1. 在 @ExceptionHandler 方法的入参中可以加入 Exception 类型的参数, 该参数即对应发生的异常对象
     * 2. @ExceptionHandler 方法的入参中不能传入 Map. 若希望把异常信息传导页面上, 需要使用 ModelAndView 作为返回值
     * 3. @ExceptionHandler 方法标记的异常有优先级的问题.
     * 4. @ControllerAdvice: 如果在当前 Handler 中找不到 @ExceptionHandler 方法来出来当前方法出现的异常,
     * 则将去 @ControllerAdvice 标记的类中查找 @ExceptionHandler 标记的方法来处理异常.
     */
	/*@ExceptionHandler({ArithmeticException.class})
	public ModelAndView handleArithmeticException(Exception ex){
		System.out.println("出异常了: " + ex);
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("exception", ex);
		return mv;
	}*/
    @ExceptionHandler({RuntimeException.class})
    public ModelAndView handleArithmeticException2(Exception ex) {
        System.out.println("[出异常了]: " + ex);
        ModelAndView mv = new ModelAndView("error");
        mv.addObject("exception", ex);
        return mv;
    }

    @ResponseStatus(reason = "测试", value = HttpStatus.NOT_FOUND)
    @RequestMapping("/testResponseStatusExceptionResolver")
    public String testResponseStatusExceptionResolver(@RequestParam("i") int i) {
        if (i == 13) {
            throw new UserNameNotMatchPasswordException();
        }
        System.out.println("testResponseStatusExceptionResolver...");
        return "success";
    }

    @RequestMapping(value = "/testDefaultHandlerExceptionResolver", method = RequestMethod.POST)
    public String testDefaultHandlerExceptionResolver() {
        System.out.println("testDefaultHandlerExceptionResolver...");
        return "success";
    }

    @RequestMapping("/testSimpleMappingExceptionResolver")
    public String testSimpleMappingExceptionResolver(@RequestParam("i") int i) {
        String[] vals = new String[10];
        System.out.println(vals[i]);
        return "success";
    }
}
