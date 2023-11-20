import service from '@/utils/request'

// @Tags TblContentMeta
// @Summary 创建tblContentMeta表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.TblContentMeta true "创建tblContentMeta表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"创建成功"}"
// @Router /tblContentMeta/createTblContentMeta [post]
export const createTblContentMeta = (data) => {
  return service({
    url: '/tblContentMeta/createTblContentMeta',
    method: 'post',
    data
  })
}

// @Tags TblContentMeta
// @Summary 删除tblContentMeta表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.TblContentMeta true "删除tblContentMeta表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /tblContentMeta/deleteTblContentMeta [delete]
export const deleteTblContentMeta = (data) => {
  return service({
    url: '/tblContentMeta/deleteTblContentMeta',
    method: 'delete',
    data
  })
}

// @Tags TblContentMeta
// @Summary 批量删除tblContentMeta表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除tblContentMeta表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /tblContentMeta/deleteTblContentMeta [delete]
export const deleteTblContentMetaByIds = (data) => {
  return service({
    url: '/tblContentMeta/deleteTblContentMetaByIds',
    method: 'delete',
    data
  })
}

// @Tags TblContentMeta
// @Summary 更新tblContentMeta表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.TblContentMeta true "更新tblContentMeta表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /tblContentMeta/updateTblContentMeta [put]
export const updateTblContentMeta = (data) => {
  return service({
    url: '/tblContentMeta/updateTblContentMeta',
    method: 'put',
    data
  })
}

// @Tags TblContentMeta
// @Summary 用id查询tblContentMeta表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.TblContentMeta true "用id查询tblContentMeta表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /tblContentMeta/findTblContentMeta [get]
export const findTblContentMeta = (params) => {
  return service({
    url: '/tblContentMeta/findTblContentMeta',
    method: 'get',
    params
  })
}

// @Tags TblContentMeta
// @Summary 分页获取tblContentMeta表列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取tblContentMeta表列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /tblContentMeta/getTblContentMetaList [get]
export const getTblContentMetaList = (params) => {
  return service({
    url: '/tblContentMeta/getTblContentMetaList',
    method: 'get',
    params
  })
}
