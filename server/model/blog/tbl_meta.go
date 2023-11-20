// 自动生成模板TblMeta
package blog

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	
	
)

// tblMeta表 结构体  TblMeta
type TblMeta struct {
      global.GVA_MODEL
      Count  *int `json:"count" form:"count" gorm:"column:count;comment:项目所属内容个数;size:10;"`  //项目所属内容个数 
      Description  string `json:"description" form:"description" gorm:"column:description;comment:项目描述;size:255;"`  //项目描述 
      Name  string `json:"name" form:"name" gorm:"column:name;comment:项目名称;size:255;"`  //项目名称 
      Order  *int `json:"order" form:"order" gorm:"column:order;comment:内容排序;size:10;"`  //内容排序 
      Type  string `json:"type" form:"type" gorm:"column:type;comment:项目类型;size:255;"`  //项目类型 
}


// TableName tblMeta表 TblMeta自定义表名 tbl_meta
func (TblMeta) TableName() string {
  return "tbl_meta"
}

