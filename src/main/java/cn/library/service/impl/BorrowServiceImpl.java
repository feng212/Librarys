package cn.library.service.impl;

import cn.library.entity.Borrow;
import cn.library.mapper.BooksMapper;
import cn.library.mapper.BorrowMapper;
import cn.library.service.BorrowService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
