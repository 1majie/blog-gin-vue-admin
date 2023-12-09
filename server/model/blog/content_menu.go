package blog

// 文章内容左侧菜单树，回显对象

type Menus struct {
	Subset      string       `json:"subset" form:"subset" gorm:"-"`           // 文章子集
	TblContents []TblContent `json:"tblContents" form:"tblContents" gorm:"-"` // 文章列表
}
