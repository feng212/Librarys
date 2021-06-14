package cn.library.service;

import cn.library.entity.Borrow;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 秋水浮萍
 * @since 2021-06-14
 */
public interface BorrowService  {
    int borrowInsert(Borrow borrow);
    int bookState(int state,String bookId);
}
