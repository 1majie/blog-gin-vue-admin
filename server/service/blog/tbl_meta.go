package blog

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/blog"
	blogReq "github.com/flipped-aurora/gin-vue-admin/server/model/blog/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
)

type TblMetaService struct {
}

// CreateTblMeta 创建tblMeta表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblMetaService *TblMetaService) CreateTblMeta(tblMeta *blog.TblMeta) (err error) {
	err = global.GVA_DB.Create(tblMeta).Error
	return err
}

// DeleteTblMeta 删除tblMeta表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblMetaService *TblMetaService)DeleteTblMeta(tblMeta blog.TblMeta) (err error) {
	err = global.GVA_DB.Delete(&tblMeta).Error
	return err
}

// DeleteTblMetaByIds 批量删除tblMeta表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblMetaService *TblMetaService)DeleteTblMetaByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]blog.TblMeta{},"id in ?",ids.Ids).Error
	return err
}

// UpdateTblMeta 更新tblMeta表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblMetaService *TblMetaService)UpdateTblMeta(tblMeta blog.TblMeta) (err error) {
	err = global.GVA_DB.Save(&tblMeta).Error
	return err
}

// GetTblMeta 根据id获取tblMeta表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblMetaService *TblMetaService)GetTblMeta(id uint) (tblMeta blog.TblMeta, err error) {
	err = global.GVA_DB.Where("id = ?", id).First(&tblMeta).Error
	return
}

// GetTblMetaInfoList 分页获取tblMeta表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblMetaService *TblMetaService)GetTblMetaInfoList(info blogReq.TblMetaSearch) (list []blog.TblMeta, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // 创建db
	db := global.GVA_DB.Model(&blog.TblMeta{})
    var tblMetas []blog.TblMeta
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
	
	err = db.Find(&tblMetas).Error
	return  tblMetas, total, err
}


// GetTblMetaInfoListAll 分页获取tblMeta表记录
// Author [piexlmax](https://github.com/piexlmax)
func (tblMetaService *TblMetaService)GetTblMetaInfoListAll(mateType string) (list []blog.TblMeta, total int64, err error) {

	// 创建db
	db := global.GVA_DB.Model(&blog.TblMeta{})
	var tblMetas []blog.TblMeta
	// 如果有条件搜索 下方会自动创建搜索语句

	db = db.Where("type = ?",mateType)

	err = db.Count(&total).Error
	if err!=nil {
		return
	}

	err = db.Find(&tblMetas).Error
	return  tblMetas, total, err
}
