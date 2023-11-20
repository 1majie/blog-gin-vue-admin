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

type TblMetaApi struct {
}

var tblMetaService = service.ServiceGroupApp.BlogServiceGroup.TblMetaService


// CreateTblMeta 创建tblMeta表
// @Tags TblMeta
// @Summary 创建tblMeta表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body blog.TblMeta true "创建tblMeta表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"创建成功"}"
// @Router /tblMeta/createTblMeta [post]
func (tblMetaApi *TblMetaApi) CreateTblMeta(c *gin.Context) {
	var tblMeta blog.TblMeta
	err := c.ShouldBindJSON(&tblMeta)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := tblMetaService.CreateTblMeta(&tblMeta); err != nil {
        global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeleteTblMeta 删除tblMeta表
// @Tags TblMeta
// @Summary 删除tblMeta表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body blog.TblMeta true "删除tblMeta表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /tblMeta/deleteTblMeta [delete]
func (tblMetaApi *TblMetaApi) DeleteTblMeta(c *gin.Context) {
	var tblMeta blog.TblMeta
	err := c.ShouldBindJSON(&tblMeta)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := tblMetaService.DeleteTblMeta(tblMeta); err != nil {
        global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeleteTblMetaByIds 批量删除tblMeta表
// @Tags TblMeta
// @Summary 批量删除tblMeta表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除tblMeta表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /tblMeta/deleteTblMetaByIds [delete]
func (tblMetaApi *TblMetaApi) DeleteTblMetaByIds(c *gin.Context) {
	var IDS request.IdsReq
    err := c.ShouldBindJSON(&IDS)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := tblMetaService.DeleteTblMetaByIds(IDS); err != nil {
        global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdateTblMeta 更新tblMeta表
// @Tags TblMeta
// @Summary 更新tblMeta表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body blog.TblMeta true "更新tblMeta表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /tblMeta/updateTblMeta [put]
func (tblMetaApi *TblMetaApi) UpdateTblMeta(c *gin.Context) {
	var tblMeta blog.TblMeta
	err := c.ShouldBindJSON(&tblMeta)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := tblMetaService.UpdateTblMeta(tblMeta); err != nil {
        global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindTblMeta 用id查询tblMeta表
// @Tags TblMeta
// @Summary 用id查询tblMeta表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query blog.TblMeta true "用id查询tblMeta表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /tblMeta/findTblMeta [get]
func (tblMetaApi *TblMetaApi) FindTblMeta(c *gin.Context) {
	var tblMeta blog.TblMeta
	err := c.ShouldBindQuery(&tblMeta)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if retblMeta, err := tblMetaService.GetTblMeta(tblMeta.ID); err != nil {
        global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"retblMeta": retblMeta}, c)
	}
}

// GetTblMetaList 分页获取tblMeta表列表
// @Tags TblMeta
// @Summary 分页获取tblMeta表列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query blogReq.TblMetaSearch true "分页获取tblMeta表列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /tblMeta/getTblMetaList [get]
func (tblMetaApi *TblMetaApi) GetTblMetaList(c *gin.Context) {
	var pageInfo blogReq.TblMetaSearch
	err := c.ShouldBindQuery(&pageInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if list, total, err := tblMetaService.GetTblMetaInfoList(pageInfo); err != nil {
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
