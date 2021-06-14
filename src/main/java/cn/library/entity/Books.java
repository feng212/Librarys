package cn.library.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 图书信息表
 * </p>
 *
 * @author 秋水浮萍
 * @since 2021-06-11
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Books implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 图书编号
     */
    private String bookId;

    /**
     * 图书名
     */
    private String bookName;

    /**
     * 图书作者
     */
    private String bookAuthor;

    /**
     * 出版社
     */
    private String press;

    /**
     * 出版时间
     */
    private String publicationTime;

    /**
     * 图书简介信息
     */
    private String bookBrief;

    /**
     * 图书类型id
     */
    private Integer typeId;

    /**
     * 录入时间
     */
    @JsonFormat(pattern = "yy-MM-dd hh:mm")
    private Date createTime;


    /**
     * 单价
     */
    private Double price;

    /**
     * 0在库 1借出
     */
    private int state;


}
