package cn.library.service.impl;

import cn.library.entity.Borrow;
import cn.library.mapper.BooksMapper;
import cn.library.mapper.BorrowMapper;
import cn.library.model.BorrowModel;
import cn.library.service.BorrowService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author 秋水浮萍
 * @since 2021-06-14
 */
@Service
public class BorrowServiceImpl implements BorrowService {

    @Autowired
    private BorrowMapper mapper;

    @Autowired
    private BooksMapper booksMapper;

    @Override
    public int borrowInsert(Borrow borrow) {
        return mapper.borrowInsert(borrow);
    }

    @Override
    public int bookState(int state, String bookId) {
        return booksMapper.bookState(state, bookId);
    }

    @Override
    public PageInfo<BorrowModel> borrowList(int userId, int pageIndex, int pageSize) {
        PageHelper.startPage(pageIndex, pageSize);
        List<BorrowModel> list = mapper.borrowList(userId);
        for (BorrowModel m : list
        ) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            m.setBorrowTimes(dateFormat.format(m.getBorrowTime()));
            if (m.getReturnTime() != null)
                m.setReturnTimes(dateFormat.format(m.getReturnTime()));
        }
        return new PageInfo<>(list);
    }

    @Override
    public PageInfo<BorrowModel> borrowAdminList(int pageIndex, int pageSize) {
        PageHelper.startPage(pageIndex, pageSize);
        List<BorrowModel> list = mapper.borrowAdminList();
        for (BorrowModel m : list
        ) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            m.setBorrowTimes(dateFormat.format(m.getBorrowTime()));
            if (m.getReturnTime() != null)
                m.setReturnTimes(dateFormat.format(m.getReturnTime()));
        }
        return new PageInfo<>(list);
    }

    @Override
    public int borrowReturn(int borrowId, String returnTime) {
        return mapper.borrowReturn(borrowId, returnTime);
    }
}
