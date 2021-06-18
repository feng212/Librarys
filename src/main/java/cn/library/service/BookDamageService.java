package cn.library.service;

import cn.library.entity.BookDamage;
import cn.library.entity.BookType;
import com.baomidou.mybatisplus.extension.service.IService;
import com.github.pagehelper.PageInfo;

/**
 * <p>
 * 报损信息表 服务类
 * </p>
 *
 * @author 秋水浮萍
 * @since 2021-06-18
 */
public interface BookDamageService  {
    PageInfo<BookDamage> damageList(int pageIndex, int pageSize);
    int damageAdd(BookDamage damage);
}
