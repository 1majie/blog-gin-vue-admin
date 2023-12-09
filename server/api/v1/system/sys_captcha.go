package system

import (
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/model/blog"
	blogReq "github.com/flipped-aurora/gin-vue-admin/server/model/blog/request"
	"time"

	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
	systemRes "github.com/flipped-aurora/gin-vue-admin/server/model/system/response"
	"github.com/flipped-aurora/gin-vue-admin/server/service"
	"github.com/gin-gonic/gin"
	"github.com/mojocn/base64Captcha"
	"go.uber.org/zap"
)

// 当开启多服务器部署时，替换下面的配置，使用redis共享存储验证码
// var store = captcha.NewDefaultRedisStore()
var store = base64Captcha.DefaultMemStore
var tblContentService = service.ServiceGroupApp.BlogServiceGroup.TblContentService
var tblContentMetaService = service.ServiceGroupApp.BlogServiceGroup.TblContentMetaService
var tblMetaService = service.ServiceGroupApp.BlogServiceGroup.TblMetaService

type BaseApi struct{}

// Captcha
// @Tags      Base
// @Summary   生成验证码
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Success   200  {object}  response.Response{data=systemRes.SysCaptchaResponse,msg=string}  "生成验证码,返回包括随机数id,base64,验证码长度,是否开启验证码"
// @Router    /base/captcha [post]
func (b *BaseApi) Captcha(c *gin.Context) {
	// 判断验证码是否开启
	openCaptcha := global.GVA_CONFIG.Captcha.OpenCaptcha               // 是否开启防爆次数
	openCaptchaTimeOut := global.GVA_CONFIG.Captcha.OpenCaptchaTimeOut // 缓存超时时间
	key := c.ClientIP()
	v, ok := global.BlackCache.Get(key)
	if !ok {
		global.BlackCache.Set(key, 1, time.Second*time.Duration(openCaptchaTimeOut))
	}

	var oc bool
	if openCaptcha == 0 || openCaptcha < interfaceToInt(v) {
		oc = true
	}
	// 字符,公式,验证码配置
	// 生成默认数字的driver
	driver := base64Captcha.NewDriverDigit(global.GVA_CONFIG.Captcha.ImgHeight, global.GVA_CONFIG.Captcha.ImgWidth, global.GVA_CONFIG.Captcha.KeyLong, 0.7, 80)
	// cp := base64Captcha.NewCaptcha(driver, store.UseWithCtx(c))   // v8下使用redis
	cp := base64Captcha.NewCaptcha(driver, store)
	id, b64s, err := cp.Generate()
	if err != nil {
		global.GVA_LOG.Error("验证码获取失败!", zap.Error(err))
		response.FailWithMessage("验证码获取失败", c)
		return
	}
	response.OkWithDetailed(systemRes.SysCaptchaResponse{
		CaptchaId:     id,
		PicPath:       b64s,
		CaptchaLength: global.GVA_CONFIG.Captcha.KeyLong,
		OpenCaptcha:   oc,
	}, "验证码获取成功", c)
}
func (b *BaseApi) FindTblContent(c *gin.Context) {
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
		// 获取文章内容左侧目录树
		menus, _ := GetTblContentSubsets(retblContent.BlogSet)
		// 获取标签信息
		var contentId = int(retblContent.ID)
		tblContentMeta := blog.TblContentMeta{
			ContentId: &contentId,
		}
		if list, _, err := tblContentMetaService.GetTblContentMetaInfoListByContentId(tblContentMeta); err != nil {
			global.GVA_LOG.Error("获取失败!", zap.Error(err))
			response.FailWithMessage("获取失败", c)
		} else {
			var arr []string
			for _, tblContentMetaInfo := range list {
				id := uint(*tblContentMetaInfo.MateId)
				meta, _ := tblMetaService.GetTblMeta(id)
				arr = append(arr, meta.Name)
			}
			retblContent.TagsView = arr
			fmt.Println(arr)
		}
		response.OkWithData(gin.H{"retblContent": retblContent, "menus": menus}, c)
	}
}

// 根据文章集获取文章内容右侧目录

func GetTblContentSubsets(set string) (meues []blog.Menus, err error) {
	if len(set) == 0 {
		return meues, err
	}
	var results []blog.Results
	if results, err = tblContentService.GetTblContentSubsets(set); err != nil {
		global.GVA_LOG.Error("查询失败!", zap.Error(err))
	}
	for _, result := range results {
		var tblContent []blog.TblContent
		if tblContent, err = tblContentService.GetTblContents(result.Subset); err != nil {
			global.GVA_LOG.Error("查询失败!", zap.Error(err))
		}
		menue := blog.Menus{
			Subset:      result.Subset,
			TblContents: tblContent,
		}
		meues = append(meues, menue)
	}
	return meues, err
}

// UpdateTblContentViewNum 更新tblContent表
// @Tags TblContent
// @Summary 更新tblContent表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body blog.TblContent true "更新tblContent表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /tblContent/updateTblContent [put]
func (b *BaseApi) UpdateTblContentViewNum(c *gin.Context) {
	var tblContent blog.TblContent
	err := c.ShouldBindQuery(&tblContent)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := tblContentService.UpdateTblContentViewNum(tblContent.ID); err != nil {
		global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// GetTblContentList
// @Tags      Base
// @Summary   获取文章列表
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     current  query  int  false  "分页索引"
// @Param     pageSize query  int  false  "分页大小"
// @Success   200  {object}  response.Response{data=response.PageResult,msg=string}  "获取文章列表,返回包括列表,总数,
func (b *BaseApi) GetTblContentList(c *gin.Context) {
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
		result := response.PageResult{
			List:     list,
			Total:    total,
			Page:     pageInfo.Page,
			PageSize: pageInfo.PageSize,
		}
		response.OkWithDetailed(result, "获取成功", c)
	}
}

// 类型转换
func interfaceToInt(v interface{}) (i int) {
	switch v := v.(type) {
	case int:
		i = v
	default:
		i = 0
	}
	return
}
