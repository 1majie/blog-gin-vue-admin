import service from '@/utils/request'

// @Tags TblMeta
// @Summary 创建tblMeta表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.TblMeta true "创建tblMeta表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"创建成功"}"
// @Router /tblMeta/createTblMeta [post]
export const createTblMeta = (data) => {
  return service({
    url: '/tblMeta/createTblMeta',
    method: 'post',
    data
  })
}

// @Tags TblMeta
// @Summary 删除tblMeta表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.TblMeta true "删除tblMeta表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /tblMeta/deleteTblMeta [delete]
export const deleteTblMeta = (data) => {
  return service({
    url: '/tblMeta/deleteTblMeta',
    method: 'delete',
    data
  })
}

// @Tags TblMeta
// @Summary 批量删除tblMeta表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除tblMeta表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /tblMeta/deleteTblMeta [delete]
export const deleteTblMetaByIds = (data) => {
  return service({
    url: '/tblMeta/deleteTblMetaByIds',
    method: 'delete',
    data
  })
}

// @Tags TblMeta
// @Summary 更新tblMeta表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.TblMeta true "更新tblMeta表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /tblMeta/updateTblMeta [put]
export const updateTblMeta = (data) => {
  return service({
    url: '/tblMeta/updateTblMeta',
    method: 'put',
    data
  })
}

// @Tags TblMeta
// @Summary 用id查询tblMeta表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.TblMeta true "用id查询tblMeta表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /tblMeta/findTblMeta [get]
export const findTblMeta = (params) => {
  return service({
    url: '/tblMeta/findTblMeta',
    method: 'get',
    params
  })
}

// @Tags TblMeta
// @Summary 分页获取tblMeta表列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取tblMeta表列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /tblMeta/getTblMetaList [get]
export const getTblMetaList = (params) => {
  return service({
    url: '/tblMeta/getTblMetaList',
    method: 'get',
    params
  })
}

// @Tags TblMeta
// @Summary 分页获取tblMeta表列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取tblMeta表列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /tblMeta/getTblMetaListAll [get]
export const getTblMetaListAll = (params) => {
  return service({
    url: '/tblMeta/getTblMetaListAll',
    method: 'get',
    params
  })
}