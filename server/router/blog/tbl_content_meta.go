package blog

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type TblContentMetaRouter struct {
}

// InitTblContentMetaRouter 初始化 tblContentMeta表 路由信息
func (s *TblContentMetaRouter) InitTblContentMetaRouter(Router *gin.RouterGroup) {
	tblContentMetaRouter := Router.Group("tblContentMeta").Use(middleware.OperationRecord())
	tblContentMetaRouterWithoutRecord := Router.Group("tblContentMeta")
	var tblContentMetaApi = v1.ApiGroupApp.BlogApiGroup.TblContentMetaApi
	{
		tblContentMetaRouter.POST("createTblContentMeta", tblContentMetaApi.CreateTblContentMeta)   // 新建tblContentMeta表
		tblContentMetaRouter.DELETE("deleteTblContentMeta", tblContentMetaApi.DeleteTblContentMeta) // 删除tblContentMeta表
		tblContentMetaRouter.DELETE("deleteTblContentMetaByIds", tblContentMetaApi.DeleteTblContentMetaByIds) // 批量删除tblContentMeta表
		tblContentMetaRouter.PUT("updateTblContentMeta", tblContentMetaApi.UpdateTblContentMeta)    // 更新tblContentMeta表
	}
	{
		tblContentMetaRouterWithoutRecord.GET("findTblContentMeta", tblContentMetaApi.FindTblContentMeta)        // 根据ID获取tblContentMeta表
		tblContentMetaRouterWithoutRecord.GET("getTblContentMetaList", tblContentMetaApi.GetTblContentMetaList)  // 获取tblContentMeta表列表
	}
}
