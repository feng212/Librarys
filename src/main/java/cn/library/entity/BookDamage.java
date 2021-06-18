package cn.library.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 报损信息表
 * </p>
 *
 * @author 秋水浮萍
 * @since 2021-06-18
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class BookDamage implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 报损id
     */
    @TableId(value = "damage_id", type = IdType.AUTO)
    private Integer damageId;

    /**
     * 图书编号
     */
    private String bookId;

    /**
     * 报损时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Shanghai")
    private Date damageTime;

    private String bookName;

    /**
     * 报损原因
     */
    private String damageReason;

    /**
     * 处理结果
     */
    private String damageResults;

    /**
     * 报损数量
     */
    private Integer number;

    /**
     * 单价
     */
    private Double price;

    /**
     * 报损是否完成
     */
    private Integer isSolutions;

    private String time;

    public void setTime(String time) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        this.time = dateFormat.format(damageTime);
    }
}
