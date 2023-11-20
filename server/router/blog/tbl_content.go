package blog

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type TblContentRouter struct {
}

// InitTblContentRouter 初始化 tblContent表 路由信息
func (s *TblContentRouter) InitTblContentRouter(Router *gin.RouterGroup) {
	tblContentRouter := Router.Group("tblContent").Use(middleware.OperationRecord())
	tblContentRouterWithoutRecord := Router.Group("tblContent")
	var tblContentApi = v1.ApiGroupApp.BlogApiGroup.TblContentApi
	{
		tblContentRouter.POST("createTblContent", tblContentApi.CreateTblContent)   // 新建tblContent表
		tblContentRouter.DELETE("deleteTblContent", tblContentApi.DeleteTblContent) // 删除tblContent表
		tblContentRouter.DELETE("deleteTblContentByIds", tblContentApi.DeleteTblContentByIds) // 批量删除tblContent表
		tblContentRouter.PUT("updateTblContent", tblContentApi.UpdateTblContent)    // 更新tblContent表
	}
	{
		tblContentRouterWithoutRecord.GET("findTblContent", tblContentApi.FindTblContent)        // 根据ID获取tblContent表
		tblContentRouterWithoutRecord.GET("getTblContentList", tblContentApi.GetTblContentList)  // 获取tblContent表列表
	}
}
