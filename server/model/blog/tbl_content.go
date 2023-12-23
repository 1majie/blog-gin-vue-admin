// 自动生成模板TblContent
package blog

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"time"
)

// tblContent表 结构体  TblContent
type TblContent struct {
	global.GVA_MODEL
	AllowComment string     `json:"allowComment" form:"allowComment" gorm:"column:allow_comment;comment:是否允许评论;size:255;"` //是否允许评论
	AuthorId     *uint      `json:"authorId" form:"authorId" gorm:"column:author_id;comment:作者ID;size:19;"`                    //作者ID
	CommentsNum  *int       `json:"commentsNum" form:"commentsNum" gorm:"column:comments_num;comment:内容所属评论数;size:10;"`   //内容所属评论数
	Content      string     `json:"content" form:"content" gorm:"column:content;comment:内容文字;size:1000000000"`               //内容文字
	CreateTime   *time.Time `json:"createTime" form:"createTime" gorm:"column:create_time;comment:创建时间;"`                    //创建时间
	DownNum      *int       `json:"downNum" form:"downNum" gorm:"column:down_num;comment:踩数量;size:10;default:0;"`             //踩数量
	Img          string     `json:"img" form:"img" gorm:"column:img;comment:内容图片路径;size:255;"`                             //内容图片路径
	LikesNum     *int       `json:"likesNum" form:"likesNum" gorm:"column:likes_num;comment:点赞数量;size:10;default:0;"`        //点赞数量
	Sequence     *int       `json:"sequence" form:"sequence" gorm:"column:sequence;comment:内容顺序;size:10;"`                   //内容顺序
	Password     string     `json:"password" form:"password" gorm:"column:password;comment:保护密码;size:255;"`                  //保护密码
	ShareNum     *int       `json:"shareNum" form:"shareNum" gorm:"column:share_num;comment:分享数量;size:10;default:0;"`        //分享数量
	Status       string     `json:"status" form:"status" gorm:"column:status;comment:内容状态;size:255;"`                        //内容状态
	Summary      string     `json:"summary" form:"summary" gorm:"column:summary;comment:内容摘要;size:255;"`                     //内容摘要
	Title        string     `json:"title" form:"title" gorm:"column:title;comment:内容标题;size:255;"`                           //内容标题
	Type         string     `json:"type" form:"type" gorm:"column:type;comment:内容类别;size:255;"`                              //内容类别
	BlogSet      string     `json:"blogSet" form:"blogSet" gorm:"column:blog_set;comment:文章集;size:255;"`                      //文章集
	Subset       string     `json:"subset" form:"subset" gorm:"column:subset;comment:文章子集;size:255;"`                        //文章子集
	EditType     string     `json:"editType" form:"editType" gorm:"column:edit_type;comment:编辑器类型;size:255;""`              //编辑器类型 md base
	Tags         []int      `json:"tags" form:"tags" gorm:"-"`                                                                   //提交标签 不存储
	TagsView     []string   `json:"tagsView" form:"tagsView" gorm:"-"`                                                           //展示标签 不存储
	UpdateTime   *time.Time `json:"updateTime" form:"updateTime" gorm:"column:update_time;comment:修改时间;"`                    //修改时间
	ViewNum      *int       `json:"viewNum" form:"viewNum" gorm:"column:view_num;comment:浏览数量;size:10;default:0;"`           //浏览数量
}

// TableName tblContent表 TblContent自定义表名 tbl_content
func (TblContent) TableName() string {
	return "tbl_content"

}
