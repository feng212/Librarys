package cn.library.service.impl;

import cn.library.entity.BookDamage;
import cn.library.mapper.BookDamageMapper;
import cn.library.service.BookDamageService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 报损信息表 服务实现类
 * </p>
 *
 * @author 秋水浮萍
 * @since 2021-06-18
 */
@Service
public class BookDamageServiceImpl implements BookDamageService {

    @Autowired
    private BookDamageMapper mapper;

    @Override
    public PageInfo<BookDamage> damageList(int pageIndex, int pageSize) {
        PageHelper.startPage(pageIndex, pageSize);
        List<BookDamage> list = mapper.damageList();
        return new PageInfo<>(list);
    }

    @Override
    public int damageAdd(BookDamage damage) {
        return mapper.damageAdd(damage);
    }
}
