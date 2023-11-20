import service from '@/utils/request'

// @Tags TblContent
// @Summary 创建tblContent表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.TblContent true "创建tblContent表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"创建成功"}"
// @Router /tblContent/createTblContent [post]
export const createTblContent = (data) => {
  return service({
    url: '/tblContent/createTblContent',
    method: 'post',
    data
  })
}

// @Tags TblContent
// @Summary 删除tblContent表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.TblContent true "删除tblContent表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /tblContent/deleteTblContent [delete]
export const deleteTblContent = (data) => {
  return service({
    url: '/tblContent/deleteTblContent',
    method: 'delete',
    data
  })
}

// @Tags TblContent
// @Summary 批量删除tblContent表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除tblContent表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /tblContent/deleteTblContent [delete]
export const deleteTblContentByIds = (data) => {
  return service({
    url: '/tblContent/deleteTblContentByIds',
    method: 'delete',
    data
  })
}

// @Tags TblContent
// @Summary 更新tblContent表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.TblContent true "更新tblContent表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /tblContent/updateTblContent [put]
export const updateTblContent = (data) => {
  return service({
    url: '/tblContent/updateTblContent',
    method: 'put',
    data
  })
}

// @Tags TblContent
// @Summary 用id查询tblContent表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.TblContent true "用id查询tblContent表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /tblContent/findTblContent [get]
export const findTblContent = (params) => {
  return service({
    url: '/tblContent/findTblContent',
    method: 'get',
    params
  })
}

// @Tags TblContent
// @Summary 分页获取tblContent表列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取tblContent表列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /tblContent/getTblContentList [get]
export const getTblContentList = (params) => {
  return service({
    url: '/tblContent/getTblContentList',
    method: 'get',
    params
  })
}
