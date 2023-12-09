package blog

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/blog"
	blogReq "github.com/flipped-aurora/gin-vue-admin/server/model/blog/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
	"github.com/flipped-aurora/gin-vue-admin/server/service"
	"github.com/flipped-aurora/gin-vue-admin/server/utils"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

type TblContentApi struct {
}

var tblContentService = service.ServiceGroupApp.BlogServiceGroup.TblContentService

// CreateTblContent 创建tblContent表
// @Tags TblContent
// @Summary 创建tblContent表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body blog.TblContent true "创建tblContent表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"创建成功"}"
// @Router /tblContent/createTblContent [post]
func (tblContentApi *TblContentApi) CreateTblContent(c *gin.Context) {
	var tblContent blog.TblContent
	err := c.ShouldBindJSON(&tblContent)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	userId := utils.GetUserID(c)
	tblContent.AuthorId = &userId
	if err := tblContentService.CreateTblContent(&tblContent); err != nil {
		global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		// 遍历标签 插入关联表中
		for _, tag := range tblContent.Tags {
			var contentId = int(tblContent.ID)
			tblContentMate := blog.TblContentMeta{
				MateId:    &tag,
				ContentId: &contentId,
			}
			if err := tblContentMetaService.CreateTblContentMeta(&tblContentMate); err != nil {
				global.GVA_LOG.Error("创建失败!", zap.Error(err))
			}
		}
		response.OkWithMessage("创建成功", c)
	}
}

// DeleteTblContent 删除tblContent表
// @Tags TblContent
// @Summary 删除tblContent表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body blog.TblContent true "删除tblContent表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /tblContent/deleteTblContent [delete]
func (tblContentApi *TblContentApi) DeleteTblContent(c *gin.Context) {
	var tblContent blog.TblContent
	err := c.ShouldBindJSON(&tblContent)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := tblContentService.DeleteTblContent(tblContent); err != nil {
		global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeleteTblContentByIds 批量删除tblContent表
// @Tags TblContent
// @Summary 批量删除tblContent表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除tblContent表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /tblContent/deleteTblContentByIds [delete]
func (tblContentApi *TblContentApi) DeleteTblContentByIds(c *gin.Context) {
	var IDS request.IdsReq
	err := c.ShouldBindJSON(&IDS)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := tblContentService.DeleteTblContentByIds(IDS); err != nil {
		global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdateTblContent 更新tblContent表
// @Tags TblContent
// @Summary 更新tblContent表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body blog.TblContent true "更新tblContent表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /tblContent/updateTblContent [put]
func (tblContentApi *TblContentApi) UpdateTblContent(c *gin.Context) {
	var tblContent blog.TblContent
	err := c.ShouldBindJSON(&tblContent)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	userId := utils.GetUserID(c)
	tblContent.AuthorId = &userId
	if err := tblContentService.UpdateTblContent(tblContent); err != nil {
		global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		// 先删除关联的标签
		if err := tblContentMetaService.DeleteTblContentMetaByContentId(tblContent.ID); err != nil {
			global.GVA_LOG.Error("创建失败!", zap.Error(err))
		}
		// 再添加关联的标签
		for _, tag := range tblContent.Tags {
			var contentId = int(tblContent.ID)
			tblContentMate := blog.TblContentMeta{
				MateId:    &tag,
				ContentId: &contentId,
			}

			if err := tblContentMetaService.CreateTblContentMeta(&tblContentMate); err != nil {
				global.GVA_LOG.Error("创建失败!", zap.Error(err))
			}
		}
		response.OkWithMessage("更新成功", c)
	}
}

// FindTblContent 用id查询tblContent表
// @Tags TblContent
// @Summary 用id查询tblContent表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query blog.TblContent true "用id查询tblContent表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /tblContent/findTblContent [get]
func (tblContentApi *TblContentApi) FindTblContent(c *gin.Context) {
	var tblContent blog.TblContent
	err := c.ShouldBindQuery(&tblContent)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if retblContent, err := tblContentService.GetTblContent(tblContent.ID); err != nil {
		global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		var contentId = int(tblContent.ID)
		tblContentMeta := blog.TblContentMeta{
			ContentId: &contentId,
		}

		if list, _, err := tblContentMetaService.GetTblContentMetaInfoListByContentId(tblContentMeta); err != nil {
			global.GVA_LOG.Error("获取失败!", zap.Error(err))
			response.FailWithMessage("获取失败", c)
		} else {
			var arr []int
			for _, tblContentMetaInfo := range list {
				arr = append(arr, *tblContentMetaInfo.MateId)
			}
			retblContent.Tags = arr
		}
		response.OkWithData(gin.H{"retblContent": retblContent}, c)
	}
}

// GetTblContentList 分页获取tblContent表列表
// @Tags TblContent
// @Summary 分页获取tblContent表列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query blogReq.TblContentSearch true "分页获取tblContent表列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /tblContent/getTblContentList [get]
func (tblContentApi *TblContentApi) GetTblContentList(c *gin.Context) {
	var pageInfo blogReq.TblContentSearch
	err := c.ShouldBindQuery(&pageInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if list, total, err := tblContentService.GetTblContentInfoList(pageInfo); err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
	} else {
		response.OkWithDetailed(response.PageResult{
			List:     list,
			Total:    total,
			Page:     pageInfo.Page,
			PageSize: pageInfo.PageSize,
		}, "获取成功", c)
	}
}
