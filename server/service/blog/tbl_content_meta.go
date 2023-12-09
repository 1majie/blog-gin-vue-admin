package blog

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/blog"
	blogReq "github.com/flipped-aurora/gin-vue-admin/server/model/blog/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
)

type TblContentMetaService struct {
}

// CreateTblContentMeta 创建tblContentMeta表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblContentMetaService *TblContentMetaService) CreateTblContentMeta(tblContentMeta *blog.TblContentMeta) (err error) {
	err = global.GVA_DB.Create(tblContentMeta).Error
	return err
}

// DeleteTblContentMeta 删除tblContentMeta表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblContentMetaService *TblContentMetaService) DeleteTblContentMeta(tblContentMeta blog.TblContentMeta) (err error) {
	err = global.GVA_DB.Delete(&tblContentMeta).Error
	return err
}

// DeleteTblContentMetaByIds 批量删除tblContentMeta表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblContentMetaService *TblContentMetaService) DeleteTblContentMetaByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]blog.TblContentMeta{}, "id in ?", ids.Ids).Error
	return err
}

// DeleteTblContentMetaByContentIds 根据内容ID 批量删除tblContentMeta表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblContentMetaService *TblContentMetaService) DeleteTblContentMetaByContentId(id uint) (err error) {
	err = global.GVA_DB.Delete(&[]blog.TblContentMeta{}, "content_id = ?", id).Error
	return err
}

// UpdateTblContentMeta 更新tblContentMeta表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblContentMetaService *TblContentMetaService) UpdateTblContentMeta(tblContentMeta blog.TblContentMeta) (err error) {
	err = global.GVA_DB.Save(&tblContentMeta).Error
	return err
}

// GetTblContentMeta 根据id获取tblContentMeta表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblContentMetaService *TblContentMetaService) GetTblContentMeta(id uint) (tblContentMeta blog.TblContentMeta, err error) {
	err = global.GVA_DB.Where("id = ?", id).First(&tblContentMeta).Error
	return
}

// GetTblContentMetaInfoList 分页获取tblContentMeta表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblContentMetaService *TblContentMetaService) GetTblContentMetaInfoList(info blogReq.TblContentMetaSearch) (list []blog.TblContentMeta, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	// 创建db
	db := global.GVA_DB.Model(&blog.TblContentMeta{})
	var tblContentMetas []blog.TblContentMeta
	// 如果有条件搜索 下方会自动创建搜索语句
	if info.StartCreatedAt != nil && info.EndCreatedAt != nil {
		db = db.Where("created_at BETWEEN ? AND ?", info.StartCreatedAt, info.EndCreatedAt)
	}
	err = db.Count(&total).Error
	if err != nil {
		return
	}

	if limit != 0 {
		db = db.Limit(limit).Offset(offset)
	}

	err = db.Find(&tblContentMetas).Error
	return tblContentMetas, total, err
}

// GetTblContentMetaInfoListByContentId 根据内容ID获取tblContentMeta表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblContentMetaService *TblContentMetaService) GetTblContentMetaInfoListByContentId(info blog.TblContentMeta) (list []blog.TblContentMeta, total int64, err error) {

	// 创建db
	db := global.GVA_DB.Model(&blog.TblContentMeta{})
	var tblContentMetas []blog.TblContentMeta
	// 如果有条件搜索 下方会自动创建搜索语句
	if info.ContentId != nil {
		db = db.Where("content_id = ?", info.ContentId)
	}
	err = db.Count(&total).Error
	if err != nil {
		return
	}

	err = db.Find(&tblContentMetas).Error
	return tblContentMetas, total, err
}
