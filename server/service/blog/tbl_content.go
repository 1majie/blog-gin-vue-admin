package blog

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/blog"
	blogReq "github.com/flipped-aurora/gin-vue-admin/server/model/blog/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"gorm.io/gorm"
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
func (tblContentService *TblContentService) DeleteTblContent(tblContent blog.TblContent) (err error) {
	err = global.GVA_DB.Delete(&tblContent).Error
	return err
}

// DeleteTblContentByIds 批量删除tblContent表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblContentService *TblContentService) DeleteTblContentByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]blog.TblContent{}, "id in ?", ids.Ids).Error
	return err
}

// UpdateTblContent 更新tblContent表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblContentService *TblContentService) UpdateTblContent(tblContent blog.TblContent) (err error) {
	err = global.GVA_DB.Save(&tblContent).Error
	return err
}

// UpdateTblContent 更新tblContent表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblContentService *TblContentService) UpdateTblContentViewNum(id uint) (err error) {
	err = global.GVA_DB.Model(&blog.TblContent{}).Where("id = ?", id).UpdateColumn("view_num", gorm.Expr("view_num + ?", 1)).Error
	return err
}

// GetTblContent 根据id获取tblContent表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblContentService *TblContentService) GetTblContent(id uint) (tblContent blog.TblContent, err error) {
	err = global.GVA_DB.Where("id = ?", id).First(&tblContent).Error
	return
}

// GetTblContentSubsets 根据文章集获取文章子集记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblContentService *TblContentService) GetTblContentSubsets(set string) (list []blog.Results, err error) {
	// 创建db
	db := global.GVA_DB.Model(&blog.TblContent{})
	var tblContents []blog.Results
	err = db.Find(&tblContents).Error
	db.Select("subset, min(created_at) as created_at").Where("blog_set =?", set).
		Group("subset").Find(&tblContents)
	return tblContents, err
}

// GetTblContents 根据文章子集获取文章记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblContentService *TblContentService) GetTblContents(subset string) (list []blog.TblContent, err error) {
	// 创建db
	db := global.GVA_DB.Model(&blog.TblContent{})
	var tblContents []blog.TblContent
	db = db.Where("subset =? order by sequence", subset).Select("id,title,created_at")
	err = db.Find(&tblContents).Error
	return tblContents, err
}

// GetTblContentInfoList 分页获取tblContent表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblContentService *TblContentService) GetTblContentInfoList(info blogReq.TblContentSearch) (list []blog.TblContent, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	// 创建db
	db := global.GVA_DB.Model(&blog.TblContent{})
	var tblContents []blog.TblContent
	// 如果有条件搜索 下方会自动创建搜索语句
	if info.StartCreatedAt != nil && info.EndCreatedAt != nil {
		db = db.Where("created_at BETWEEN ? AND ?", info.StartCreatedAt, info.EndCreatedAt)
	}
	if len(info.Type) != 0 {
		db = db.Where("type =?", info.Type)
	}

	err = db.Count(&total).Error
	if err != nil {
		return
	}

	if limit != 0 {
		db = db.Limit(limit).Offset(offset)
	}

	err = db.Find(&tblContents).Error
	return tblContents, total, err
}
