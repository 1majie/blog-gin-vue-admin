// 自动生成模板TblContentMeta
package blog

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	
	
)

// tblContentMeta表 结构体  TblContentMeta
type TblContentMeta struct {
      global.GVA_MODEL
      ContentId  *int `json:"contentId" form:"contentId" gorm:"column:content_id;comment:内容ID;size:19;"`  //内容ID 
      MateId  *int `json:"mateId" form:"mateId" gorm:"column:mate_id;comment:项目ID;size:19;"`  //项目ID 
}


// TableName tblContentMeta表 TblContentMeta自定义表名 tbl_content_meta
func (TblContentMeta) TableName() string {
  return "tbl_content_meta"
}

