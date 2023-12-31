package system

import (
	v1 "github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/gin-gonic/gin"
)

type BaseRouter struct{}

func (s *BaseRouter) InitBaseRouter(Router *gin.RouterGroup) (R gin.IRoutes) {
	baseRouter := Router.Group("base")
	baseApi := v1.ApiGroupApp.SystemApiGroup.BaseApi
	{
		baseRouter.POST("login", baseApi.Login)
		baseRouter.POST("captcha", baseApi.Captcha)
	}
	{
		baseRouter.GET("getTblContentList", baseApi.GetTblContentList)             // 获取tblContent表列表
		baseRouter.GET("getTblContentAll", baseApi.GetTblContentAll)               // 获取所有的tblContent
		baseRouter.GET("getTblContent", baseApi.FindTblContent)                    // 获取tblContent 内容
		baseRouter.GET("UpdateTblContentViewNum", baseApi.UpdateTblContentViewNum) // 获取tblContent表列表
		baseRouter.GET("GetUserName", baseApi.GetUserName)                         // 获取自身信息
	}
	return baseRouter
}
