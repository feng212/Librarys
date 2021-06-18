package cn.library.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Author 秋水浮萍
 * @Title
 * @Description
 * @Date 2021/6/15上午12:44
 * @Version
 */
@Data
public class BorrowModel implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 出借id
     */
    @TableId(value = "borrow_id", type = IdType.AUTO)
    private Integer borrowId;

    /**
     * 图书编号
     */
    private String bookId;

    /**
     * 用户id
     */
    private Integer userId;

    private String userName;

    /**
     * 借阅时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Shanghai")
    private Date borrowTime;

    private String borrowTimes;

//    public void setBorrowTimes(String borrowTimes) {
//        SimpleDateFormat fd = new SimpleDateFormat("YYYY-MM-dd HH:mm");
//        this.borrowTimes = fd.format(borrowTime);
//    }

    /**
     * 还书时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Shanghai")
    private Date returnTime;
    private String returnTimes;

//    public void setReturnTimes(String returnTimes) {
//        SimpleDateFormat fd = new SimpleDateFormat("YYYY-MM-dd HH:mm");
//        this.borrowTimes = fd.format(returnTime);
//    }

    private String bookName;

    private String borrowState;

    public void setBorrowState(String borrowState) {
        if (returnTime.equals(null)) this.borrowState = "未还";
        else this.borrowState = "已还";
    }
}
