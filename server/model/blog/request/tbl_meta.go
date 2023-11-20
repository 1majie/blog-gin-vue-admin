package request

import (
	"github.com/flipped-aurora/gin-vue-admin/server/model/blog"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"time"
)

type TblMetaSearch struct{
    blog.TblMeta
    StartCreatedAt *time.Time `json:"startCreatedAt" form:"startCreatedAt"`
    EndCreatedAt   *time.Time `json:"endCreatedAt" form:"endCreatedAt"`
    request.PageInfo
}
