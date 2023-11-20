package blog

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type TblMetaRouter struct {
}

// InitTblMetaRouter 初始化 tblMeta表 路由信息
func (s *TblMetaRouter) InitTblMetaRouter(Router *gin.RouterGroup) {
	tblMetaRouter := Router.Group("tblMeta").Use(middleware.OperationRecord())
	tblMetaRouterWithoutRecord := Router.Group("tblMeta")
	var tblMetaApi = v1.ApiGroupApp.BlogApiGroup.TblMetaApi
	{
		tblMetaRouter.POST("createTblMeta", tblMetaApi.CreateTblMeta)   // 新建tblMeta表
		tblMetaRouter.DELETE("deleteTblMeta", tblMetaApi.DeleteTblMeta) // 删除tblMeta表
		tblMetaRouter.DELETE("deleteTblMetaByIds", tblMetaApi.DeleteTblMetaByIds) // 批量删除tblMeta表
		tblMetaRouter.PUT("updateTblMeta", tblMetaApi.UpdateTblMeta)    // 更新tblMeta表
	}
	{
		tblMetaRouterWithoutRecord.GET("findTblMeta", tblMetaApi.FindTblMeta)        // 根据ID获取tblMeta表
		tblMetaRouterWithoutRecord.GET("getTblMetaList", tblMetaApi.GetTblMetaList)  // 获取tblMeta表列表
	}
}
