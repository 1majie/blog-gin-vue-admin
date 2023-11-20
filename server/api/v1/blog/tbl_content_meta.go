package blog

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
    "github.com/flipped-aurora/gin-vue-admin/server/model/blog"
    "github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    blogReq "github.com/flipped-aurora/gin-vue-admin/server/model/blog/request"
    "github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
    "github.com/flipped-aurora/gin-vue-admin/server/service"
    "github.com/gin-gonic/gin"
    "go.uber.org/zap"
)

type TblContentMetaApi struct {
}

var tblContentMetaService = service.ServiceGroupApp.BlogServiceGroup.TblContentMetaService


// CreateTblContentMeta 创建tblContentMeta表
// @Tags TblContentMeta
// @Summary 创建tblContentMeta表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body blog.TblContentMeta true "创建tblContentMeta表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"创建成功"}"
// @Router /tblContentMeta/createTblContentMeta [post]
func (tblContentMetaApi *TblContentMetaApi) CreateTblContentMeta(c *gin.Context) {
	var tblContentMeta blog.TblContentMeta
	err := c.ShouldBindJSON(&tblContentMeta)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := tblContentMetaService.CreateTblContentMeta(&tblContentMeta); err != nil {
        global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeleteTblContentMeta 删除tblContentMeta表
// @Tags TblContentMeta
// @Summary 删除tblContentMeta表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body blog.TblContentMeta true "删除tblContentMeta表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /tblContentMeta/deleteTblContentMeta [delete]
func (tblContentMetaApi *TblContentMetaApi) DeleteTblContentMeta(c *gin.Context) {
	var tblContentMeta blog.TblContentMeta
	err := c.ShouldBindJSON(&tblContentMeta)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := tblContentMetaService.DeleteTblContentMeta(tblContentMeta); err != nil {
        global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeleteTblContentMetaByIds 批量删除tblContentMeta表
// @Tags TblContentMeta
// @Summary 批量删除tblContentMeta表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除tblContentMeta表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /tblContentMeta/deleteTblContentMetaByIds [delete]
func (tblContentMetaApi *TblContentMetaApi) DeleteTblContentMetaByIds(c *gin.Context) {
	var IDS request.IdsReq
    err := c.ShouldBindJSON(&IDS)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := tblContentMetaService.DeleteTblContentMetaByIds(IDS); err != nil {
        global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdateTblContentMeta 更新tblContentMeta表
// @Tags TblContentMeta
// @Summary 更新tblContentMeta表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body blog.TblContentMeta true "更新tblContentMeta表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /tblContentMeta/updateTblContentMeta [put]
func (tblContentMetaApi *TblContentMetaApi) UpdateTblContentMeta(c *gin.Context) {
	var tblContentMeta blog.TblContentMeta
	err := c.ShouldBindJSON(&tblContentMeta)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := tblContentMetaService.UpdateTblContentMeta(tblContentMeta); err != nil {
        global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindTblContentMeta 用id查询tblContentMeta表
// @Tags TblContentMeta
// @Summary 用id查询tblContentMeta表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query blog.TblContentMeta true "用id查询tblContentMeta表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /tblContentMeta/findTblContentMeta [get]
func (tblContentMetaApi *TblContentMetaApi) FindTblContentMeta(c *gin.Context) {
	var tblContentMeta blog.TblContentMeta
	err := c.ShouldBindQuery(&tblContentMeta)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if retblContentMeta, err := tblContentMetaService.GetTblContentMeta(tblContentMeta.ID); err != nil {
        global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"retblContentMeta": retblContentMeta}, c)
	}
}

// GetTblContentMetaList 分页获取tblContentMeta表列表
// @Tags TblContentMeta
// @Summary 分页获取tblContentMeta表列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query blogReq.TblContentMetaSearch true "分页获取tblContentMeta表列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /tblContentMeta/getTblContentMetaList [get]
func (tblContentMetaApi *TblContentMetaApi) GetTblContentMetaList(c *gin.Context) {
	var pageInfo blogReq.TblContentMetaSearch
	err := c.ShouldBindQuery(&pageInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if list, total, err := tblContentMetaService.GetTblContentMetaInfoList(pageInfo); err != nil {
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
