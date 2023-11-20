package blog

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/blog"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    blogReq "github.com/flipped-aurora/gin-vue-admin/server/model/blog/request"
)

type TblContentService struct {
}

// CreateTblContent 创建tblContent表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblContentService *TblContentService) CreateTblContent(tblContent *blog.TblContent) (err error) {
	err = global.GVA_DB.Create(tblContent).Error
	return err
}

// DeleteTblContent 删除tblContent表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblContentService *TblContentService)DeleteTblContent(tblContent blog.TblContent) (err error) {
	err = global.GVA_DB.Delete(&tblContent).Error
	return err
}

// DeleteTblContentByIds 批量删除tblContent表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblContentService *TblContentService)DeleteTblContentByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]blog.TblContent{},"id in ?",ids.Ids).Error
	return err
}

// UpdateTblContent 更新tblContent表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblContentService *TblContentService)UpdateTblContent(tblContent blog.TblContent) (err error) {
	err = global.GVA_DB.Save(&tblContent).Error
	return err
}

// GetTblContent 根据id获取tblContent表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblContentService *TblContentService)GetTblContent(id uint) (tblContent blog.TblContent, err error) {
	err = global.GVA_DB.Where("id = ?", id).First(&tblContent).Error
	return
}

// GetTblContentInfoList 分页获取tblContent表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblContentService *TblContentService)GetTblContentInfoList(info blogReq.TblContentSearch) (list []blog.TblContent, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // 创建db
	db := global.GVA_DB.Model(&blog.TblContent{})
    var tblContents []blog.TblContent
    // 如果有条件搜索 下方会自动创建搜索语句
    if info.StartCreatedAt !=nil && info.EndCreatedAt !=nil {
     db = db.Where("created_at BETWEEN ? AND ?", info.StartCreatedAt, info.EndCreatedAt)
    }
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }

	if limit != 0 {
       db = db.Limit(limit).Offset(offset)
    }
	
	err = db.Find(&tblContents).Error
	return  tblContents, total, err
}
