package cn.library.service;

import cn.library.entity.Borrow;
import cn.library.model.BooksModel;
import cn.library.model.BorrowModel;
import com.baomidou.mybatisplus.extension.service.IService;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

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
    PageInfo<BorrowModel> borrowList(int userId,int pageIndex, int PageSize);
    PageInfo<BorrowModel> borrowAdminList(int pageIndex, int PageSize);
    int borrowReturn(@Param("borrowId") int borrowId, @Param("returnTime") String returnTime);
}
