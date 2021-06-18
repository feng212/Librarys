package cn.library.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author 秋水浮萍
 * @since 2021-06-14
 */
@Data
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Borrow implements Serializable {

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

    /**
     * 借阅时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Shanghai")
    private Date borrowTime;

    /**
     * 还书时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Shanghai")
    private Date returnTime;


}
